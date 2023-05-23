package com.icia.ShoppingMall.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Product_option2DTO {
    Long option_content_id; // 옵션내용아이디
    Long option_id; // 옵션아이디
    String content; // 내용
    int price; // 가격
    Long stock; // 재고
}
