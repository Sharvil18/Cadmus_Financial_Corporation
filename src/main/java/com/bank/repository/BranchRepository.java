package com.bank.repository;

import com.bank.models.Branch;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BranchRepository extends CrudRepository<Branch, Integer> {

    @Query(value = "SELECT name FROM branch WHERE branch_id=:branch_id", nativeQuery = true)
    String getBranchNameById(@Param("branch_id") String branch_id);

    @Query(value = "SELECT * FROM branch", nativeQuery = true)
    List<Branch> getAllBranch();


}
