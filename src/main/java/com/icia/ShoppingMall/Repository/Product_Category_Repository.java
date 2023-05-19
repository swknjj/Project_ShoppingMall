package com.icia.ShoppingMall.Repository;

import com.icia.ShoppingMall.DTO.Product_categoryDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class Product_Category_Repository {
    @Autowired
    private SqlSessionTemplate sql;

    public List<Product_categoryDTO> findAllCategory() {
        return sql.selectList("Product_Category.findAllCategory");
    }


}
