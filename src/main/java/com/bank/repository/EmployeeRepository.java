package com.bank.repository;

import com.bank.models.Employee;
import com.bank.models.User;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeRepository extends CrudRepository<Employee, Integer> {
    @Query(value = "SELECT * FROM employee ORDER BY hire_date", nativeQuery = true)
    List<Employee> getAllEmployee();

    @Query(value = "SELECT * FROM employee ORDER BY employee_id", nativeQuery = true)
    List<Employee> getAllEmployeeSortByID();

    @Query(value = "SELECT * FROM employee ORDER BY employee_id DESC", nativeQuery = true)
    List<Employee> getAllEmployeeSortByIDDesc();

    @Query(value = "SELECT * FROM employee ORDER BY email", nativeQuery = true)
    List<Employee> getAllEmployeeSortByName();

    @Query(value = "SELECT * FROM employee ORDER BY email DESC", nativeQuery = true)
    List<Employee> getAllEmployeeSortByNameDesc();

    @Query(value = "SELECT * FROM employee ORDER BY age", nativeQuery = true)
    List<Employee> getAllEmployeeSortByAge();

    @Query(value = "SELECT * FROM employee ORDER BY age DESC", nativeQuery = true)
    List<Employee> getAllEmployeeSortByAgeDesc();

    @Query(value = "SELECT * FROM employee ORDER BY city", nativeQuery = true)
    List<Employee> getAllEmployeeSortByCity();

    @Query(value = "SELECT * FROM employee ORDER BY city DESC", nativeQuery = true)
    List<Employee> getAllEmployeeSortByCityDesc();

    @Query(value = "SELECT * FROM employee ORDER BY hire_date", nativeQuery = true)
    List<Employee> getAllEmployeeSortByHireDate();

    @Query(value = "SELECT * FROM employee ORDER BY hire_date DESC", nativeQuery = true)
    List<Employee> getAllEmployeeSortByHireDateDesc();

    @Query(value = "SELECT * FROM employee ORDER BY salary", nativeQuery = true)
    List<Employee> getAllEmployeeSortBySalary();

    @Query(value = "SELECT * FROM employee ORDER BY salary DESC", nativeQuery = true)
    List<Employee> getAllEmployeeSortBySalaryDesc();

    @Query(value="SELECT DISTINCT(city) FROM employee", nativeQuery = true)
    List<String> getDistinctCity();

    @Query(value = "SELECT * FROM employee where city=:city", nativeQuery = true)
    List<Employee> getSpecificCity(@Param("city") String city);

    @Query(value="SELECT DISTINCT(state) FROM employee", nativeQuery = true)
    List<String> getDistinctState();

    @Query(value = "SELECT * FROM employee where state=:state", nativeQuery = true)
    List<Employee> getSpecificState(@Param("state") String state);

    @Query(value="SELECT DISTINCT(age) FROM employee", nativeQuery = true)
    List<String> getDistinctAge();

    @Query(value = "SELECT * FROM employee where age=:age", nativeQuery = true)
    List<Employee> getSpecificAge(@Param("age") String age);

    @Query(value="SELECT DISTINCT(gender) FROM employee", nativeQuery = true)
    List<String> getDistinctGender();

    @Query(value = "SELECT * FROM employee where gender=:gender", nativeQuery = true)
    List<Employee> getSpecificGender(@Param("gender") String gender);

    @Query(value="SELECT DISTINCT(marital_status) FROM employee", nativeQuery = true)
    List<String> getDistinctMaritalStatus();

    @Query(value = "SELECT * FROM employee where marital_status=:marital_status", nativeQuery = true)
    List<Employee> getSpecificMaritalStatus(@Param("marital_status") String marital_status);

    @Query(value="SELECT DISTINCT(education_level) FROM employee", nativeQuery = true)
    List<String> getDistinctEducationLevel();

    @Query(value = "SELECT * FROM employee where education_level=:education_level", nativeQuery = true)
    List<Employee> getSpecificEducationLevel(@Param("education_level") String education_level);

    @Query(value="SELECT DISTINCT(subsidiary_language) FROM employee", nativeQuery = true)
    List<String> getDistinctSubsidiaryLanguage();

    @Query(value = "SELECT * FROM employee where subsidiary_language=:subsidiary_language", nativeQuery = true)
    List<Employee> getSpecificSubsidiaryLanguage(@Param("subsidiary_language") String subsidiary_language);

    @Query(value="SELECT DISTINCT(employee_type) FROM employee", nativeQuery = true)
    List<String> getDistinctEmployeeType();

    @Query(value = "SELECT * FROM employee where employee_type=:employee_type", nativeQuery = true)
    List<Employee> getSpecificEmployeeType(@Param("employee_type") String employee_type);

    @Query(value="SELECT DISTINCT(employee_status) FROM employee", nativeQuery = true)
    List<String> getDistinctEmployeeStatus();

    @Query(value = "SELECT * FROM employee where employee_status=:employee_status", nativeQuery = true)
    List<Employee> getSpecificEmployeeStatus(@Param("employee_status") String employee_status);

    @Query(value="SELECT DISTINCT(job_title) FROM employee", nativeQuery = true)
    List<String> getDistinctJobTitle();

    @Query(value = "SELECT * FROM employee where job_title=:job_title", nativeQuery = true)
    List<Employee> getSpecificJobTitle(@Param("job_title") String job_title);

    @Query(value="SELECT DISTINCT(department_id) FROM employee", nativeQuery = true)
    List<String> getDistinctDepartmentId();

    @Query(value = "SELECT * FROM employee where department_id=:department_id", nativeQuery = true)
    List<Employee> getSpecificDepartmentId(@Param("department_id") String department_id);

    @Query(value="SELECT DISTINCT(branch_id) FROM employee", nativeQuery = true)
    List<String> getDistinctBranchId();

    @Query(value = "SELECT * FROM employee where branch_id=:branch_id", nativeQuery = true)
    List<Employee> getSpecificBranchId(@Param("branch_id") String branch_id);

    @Query(value="SELECT DISTINCT(manager_id) FROM employee", nativeQuery = true)
    List<String> getDistinctManagerId();

    @Query(value = "SELECT * FROM employee WHERE manager_id=:manager_id", nativeQuery = true)
    List<Employee> getSpecificManagerId(@Param("manager_id") String manager_id);

    @Query(value = "SELECT first_name, last_name FROM employee WHERE employee_id=:employee_id", nativeQuery = true)
    String getEmployeeNameById(@Param("employee_id") String employee_id);
}
