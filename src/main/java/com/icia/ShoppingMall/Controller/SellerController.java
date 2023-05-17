package com.icia.ShoppingMall.Controller;

import com.icia.ShoppingMall.Service.SellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class SellerController {
    @Autowired
    private SellerService sellerService;
}
