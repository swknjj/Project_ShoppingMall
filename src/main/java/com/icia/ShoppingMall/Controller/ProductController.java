package com.icia.ShoppingMall.Controller;

import com.icia.ShoppingMall.DTO.*;
import com.icia.ShoppingMall.Page.PageDTO;
import com.icia.ShoppingMall.Service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    @Autowired
    private ReviewService reviewService;
    @Autowired
    private InquiryService inquiryService;

    // 상품등록 페이지로 이동
    @GetMapping("/product/productSave")
    public String productSaveForm(HttpSession session, Model model) {

        String nickname = (String) session.getAttribute("nickname");
        UserDTO userDTO = userService.findByNickname(nickname);
        SellerDTO sellerDTO = sellerService.findBySeller(userDTO.getUser_id());

        if (sellerDTO != null) {
            List<Product_categoryDTO> product_categoryDTOList = product_category_service.findAllCategory();
            model.addAttribute("userDTO", userDTO.getUser_id());
            model.addAttribute(("sellerDTO"), sellerDTO.getSeller_id());
            model.addAttribute("list", product_categoryDTOList);
            return "/ProductPages/ProductSave";
        } else {
            return "Response/nullPointSellerDTO";
        }
    }

    // 상품등록 처리
    @PostMapping("/product/productSave")
    public String productSave(@ModelAttribute ProductDTO productDTO, Option1 option1, Option2 option2) throws IOException {

        ProductDTO dto = productService.productSave(productDTO);
        System.out.println("dto= " + dto);
        if (option1 != null && !option1.getContent1().isEmpty()) {
            Product_option1DTO product_option1DTO = new Product_option1DTO();
            product_option1DTO.setProduct_id(dto.getProduct_id());
            product_option1DTO.setContent(option1.getContent1());
            if (dto.getDiscount_rate() != 0) {
                product_option1DTO.setPrice(dto.getSpecial_price());
            } else {
                product_option1DTO.setPrice(dto.getPrice());
            }
            product_option1DTO.setStock(option1.getStock1());
            Product_option1DTO optionDTO1 = productService.option1save(product_option1DTO);
//            if(option2 != null && !option2.getContent2().isEmpty()) {
//                Product_option2DTO product_option2DTO = new Product_option2DTO();
//                product_option2DTO.setOption_id(optionDTO1.getOption_id());
//                product_option2DTO.setContent(option2.getContent2());
//                product_option2DTO.setPrice(option2.getPrice2());
//                product_option2DTO.setStock(option2.getStock2());
//                productService.option2save(product_option2DTO);
//            }
        }
        return "redirect:/";
    }

    // 상품리스트 이동
    @GetMapping("/product/productListForm")
    public String productListForm(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                                  @RequestParam(value = "q", required = false, defaultValue = "") String q,
                                  @RequestParam(value = "type", required = false, defaultValue = "brand") String type,
                                  Model model, HttpSession session) {
        List<Product_categoryDTO> product_categoryDTOList = product_category_service.findAllCategory();
        String result = (String) session.getAttribute("nickname");
        List<ProductDTO> productDTOList = null;
        PageDTO pageDTO = null;
        if (result == null) {
            return "/Response/notfound";
        }
        if (q.equals("")) {
            productDTOList = productService.findAll(page);
            pageDTO = productService.pagingParam(page);
        } else {
            productDTOList = productService.search(page, type, q);
            pageDTO = productService.pagingSearchParam(page, type, q);
        }
        model.addAttribute("list", product_categoryDTOList);
        model.addAttribute("productDTOList", productDTOList);
        model.addAttribute("paging", pageDTO);
        model.addAttribute("q", q);
        model.addAttribute("type", type);
        return "/ProductPages/ProductList";
    }

    //     상품리스트 상세이동
    @GetMapping("/product/productList")
    public String productList(@RequestParam("category_id") Long category_id, Model model) {
        List<Product_categoryDTO> product_categoryDTOAllList = product_category_service.findAllCategory();
        model.addAttribute("list", product_categoryDTOAllList);
        List<ProductDTO> productDTOList = productService.findCategory(category_id);
        model.addAttribute("productDTOList", productDTOList);
        return "/ProductPages/ProductList";
    }

    @GetMapping("/product/productDetail")
    public String productDetail(@RequestParam("product_id") Long id, Model model,HttpSession session) {
        ProductDTO productDTO = productService.findDTO(id);
        model.addAttribute("productDTO", productDTO);
        List<Product_imageDTO> product_imageDTOList = productService.findFile(id);
        if (product_imageDTOList == null) {
            model.addAttribute("imageDTO", null);
        }
        model.addAttribute("imageDTO", product_imageDTOList);
        SellerDTO sellerDTO = sellerService.findByIdSeller(productDTO.getSeller_id());
        model.addAttribute("sellerDTO", sellerDTO);
        Product_option1DTO product_option1DTO = productService.findOption1(productDTO.getProduct_id());
//        Product_option2DTO product_option2DTO = productService.findOption2(product_option1DTO.getOption_id());
        model.addAttribute("option1", product_option1DTO);
//        if(product_option2DTO != null) {
//            model.addAttribute("option2",product_option2DTO);
//        }
        List<ReviewDTO> reviewDTOList = reviewService.productReviewAll(productDTO.getProduct_id());
        model.addAttribute("reviewDTOList",reviewDTOList);

        int count_review = reviewService.findProductReviewCount(productDTO.getProduct_id());
        model.addAttribute("reviewCount",count_review);

        List<InquiryDTO> inquiryDTOList = inquiryService.findByProductInquiryList(productDTO.getProduct_id());
        model.addAttribute("inquiryDTOList",inquiryDTOList);

        int count_inquiry = inquiryService.findByProductInquiryCount(productDTO.getProduct_id());
        model.addAttribute("inquiryCount",count_inquiry);

        String nickname = (String) session.getAttribute("nickname");
        UserDTO userDTO = userService.findByNickname(nickname);
        model.addAttribute("userDTO",userDTO);
        return "/ProductPages/ProductDetail";
    }

    // 상품 삭제
    @GetMapping("/product/delete")
    public String productDelete(@RequestParam("product_id")Long product_id) {
        System.out.println(product_id);
        return "redirect:/";
    }

}
