package com.icia.ShoppingMall.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter

public class Product_categoryDTO {
    Long category_id; // 카테고리 아이디
    String name; // 카테고리 이름
}
