package com.icia.ShoppingMall.Controller;

import com.icia.ShoppingMall.DTO.SellerDTO;
import com.icia.ShoppingMall.DTO.UserDTO;
import com.icia.ShoppingMall.Service.SellerService;
import com.icia.ShoppingMall.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class SellerController {
    @Autowired
    private SellerService sellerService;
    @Autowired
    private UserService userService;

    @GetMapping("/seller/index")
    public String sellerIndex(HttpSession session) {
        String nickname = (String)session.getAttribute("nickname");
        UserDTO userDTO = userService.findByNickname(nickname);
        SellerDTO sellerDTO = sellerService.findBySeller(userDTO.getUser_id());
        if(sellerDTO == null){
            return "/Response/nullPointSellerDTO";
        }
        return "redirect:/seller/detail";
    } //

    // 판매자 등록 페이지로 이동
    @GetMapping("/seller/save")
    public String sellerSave(Model model,HttpSession session) {
        String nickname = (String)session.getAttribute("nickname");
        UserDTO userDTO = userService.findByNickname(nickname);
        model.addAttribute("userDTO",userDTO);
        return "/SellerPages/SellerSave";
    } //

    // 사업자등록번호 중복체크 ajax
    @PostMapping("/seller/num_check")
    public ResponseEntity sellerNum_check(@RequestParam("registration_num")Long reg) {
        SellerDTO sellerDTO = sellerService.sellerNum_check(reg);
        if(sellerDTO==null) {
            return new ResponseEntity<>(sellerDTO, HttpStatus.OK);
        }else {
            return new ResponseEntity<>(sellerDTO,HttpStatus.CONFLICT);
        }
    } //
    // 판매자 등록 쿼리
    @PostMapping("/seller/save")
    public String sellerSave(@ModelAttribute SellerDTO sellerDTO) {
        sellerService.sellerSave(sellerDTO);
        return "redirect:/";
    } //
    // 본인 판매자 정보 확인
    @GetMapping("/seller/detail")
    public String sellerDetailForm(HttpSession session,Model model) {
        String nickname = (String)session.getAttribute("nickname");
        UserDTO userDTO = userService.findByNickname(nickname);
        SellerDTO sellerDTO = sellerService.findBySeller(userDTO.getUser_id());
        if(sellerDTO==null){
            return "/Response/error";
        }else {
            model.addAttribute("sellerDTO",sellerDTO);
            return "/SellerPages/SellerDetail/SellerDetail";
        }
    } //
    // 판매자정보 수정 화면
    @GetMapping("/seller/update")
    public String sellerUpdateForm(HttpSession session,Model model) {
        String nickname = (String)session.getAttribute("nickname");
        UserDTO userDTO = userService.findByNickname(nickname);
        SellerDTO sellerDTO = sellerService.findBySeller(userDTO.getUser_id());
        if(sellerDTO==null){
            return "/Response/error";
        }else {
            model.addAttribute("sellerDTO",sellerDTO);
            return "/SellerPages/SellerDetail/SellerUpdate";
        }
    } //

    // 판매자정보 수정 쿼리
    @PostMapping("/seller/update")
    public String sellerUpdate(@ModelAttribute SellerDTO sellerDTO) {
        sellerService.sellerUpdate(sellerDTO);
        return "redirect:/";
    } //

    // 판매자 삭제 쿼리
    @GetMapping("/seller/delete")
    public String sellerDelete(@RequestParam("seller_id")Long seller_id) {
        sellerService.sellerDelete(seller_id);
        return "redirect:/";
    }


}
