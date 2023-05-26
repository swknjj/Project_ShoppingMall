package com.icia.ShoppingMall.Controller;

import com.icia.ShoppingMall.DTO.InquiryDTO;
import com.icia.ShoppingMall.DTO.UserDTO;
import com.icia.ShoppingMall.Service.InquiryService;
import com.icia.ShoppingMall.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class InquiryController {
    @Autowired
    private InquiryService inquiryService;
    @Autowired
    private UserService userService;

    @PostMapping("/inquiry-save")
    public ResponseEntity inquirySave(@ModelAttribute InquiryDTO inquiryDTO, HttpSession session) {
        Map<String,Long> id_key = new HashMap<>();
        id_key.put("user_id",inquiryDTO.getUser_id());
        id_key.put("product_id",inquiryDTO.getProduct_id());
        List<InquiryDTO> orderList = inquiryService.is_buy(id_key);
        if(orderList.size()==0){
            inquiryDTO.setIs_buy("false");
        }else {
            inquiryDTO.setIs_buy("true");
        }
        InquiryDTO dto = inquiryService.inquirySave(inquiryDTO);
        List<InquiryDTO> inquiryDTOList = inquiryService.findByProductInquiryList(inquiryDTO.getProduct_id());
        int count_inquiry = inquiryService.findByProductInquiryCount(inquiryDTO.getProduct_id());
        if(dto==null){
            return new ResponseEntity<>(dto,HttpStatus.CONFLICT);

        }
        Map<String,Object> inquiryDetail = new HashMap<>();
        String nickname = (String) session.getAttribute("nickname");
        UserDTO userDTO = userService.findByNickname(nickname);
        inquiryDetail.put("count",count_inquiry);
        inquiryDetail.put("inquiryDTOList",inquiryDTOList);
        inquiryDetail.put("user_id",userDTO.getUser_id());
        return new ResponseEntity<>(inquiryDetail, HttpStatus.OK);
    }
}
