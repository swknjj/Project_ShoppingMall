package com.icia.ShoppingMall.DTO;

import lombok.*;

@Getter
@ToString
@Setter
@Data
public class AddressDTO {
    Long address_id; // 배송지아이디
    Long user_id; // 회원아이디
    String address_name; // 배송지명
    String receiver; // 받는사람
    String phone_number; // 연락처
    String zipcode;
    String address1; // 주소1
    String address2; // 주소2
    String reference; // 참고사항
    String isdefault; // 체크받기
    boolean is_default = false; // 기본배송지 여부
    public void setIs_default(boolean is_default) {
        this.is_default = is_default;
    }
}
