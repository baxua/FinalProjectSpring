package com.example.finalproject.services;
import com.example.finalproject.models.Order;
import com.example.finalproject.models.Product;
import com.example.finalproject.repositories.OrderRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@Transactional
public class OrderService {
    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {

        this.orderRepository = orderRepository;
    }



    public Order getOrdertId(int id){
        Optional<Order> optionalOrder = orderRepository.findById(id);
        return optionalOrder.orElse(null);
    }

    @Transactional
    public void updateOrder(int id, Order order){
        order.setId(id);
        orderRepository.save(order);
    }
}
