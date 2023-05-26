package com.icia.ShoppingMall.Service;

import com.icia.ShoppingMall.DTO.ReviewDTO;
import com.icia.ShoppingMall.Repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class ReviewService {
    @Autowired
    private ReviewRepository reviewRepository;

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
}
