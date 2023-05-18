package com.icia.ShoppingMall.Repository;

import com.icia.ShoppingMall.DTO.SellerDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellerRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public SellerDTO findBySeller(Long user_id) {
        SellerDTO sellerDTO = sql.selectOne("Seller.findBySeller",user_id);
        return sellerDTO;
    }
}
