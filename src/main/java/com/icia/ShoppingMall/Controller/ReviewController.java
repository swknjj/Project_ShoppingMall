package com.icia.ShoppingMall.Controller;

import com.icia.ShoppingMall.DTO.ReviewDTO;
import com.icia.ShoppingMall.DTO.UserDTO;
import com.icia.ShoppingMall.Service.ReviewService;
import com.icia.ShoppingMall.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        int count = reviewService.findProductReviewCount(dto.getProduct_id());
        if(dto==null){
            return new ResponseEntity<>(reviewDTOList,HttpStatus.CONFLICT);
        }
        Map<String,Object> reviewDetail = new HashMap<>();
        reviewDetail.put("count",count);
        reviewDetail.put("reviewDTOList",reviewDTOList);
        return new ResponseEntity<>(reviewDetail, HttpStatus.OK);
    }

    // 리뷰 목록으로
    @GetMapping("/review/reviewList")
    public String reviewListForm(HttpSession session, Model model) {
        String nickname = (String) session.getAttribute("nickname");
        UserDTO userDTO = userService.findByNickname(nickname);
        List<ReviewDTO> reviewDTOList = reviewService.userReviewAll(userDTO.getUser_id());
        model.addAttribute("reviewDTOList",reviewDTOList);
        return "/UserPages/UserDetail/UserReviewList";

    }

}
