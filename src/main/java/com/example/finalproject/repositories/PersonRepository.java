package com.example.finalproject.repositories;

import com.example.finalproject.models.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Repository
public interface PersonRepository extends JpaRepository<Person, Integer> {
    Optional<Person> findByLogin(String login);


    @Transactional
    @Query(value = "update person set role = %?2% where id = %?1%", nativeQuery = true)
    void updateRole(@Param("id")int id, String role);

    @Transactional
    @Query(value="select distinct role from person",nativeQuery = true)
    Object findAllRoles();
}
