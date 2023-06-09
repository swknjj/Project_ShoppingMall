package com.icia.ShoppingMall.Service;

import com.icia.ShoppingMall.DTO.ReviewDTO;
import com.icia.ShoppingMall.Repository.ProductRepository;
import com.icia.ShoppingMall.Repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ReviewService {
    @Autowired
    private ReviewRepository reviewRepository;
    @Autowired
    private ProductRepository productRepository;

    public ReviewDTO reviewSave(ReviewDTO reviewDTO) throws IOException {
        if(reviewDTO.getFile() != null) {
            String originalFileName = reviewDTO.getFile().getOriginalFilename();
            String storedFileName = System.currentTimeMillis() + originalFileName;
            String savePath = "D:\\SpringFramework_img\\" + storedFileName;
            reviewDTO.getFile().transferTo(new File(savePath));
            reviewDTO.setReview_image(originalFileName);
            reviewDTO.setStoredFileName(storedFileName);
        }
        ReviewDTO dto = reviewRepository.reviewSave(reviewDTO);

        int product_cnt = reviewRepository.findProductReviewCount(reviewDTO.getProduct_id());
        Long product_avg = reviewRepository.findProductReviewAvg(reviewDTO.getProduct_id());
        Map<String,Object> reviewResult = new HashMap<>();
        reviewResult.put("product_cnt",product_cnt);
        reviewResult.put("product_avg",product_avg);
        reviewResult.put("product_id",reviewDTO.getProduct_id());
        productRepository.updateCntandAvg(reviewResult);
        return dto;
    }


    public List<ReviewDTO> productReviewAll(Long product_id) {
        List<ReviewDTO> reviewDTOList = reviewRepository.productReviewAll(product_id);
        return reviewDTOList;
    }

    public int findProductReviewCount(Long product_id) {
        int count = reviewRepository.findProductReviewCount(product_id);
        return count;
    }

    public List<ReviewDTO> userReviewAll(Long user_id) {
        List<ReviewDTO> reviewDTOList = reviewRepository.userReviewAll(user_id);
        return reviewDTOList;
    }
}
