package com.icia.ShoppingMall.Controller;

import com.icia.ShoppingMall.DTO.UserDTO;
import com.icia.ShoppingMall.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
    @Autowired
    UserService userService;
    // 유저 가입 화면
    @GetMapping("/user/save")
    public String userSaveForm() {
        return "/UserPages/UserSave";
    }
    // 유저 닉네임 중복체크(ajax)
    @PostMapping("/nickname-check")
    public ResponseEntity nickname_check(@RequestParam("nickname_check")String nickname) {
        UserDTO userDTO = userService.findByNickname(nickname);
        System.out.println("userDTO = " + userDTO);
        if(userDTO == null) {
            return new ResponseEntity<>(userDTO, HttpStatus.OK);
        }else {
            return new ResponseEntity<>(userDTO, HttpStatus.CONFLICT);
        }
    }
    @PostMapping("/user/save")
    public String userSave(@ModelAttribute UserDTO userDTO){
        System.out.println("userDTO = " + userDTO);
        return "index";
    }
}
