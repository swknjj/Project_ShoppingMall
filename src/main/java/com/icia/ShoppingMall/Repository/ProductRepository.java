package com.icia.ShoppingMall.Repository;

import com.icia.ShoppingMall.DTO.ProductDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public void productSave(ProductDTO productDTO) {
        sql.insert("Product.productSave",productDTO);
    }
}
