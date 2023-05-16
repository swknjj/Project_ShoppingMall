package com.icia.ShoppingMall.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter

public class Product_option1DTO {
    Long option_id; // 옵션아이디
    Long product_id; // 상품아이디
    String content; // 내용
    Long price; // 가격
    Long stock; // 재고
}
