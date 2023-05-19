package com.icia.ShoppingMall.Service;

import com.icia.ShoppingMall.DTO.Product_categoryDTO;
import com.icia.ShoppingMall.Repository.Product_Category_Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Product_Category_Service {
    @Autowired
    Product_Category_Repository product_category_repository;

    public List<Product_categoryDTO> findAllCategory() {
        List<Product_categoryDTO> product_categoryDTOList = product_category_repository.findAllCategory();
        return product_categoryDTOList;
    }
}
