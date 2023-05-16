package com.icia.ShoppingMall.Repository;

import com.icia.ShoppingMall.DTO.UserDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public UserDTO findByNickName(String nickname) {
        return sql.selectOne("User.findByNickname",nickname);
    }
}
