package com.icia.ShoppingMall.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@ToString
@Setter
@Getter
public class ReviewDTO {
    Long review_id; // 리뷰아이디
    Long user_id; // 회원아이디/
    Long product_id; // 상품아이디
    Long seller_id; // 판매자아이디/
    Long rating; // 별점
    MultipartFile file;
    String review_image; // 리뷰이미지
    String storedFileName;
    String content; // 내용
    Long liked; // 도움이되요
    String status; // 상태(차단유무)
    Timestamp created_at; // 작성일자

}
