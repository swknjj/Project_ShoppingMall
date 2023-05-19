package com.icia.ShoppingMall.Controller;

import com.icia.ShoppingMall.DTO.ProductDTO;
import com.icia.ShoppingMall.DTO.Product_categoryDTO;
import com.icia.ShoppingMall.DTO.SellerDTO;
import com.icia.ShoppingMall.DTO.UserDTO;
import com.icia.ShoppingMall.Service.ProductService;
import com.icia.ShoppingMall.Service.Product_Category_Service;
import com.icia.ShoppingMall.Service.SellerService;
import com.icia.ShoppingMall.Service.UserService;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private UserService userService;
    @Autowired
    private SellerService sellerService;
    @Autowired
    private Product_Category_Service product_category_service;

    // 상품등록 페이지로 이동
    @GetMapping("/product/productSave")
    public String productSaveForm(HttpSession session, Model model) {
        String nickname = (String)session.getAttribute("nickname");
        UserDTO userDTO = userService.findByNickname(nickname);
        SellerDTO sellerDTO = sellerService.findBySeller(userDTO.getUser_id());
        List<Product_categoryDTO> product_categoryDTOList = product_category_service.findAllCategory();
        model.addAttribute("userDTO",userDTO.getUser_id());
        model.addAttribute(("sellerDTO"),sellerDTO.getSeller_id());
        model.addAttribute("list",product_categoryDTOList);
        return "/ProductPages/ProductSave";
    }

    // 상품등록 처리
    @PostMapping("/product/productSave")
    public String productSave(@ModelAttribute ProductDTO productDTO) throws IOException {
        productService.productSave(productDTO);
        return "redirect:/";
    }

    // 상품리스트 이동
    @GetMapping("/product/productList")
    public String productList() {

        return "/ProductPages/ProductList";
    }

}
