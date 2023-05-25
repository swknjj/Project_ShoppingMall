package com.icia.ShoppingMall.Repository;

import com.icia.ShoppingMall.DTO.ReviewDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReviewRepository {
    @Autowired
    SqlSessionTemplate sql;

    public ReviewDTO reviewSave(ReviewDTO reviewDTO) {
        sql.insert("Review.reviewSave",reviewDTO);
        return reviewDTO;
    }

    public List<ReviewDTO> productReviewAll(Long product_id) {
        return sql.selectList("Review.productReviewAll",product_id);
    }
}
