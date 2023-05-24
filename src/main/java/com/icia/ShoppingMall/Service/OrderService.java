package com.icia.ShoppingMall.Service;

import com.icia.ShoppingMall.DTO.OrderDTO;
import com.icia.ShoppingMall.Repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    public void orderSave(OrderDTO orderDTO) {
        orderRepository.orderSave(orderDTO);
    }

    public List<OrderDTO> orderList(Long user_id) {
        List<OrderDTO> orderDTOList = orderRepository.orderList(user_id);
        return orderDTOList;
    }
}
