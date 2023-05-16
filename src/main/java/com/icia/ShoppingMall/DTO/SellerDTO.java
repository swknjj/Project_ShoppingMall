package com.icia.ShoppingMall.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class SellerDTO {
    Long seller_id; // 판매자아이디
    Long user_id; // 회원아이디
    String company_name; // 회사이름
    String representative; // 대표자이름
    String address; // 사업장소재지
    String customer_center; // 고객센터
    String email; // 이메일
    Long registration_num; // 사업자등록번호
}
