package com.icia.ShoppingMall.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

@ToString
@Setter
@Getter

public class InquiryDTO {
    Long inquiry_id; // 문의아이디/
    Long user_id; // 회원아이디/
    Long product_id; // 상품아이디
    Long seller_id; // 판매자아이디
    String is_buy; // 구매여부/
    String is_private; // 비밀글여부
    String is_answered; // 답변여부/
    Timestamp created_at; // 작성일자/
    String category; // 카테고리
    String content; // 내용


}
