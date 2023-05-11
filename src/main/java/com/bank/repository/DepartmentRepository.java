package com.bank.repository;

import com.bank.models.Department;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartmentRepository extends CrudRepository<Department, Integer> {

    @Query(value = "SELECT * FROM department", nativeQuery = true)
    List<Department> getAllDepartment();

    @Query(value = "SELECT department_name FROM department WHERE department_id=:department_id", nativeQuery = true)
    String getDepartmentNameById(@Param("department_id") String department_id);
}
