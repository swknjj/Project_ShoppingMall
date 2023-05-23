package com.icia.ShoppingMall.Repository;

import com.icia.ShoppingMall.DTO.AddressDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AddressRepository {
    @Autowired
    SqlSessionTemplate sql;

    public void userAddress(AddressDTO addressDTO) {
        sql.insert("Address.userAddress",addressDTO);
    }

    public List<AddressDTO> findByAddress(Long user_Id) {
        return sql.selectList("Address.findByAddress",user_Id);
    }

    public List<AddressDTO> findByOrderAddress(Long user_id) {
        return sql.selectList("Address.findByOrderAddress",user_id);
    }
}
