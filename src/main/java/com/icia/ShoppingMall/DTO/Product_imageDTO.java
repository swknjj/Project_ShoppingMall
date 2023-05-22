package com.icia.ShoppingMall.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

@ToString
@Getter
@Setter
public class Product_imageDTO {
    Long image_id; // 사진아이디
    Long product_id; // 상품아이디
    Long seller_id; // 판매자아이디
    String file_name; // 파일이름
    String storedFileName; // 변형파일
    Timestamp created_at; // 생성일
    Timestamp updated_at; // 수정일
}
