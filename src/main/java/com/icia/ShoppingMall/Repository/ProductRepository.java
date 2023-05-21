package com.icia.ShoppingMall.Repository;

import com.icia.ShoppingMall.DTO.ProductDTO;
import com.icia.ShoppingMall.DTO.Product_categoryDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public void productSave(ProductDTO productDTO) {
        sql.insert("Product.productSave",productDTO);
    }
    public List<ProductDTO> findCategory(Long category_id) {
        return sql.selectList("Product.findCategory",category_id);
    }

    public List<ProductDTO> findAll() {
        return sql.selectList("Product.findAll");
    }

    public int total() {
        return sql.selectOne("Product.total");
    }
}
