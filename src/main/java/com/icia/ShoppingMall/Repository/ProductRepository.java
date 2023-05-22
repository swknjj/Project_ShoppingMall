package com.icia.ShoppingMall.Repository;

import com.icia.ShoppingMall.DTO.ProductDTO;
import com.icia.ShoppingMall.DTO.Product_categoryDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public List<ProductDTO> findAll(Map<String,Integer> pagingParams) {
        return sql.selectList("Product.findAll",pagingParams);
    }

    public int total() {
        return sql.selectOne("Product.total");
    }

    public List<ProductDTO> search(Map<String, Object> pagingParams) {
        return sql.selectList("Product.search",pagingParams);
    }

    public int searchCount(Map<String, Object> pagingParams) {
        return sql.selectOne("Product.searchCount",pagingParams);
    }
}
