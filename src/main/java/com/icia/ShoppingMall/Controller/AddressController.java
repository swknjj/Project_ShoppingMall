package com.icia.ShoppingMall.Controller;

import com.icia.ShoppingMall.DTO.AddressDTO;
import com.icia.ShoppingMall.DTO.UserDTO;
import com.icia.ShoppingMall.Service.AddressService;
import com.icia.ShoppingMall.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AddressController {
    @Autowired
    AddressService addressService;
    @Autowired
    UserService userService;

    // 본인 배송지 선택하는 화면
    @GetMapping("/user/userAddress")
    public String userAddressForm(Model model, HttpSession session) {
        String nickname = (String)session.getAttribute("nickname");
        UserDTO userDTO = userService.findByNickname(nickname);
        List<AddressDTO> addressDTOList = addressService.findByAddress(userDTO.getUser_id());
        model.addAttribute("userDTO",userDTO);
        model.addAttribute("addressDTOList",addressDTOList);
        return "/AdressPages/Address";
    }
    // 배송지 설정 쿼리
    @PostMapping("/user/userAddress")
    public String userAddress(@ModelAttribute AddressDTO addressDTO) {
        if(addressDTO.getIsdefault()!=null){
            addressDTO.setIs_default(true);
        }
        addressService.userAddress(addressDTO);
        return "redirect:/";
    }

}
