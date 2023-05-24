package com.icia.ShoppingMall.Repository;

import com.icia.ShoppingMall.DTO.OrderDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderRepository {
    @Autowired
    SqlSessionTemplate sql;

    public void orderSave(OrderDTO orderDTO) {
        sql.insert("Order.orderSave",orderDTO);
    }

    public List<OrderDTO> orderList(Long user_id) {
        return sql.selectList("Order.orderList",user_id);
    }
}
