package com.icia.ShoppingMall.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
public class UserDTO {
    Long user_id; // 회원아이디
    String email; // 이메일
    String domain;
    String password; // 비밀번호
    String birth; // 생일
    String nickname; // 닉네임
    String agree_TOS; // 이용약관동의
    String agree_PICU; // 개인정보수집 및 이용동의
    String agree_promotion; // 이벤트프로모션 메일 sms수신
    String gender; // 성별
    String role; // 역할구분(관리자,일반)
    String status; // 회원상태
    Timestamp created_at; // 가입일자
    Timestamp updated_at; // 회원정보 수정일자

}
