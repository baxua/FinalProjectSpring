package com.example.finalproject.repositories;

import com.example.finalproject.models.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {
    com.example.finalproject.models.Category findByName(String name);
}
