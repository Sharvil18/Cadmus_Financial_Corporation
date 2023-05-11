package com.bank.repository;

import com.bank.models.Admin;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface AdminRepository extends CrudRepository<Admin, String> {

    @Query(value = "SELECT admin_id FROM admin", nativeQuery = true)
    List<String> getAllAdminID();

    @Query(value = "SELECT admin_email FROM admin WHERE admin_id = :admin_id", nativeQuery = true)
    String getAdminEmail(@Param("admin_id") String admin_email);

    @Query(value = "SELECT admin_password FROM admin WHERE admin_id = :admin_id", nativeQuery = true)
    String getAdminPassword(@Param("admin_id") String admin_id);

    @Query(value = "SELECT * FROM admin WHERE admin_id = :admin_id", nativeQuery = true)
    Admin getAdminDetails(@Param("admin_id") String admin_id);

    @Modifying
    @Transactional
    @Query(value = "UPDATE admin SET admin_last_login = :admin_last_login WHERE admin_id = :admin_id", nativeQuery = true)
    void updateAdminLastLogin(@Param("admin_last_login") LocalDateTime admin_last_login, @Param("admin_id") String admin_id);
}
