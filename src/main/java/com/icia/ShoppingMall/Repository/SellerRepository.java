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

    public SellerDTO sellerNum_check(Long reg) {
        SellerDTO sellerDTO = sql.selectOne("Seller.sellerNum_check",reg);
        return sellerDTO;
    }

    public void sellerSave(SellerDTO sellerDTO) {
        sql.insert("Seller.sellerSave",sellerDTO);
    }

    public void sellerDelete(Long seller_id) {
        sql.delete("Seller.sellerDelete",seller_id);
    }

    public void sellerUpdate(SellerDTO sellerDTO) {
        sql.update("Seller.sellerUpdate",sellerDTO);
    }
}
