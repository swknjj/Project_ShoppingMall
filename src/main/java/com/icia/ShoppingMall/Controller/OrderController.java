package com.icia.ShoppingMall.Controller;

import com.icia.ShoppingMall.DTO.*;
import com.icia.ShoppingMall.Service.AddressService;
import com.icia.ShoppingMall.Service.OrderService;
import com.icia.ShoppingMall.Service.ProductService;
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
import java.util.List;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private ProductService productService;

    @GetMapping("/order/save")
    public String orderSaveForm(@ModelAttribute OrderDTO orderDTO, HttpSession session, Model model) {
        String nickname = (String) session.getAttribute("nickname");
        UserDTO userDTO = userService.findByNickname(nickname);
        orderDTO.setUser_id(userDTO.getUser_id());
        ProductDTO productDTO = productService.findDTO(orderDTO.getProduct_id());
        List<AddressDTO> addressDTOList = addressService.findByOrderAddress(userDTO.getUser_id());
        if(productDTO.getDiscount_rate()!=0) {
            long quantity = orderDTO.getQuantity();
            long specialPrice = productDTO.getSpecial_price();
            long deliveryFee = productDTO.getDelivery_fee();

            long totalPrice = quantity * specialPrice + deliveryFee;
            int finalPrice = (int) totalPrice;

            orderDTO.setTotalPrice(finalPrice);
        }else {
            long quantity = orderDTO.getQuantity();
            long price = productDTO.getPrice();
            long deliveryFee = productDTO.getDelivery_fee();

            long totalPrice = quantity * price + deliveryFee;
            int finalPrice = (int) totalPrice;

            orderDTO.setTotalPrice(finalPrice);
        }
        if(addressDTOList.size()==0){
            return "/Response/notfoundaddress";
        }
        System.out.println("final = "+orderDTO);
        model.addAttribute("userDTO",userDTO);
        model.addAttribute("addressDTO",addressDTOList);
        model.addAttribute("orderDTO",orderDTO);
        model.addAttribute("productDTO",productDTO);
        return "/OrderPages/OrderSave";
    }

    // 오더 선택시 배송지 주소 선택하는 ajax
    @PostMapping("/address-changer")
    public ResponseEntity address_changer(@RequestParam("address_id")Long address_id){
        AddressDTO addressDTO = addressService.findByAddressOne(address_id);
        if(addressDTO != null) {
            return new ResponseEntity<>(addressDTO, HttpStatus.OK);
        }else {
            return new ResponseEntity<>(addressDTO,HttpStatus.CONFLICT);
        }
    }

    @PostMapping("/order/save")
    public String orderSave(@ModelAttribute OrderDTO orderDTO) {
        orderService.orderSave(orderDTO);
        Product_option1DTO product_option1DTO = productService.findOption1(orderDTO.getProduct_id());
        product_option1DTO.setStock(product_option1DTO.getStock()-orderDTO.getQuantity());
        productService.updateOption1(product_option1DTO);
        System.out.println("orderDTO = " + orderDTO);

        return "redirect:/";
    }
}
