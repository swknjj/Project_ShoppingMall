package com.icia.ShoppingMall.Service;

import com.icia.ShoppingMall.DTO.OrderDTO;
import com.icia.ShoppingMall.Repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    public void orderSave(OrderDTO orderDTO) {
        orderRepository.orderSave(orderDTO);
    }
}
