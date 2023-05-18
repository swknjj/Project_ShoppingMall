package com.icia.ShoppingMall.Controller;

import com.icia.ShoppingMall.DTO.SellerDTO;
import com.icia.ShoppingMall.DTO.UserDTO;
import com.icia.ShoppingMall.Service.SellerService;
import com.icia.ShoppingMall.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

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
        return "redirect:/";
    }

    // 판매자 등록 페이지로 이동
    @GetMapping("/seller/save")
    public String sellerSave(Model model,HttpSession session) {
        String nickname = (String)session.getAttribute("nickname");
        UserDTO userDTO = userService.findByNickname(nickname);
        model.addAttribute("userDTO",userDTO);
        return "/SellerPages/SellerSave";
    }
}
