package com.bank.repository;

import com.bank.models.User;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface UserRepository extends CrudRepository<User, Integer> {

    @Query(value = "SELECT email FROM users WHERE email = :email", nativeQuery = true)
    String getUserEmail(@Param("email") String email);

    @Query(value = "SELECT password FROM users WHERE email = :email", nativeQuery = true)
    String getUserPassword(@Param("email") String email);

    @Query(value = "SELECT * FROM users WHERE email = :email", nativeQuery = true)
    User getUserDetails(@Param("email") String email);

    @Query(value = "SELECT verified FROM users WHERE email = :email", nativeQuery = true)
    int isVerified(@Param("email") String email);

    @Query(value = "SELECT email FROM users", nativeQuery = true)
    List<String> getAllEmails();

    @Modifying
    @Query(value = "INSERT INTO users (first_name, last_name, email, password, token, code, created_at) VALUES" +
    "(:first_name, :last_name, :email, :password, :token, :code, :created_at)", nativeQuery = true)
    @Transactional
    void registerUser(@Param("first_name") String first_name,
                      @Param("last_name") String last_name,
                      @Param("email") String email,
                      @Param("password") String password,
                      @Param("token") String token,
                      @Param("code") int code,
                      @Param("created_at")LocalDateTime created_at);

    @Modifying
    @Query(value = "UPDATE users set token=null, code=null, verified=1, verified_at=NOW(), updated_at=NOW() where " +
            "token=:token AND code=:code", nativeQuery = true)
    @Transactional
    void verifyAccount(@Param("token") String token,
                       @Param("code") String code);

    @Query(value = "SELECT token FROM users WHERE token = :token", nativeQuery = true)
    String checkToken(@Param("token") String token);

    @Query(value = "SELECT * FROM users", nativeQuery = true)
    List<User> getAllUsers();

    @Modifying
    @Transactional
    @Query(value = "UPDATE users SET updated_at=NOW()", nativeQuery = true)
    void updatedAtNow();

    @Modifying
    @Transactional
    @Query(value = "UPDATE users SET verified_at=NOW()", nativeQuery = true)
    void verifiedAtNow();
}
