package com.icia.ShoppingMall.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.List;

@Setter
@Getter
@ToString

public class ProductDTO {
    Long product_id; // 상품 아이디
    Long seller_id; // 판매자 아이디
    Long category_id; // 카테고리 아이디
    String brand; // 브랜드
    String title; // 제목
    String image; // 대표이미지 이름
    MultipartFile img; // 대표이미지
    String storedFileName; // 변형이름
    int price; // 가격
    int discount_rate; // 할인율
    int delivery_fee; // 배송비
    int special_price; // 특가
    Timestamp created_at; // 생성일
    Timestamp updated_at; // 수정일
    Long rating_sum; // 별점 합
    Long rating_cnt; // 별점 개수
    String product_detail; // 상품디테일
    List<MultipartFile> productProfile; // 상품디테일 imageDTO에 저장될 것
}
