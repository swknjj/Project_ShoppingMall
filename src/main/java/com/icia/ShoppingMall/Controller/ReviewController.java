package com.icia.ShoppingMall.Controller;

import com.icia.ShoppingMall.DTO.ReviewDTO;
import com.icia.ShoppingMall.DTO.UserDTO;
import com.icia.ShoppingMall.Service.ReviewService;
import com.icia.ShoppingMall.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class ReviewController {
    @Autowired
    private ReviewService reviewService;
    @Autowired
    private UserService userService;

    @PostMapping("/review-save")
    public ResponseEntity reviewSave(@ModelAttribute ReviewDTO reviewDTO, HttpSession session) throws IOException {
        String nickname = (String) session.getAttribute("nickname");
        UserDTO userDTO = userService.findByNickname(nickname);
        reviewDTO.setUser_id(userDTO.getUser_id());
        ReviewDTO dto = reviewService.reviewSave(reviewDTO);
        List<ReviewDTO> reviewDTOList = reviewService.productReviewAll(dto.getProduct_id());
        for(int i=0; i<reviewDTOList.size(); i++){
            System.out.println(reviewDTOList.get(i));
        }
        if(dto==null){
            return new ResponseEntity<>(reviewDTOList,HttpStatus.CONFLICT);
        }
        return new ResponseEntity<>(reviewDTOList, HttpStatus.OK);
    }
}
