package com.icia.ShoppingMall.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
@Setter
public class AddressDTO {
    Long address_id; // 배송지아이디
    Long user_id; // 회원아이디
    String address_name; // 배송지명
    String receiver; // 받는사람
    String phone_number; // 연락처
    String address1; // 주소1
    String address2; // 주소2
    boolean is_default; // 기본배송지 여부
}
