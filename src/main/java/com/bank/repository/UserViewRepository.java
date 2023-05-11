package com.bank.repository;

import com.bank.models.EmployeeView;
import com.bank.models.UserView;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserViewRepository extends CrudRepository<UserView, Integer> {

    @Query(value = "SELECT * FROM v_users", nativeQuery = true)
    List<UserView> getUserView();
}
