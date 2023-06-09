package com.icia.ShoppingMall.Repository;

import com.icia.ShoppingMall.DTO.SellerDTO;
import com.icia.ShoppingMall.DTO.UserDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public UserDTO findByNickName(String nickname) {
        return sql.selectOne("User.findByNickname",nickname);
    }

    public void userSave(UserDTO userDTO) {
        sql.insert("User.userSave",userDTO);
    }


    public UserDTO findByEmail(String email) {
        return sql.selectOne("User.findByEmail",email);
    }

    public UserDTO userLogin(UserDTO userDTO) {
        return sql.selectOne("User.userLogin",userDTO);

    }

    public UserDTO findByPassword(String emailFull) {
        return sql.selectOne("User.findByPassword",emailFull);
    }

    public void userPasswordChange(UserDTO userDTO) {
        sql.update("User.userPasswordChange",userDTO);
    }

    public void userUpdate(UserDTO userDTO) {
        sql.update("User.userUpdate",userDTO);
    }

    public void userDelete(Long id) {
        sql.delete("User.userDelete",id);
    }

    public SellerDTO findBySellerDTO(Long user_id) {
        return sql.selectOne("User.findBySellerDTO",user_id);
    }
}
