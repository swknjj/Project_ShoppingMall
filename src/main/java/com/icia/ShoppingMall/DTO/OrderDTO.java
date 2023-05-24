package com.icia.ShoppingMall.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Time;
import java.sql.Timestamp;

@Getter
@ToString
@Setter
public class OrderDTO {
    Long order_id; // 주문아이디
    Long product_id; // 상품아이디
    Long user_id; // 회원아이디
    Long seller_id; // 판매자아이디
    Long address_id; // 구매자 주소
    int quantity; // 상품여부
    String status; // 주문상태여부
    int totalPrice; // 총금액
    Timestamp updated_at; // 구매확정날짜
    Timestamp create_at; // 주문일자
    String memo; // 배송메모
}
