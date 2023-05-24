package com.example.finalproject.repositories;

import com.example.finalproject.enumm.Status;
import com.example.finalproject.models.Order;
import com.example.finalproject.models.Person;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {
    List<Order> findByPerson(Person person);

    @Query(value = "select * from orders where SUBSTR(number, -4) like %?1%", nativeQuery = true)
    List<Order> findByLastFourChars(String number);

    @Transactional
    @Query(value = "update orders set status = %?2% where id=%?1%", nativeQuery = true)
    void updateOrder(Status status, String id);

}
