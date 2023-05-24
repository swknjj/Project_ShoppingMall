package com.icia.ShoppingMall.Repository;

import com.icia.ShoppingMall.DTO.OrderDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderRepository {
    @Autowired
    SqlSessionTemplate sql;

    public void orderSave(OrderDTO orderDTO) {
        sql.insert("Order.orderSave",orderDTO);
    }
}
