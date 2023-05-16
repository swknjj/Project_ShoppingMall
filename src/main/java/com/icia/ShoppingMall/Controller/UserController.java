package com.icia.ShoppingMall.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

    @GetMapping("/user/save")
    public String userSaveForm() {
        return "/UserPages/UserSave";
    }
}
