package com.icia.ShoppingMall.Repository;

import com.icia.ShoppingMall.DTO.*;
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

    public ProductDTO productSave(ProductDTO productDTO) {
        sql.insert("Product.productSave",productDTO);
        return productDTO;
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
            return sql.selectList("Product.search", pagingParams);

    }

    public int searchCount(Map<String, Object> pagingParams) {
        return sql.selectOne("Product.searchCount",pagingParams);
    }

    public void saveFile(Product_imageDTO productImageDTO) {
        sql.insert("Detail.saveFile",productImageDTO);
    }

    public ProductDTO findDTO(Long product_id) {
        return sql.selectOne("Product.findDTO",product_id);
    }

    public List<Product_imageDTO> findFile(Long product_id) {
        return sql.selectList("Detail.findFile",product_id);
    }

    public Product_option1DTO option1save(Product_option1DTO productOption1DTO) {
        sql.insert("Option.option1save",productOption1DTO);
        return productOption1DTO;
    }

    public void option2save(Product_option2DTO productOption2DTO) {
        sql.insert("Option.option2save",productOption2DTO);
    }

    public Product_option1DTO findOption1(Long product_id) {
        return sql.selectOne("Option.findOption1",product_id);
    }

    public Product_option2DTO findOption2(Long option_id) {
        return sql.selectOne("Option.findOption2",option_id);
    }

    public void updateOption1(Product_option1DTO productOption1DTO) {
        sql.update("Option.updateOption1",productOption1DTO);
    }

    public List<ProductDTO> findUserOrderList(List<Long> product_idList) {
        return sql.selectList("Product.findUserOrderList",product_idList);
    }
}
