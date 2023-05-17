package com.icia.ShoppingMall.Controller;

import java.util.*;

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

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    // 유저 가입 화면
    @GetMapping("/user/save")
    public String userSaveForm() {
        return "/UserPages/UserSave";
    }

    // 유저 로그인 화면
    @GetMapping("/user/login")
    public String userLoginForm() {
        return "/UserPages/UserLogin";
    }

    // 유저 닉네임 중복체크(ajax)
    @PostMapping("/nickname-check")
    public ResponseEntity nickname_check(@RequestParam("nickname_check") String nickname) {
        UserDTO userDTO = userService.findByNickname(nickname);
        if (userDTO == null) {
            return new ResponseEntity<>(userDTO, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(userDTO, HttpStatus.CONFLICT);
        }
    }

    // 유저 이메일 중복체크(ajax)
    @PostMapping("/email-check")
    public ResponseEntity email_check(@RequestParam("email_check") String email) {
        UserDTO userDTO = userService.findByEmail(email);
        if (userDTO == null) {
            return new ResponseEntity<>(userDTO, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(userDTO, HttpStatus.CONFLICT);
        }
    }

    // 닉네임으로 이메일 찾기(ajax)
    @PostMapping("/user/findById")
    public ResponseEntity userFindById(@RequestParam("nickname")String nickname) {
        UserDTO userDTO = userService.findByNickname(nickname);
        if(userDTO==null) {
            return new ResponseEntity<>(null,HttpStatus.NOT_FOUND);
        }else {
            return new ResponseEntity<>(userDTO.getEmail_full(),HttpStatus.OK);
        }
    }

    // 유저 등록
    @PostMapping("/user/save")
    public String userSave(@ModelAttribute UserDTO userDTO) {
        userService.userSave(userDTO);
        return "redirect:/";
    }

    // 유저 로그인 처리
    @PostMapping("/user/login")
    public String userLogin(@ModelAttribute UserDTO userDTO, HttpSession session) {
        UserDTO dto = userService.userLogin(userDTO);
        if (dto == null) {
            return "/Response/LoginFail";
        } else {
            session.setAttribute("nickname",dto.getNickname());
            return "redirect:/";
        }
    }
    // 유저 아이디 찾기 화면으로
    @GetMapping("/user/findById")
    public String userFindByIdForm() {
        return "/UserPages/UserFindById";
    }

    // 유저 비밀번호 찾기 화면으로
    @GetMapping("/user/findByPassword")
    public String userPasswordForm() {
        return "/UserPages/UserPassword";
    }

    // 유저 비밀번호 찾아서 재설정 처리 (ajax)
    @PostMapping("/user/findByPassword")
    public ResponseEntity userPassword(@RequestParam("email_full")String email_full) {
        UserDTO userDTO = userService.findByPassword(email_full);
        if(userDTO!=null) {
            return new ResponseEntity<>(userDTO,HttpStatus.OK);
        }else {
            return new ResponseEntity<>(null,HttpStatus.CONFLICT);
        }
    }

    // 유저 비밀번호 받아서 최종 수정처리
    @PostMapping("/user/userPasswordChange")
    public String userPasswordChange(@ModelAttribute UserDTO userDTO) {
        userService.userPasswordChange(userDTO);
        return "redirect:/";
    }

    // 로그아웃처리
    @GetMapping("/user/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}

