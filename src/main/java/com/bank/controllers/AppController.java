package com.bank.controllers;

import com.bank.helpers.PDFExporter;
import com.bank.helpers.PaymentHistoryPDFExporter;
import com.bank.helpers.TransactionHistoryPDFExporter;
import com.bank.models.*;
import com.bank.repository.*;
import com.lowagie.text.DocumentException;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Controller
@RequestMapping("/app")
public class AppController {

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private PaymentHistoryRepository paymentHistoryRepository;

    @Autowired
    private TransactHistoryRepository transactHistoryRepository;

    @Autowired
    private EmployeeViewRepository employeeViewRepository;

    @Autowired
    private UserViewRepository userViewRepository;

    @Autowired
    private EmployeeRepository employeeRepository;

    @Autowired
    private DepartmentRepository departmentRepository;

    @Autowired
    private BranchRepository branchRepository;

    @Autowired
    private HomeApplicationRepository homeApplicationRepository;

    @Autowired
    private PersonalLoanApplicationRepository personalLoanApplicationRepository;

    @Autowired
    private GoldLoanApplicationRepository goldLoanApplicationRepository;

    User user;

    @GetMapping("/dashboard")
    public ModelAndView getDashboard(HttpSession session, RedirectAttributes redirectAttributes) {
        //Set view
        ModelAndView getDashboardPage = new ModelAndView("dashboard");

        //Get the details of the logged in user
        user = (User) session.getAttribute("user");

        //Get the accounts of the logged in user
        List<Account> getUserAccounts = accountRepository.getUserAccountsById(user.getUser_id());

        //Get balance
        BigDecimal totalAccountBalance = accountRepository.getTotalBalance(user.getUser_id());



        //Set objects
        getDashboardPage.addObject("userAccounts", getUserAccounts);
        getDashboardPage.addObject("totalBalance", totalAccountBalance);

        return getDashboardPage;
    }

    @GetMapping("/payment_history")
    public ModelAndView getPaymentHistory(HttpSession session, HttpServletResponse response) throws DocumentException, IOException {
        //Set view
        ModelAndView getPaymentHistoryPage = new ModelAndView("paymentHistory");

        //Get logged in user
        user = (User) session.getAttribute("user");

        //Get payment record
        List<PaymentHistory> userPaymentHistory = paymentHistoryRepository.getPaymentRecordsById(user.getUser_id());

        //Get the accounts of the logged in user
        List<Account> getUserAccounts = accountRepository.getUserAccountsById(user.getUser_id());

        //Set objects
        getPaymentHistoryPage.addObject("payment_history", userPaymentHistory);
        getPaymentHistoryPage.addObject("userAccounts", getUserAccounts);

        return getPaymentHistoryPage;
    }

    @GetMapping("/transact_history")
    public ModelAndView getTransactHistory(HttpSession session) {
        // Set View:
        ModelAndView getTransactHistoryPage = new ModelAndView("transactHistory");

        // Get Logged In User:\
        user = (User) session.getAttribute("user");

        // Get Transaction History / Records:
        List<TransactionHistory> userTransactHistory = transactHistoryRepository.getTransactionRecordsById(user.getUser_id());

        //Get the accounts of the logged in user
        List<Account> getUserAccounts = accountRepository.getUserAccountsById(user.getUser_id());

        getTransactHistoryPage.addObject("transact_history", userTransactHistory);
        getTransactHistoryPage.addObject("userAccounts", getUserAccounts);

        return getTransactHistoryPage;
    }


    @GetMapping("/payment_history_export_pdf")
    public void exportPaymentHistoryToPDF(HttpServletResponse response, HttpSession session) throws DocumentException, IOException {
        //Prepare for exporting PDF
        response.setContentType("application/pdf");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
        String currentDateTime = dateFormatter.format(new Date());

        //Get logged in user
        user = (User) session.getAttribute("user");

        //Set header
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=" + user.getFirst_name() + " " + user.getLast_name() + "_payment_history_" + currentDateTime + ".pdf";
        response.setHeader(headerKey, headerValue);

        //Get payment record
        List<PaymentHistory> userPaymentHistoryList = paymentHistoryRepository.getPaymentRecordsById(user.getUser_id());

        //Export Payment history to PDF
        PaymentHistoryPDFExporter paymentHistoryPDFExporter = new PaymentHistoryPDFExporter(userPaymentHistoryList);
        paymentHistoryPDFExporter.export(response);
    }

    @GetMapping("/transaction_history_export_pdf")
    public void exportTransactionHistoryToPDF(HttpServletResponse response, HttpSession session) throws DocumentException, IOException {
        //Prepare for exporting PDF
        response.setContentType("application/pdf");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
        String currentDateTime = dateFormatter.format(new Date());

        //Get logged in user
        user = (User) session.getAttribute("user");

        //Set header
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=" + user.getFirst_name() + " " + user.getLast_name() + "_transaction_history_" + currentDateTime + ".pdf";
        response.setHeader(headerKey, headerValue);

        //Get transaction records
        List<TransactionHistory> transactionHistoryList = transactHistoryRepository.getTransactionRecordsById(user.getUser_id());

        //Export Transaction history to PDF
        TransactionHistoryPDFExporter transactionHistoryPDFExporter = new TransactionHistoryPDFExporter(transactionHistoryList);
        transactionHistoryPDFExporter.export(response);
    }

    @GetMapping("/loan")
    public ModelAndView getLoan(HttpSession session, RedirectAttributes redirectAttributes) {
        //Set view
        ModelAndView getLoanPage = new ModelAndView("loan");

        //Get the details of the logged in user
        user = (User) session.getAttribute("user");

        //Get the accounts of the logged in user
        List<Account> getUserAccounts = accountRepository.getUserAccountsById(user.getUser_id());

        //Get total balance
        BigDecimal totalAccountBalance =  accountRepository.getTotalBalance(user.getUser_id());
        int accBalance;
        if(totalAccountBalance == null)
             accBalance = 0;
        else
            accBalance = totalAccountBalance.intValue();

        getLoanPage.addObject("userAccounts", getUserAccounts);
        getLoanPage.addObject("totalAccountBalance", accBalance);
        return getLoanPage;
    }



    @GetMapping("/admin_dashboard")
    public ModelAndView getAdminDashboard(HttpSession session, RedirectAttributes redirectAttributes) {
        //Set view
        ModelAndView getDashboardPage = new ModelAndView("admindashboard");

        //Get the details of the logged in admin
        Admin admin = (Admin) session.getAttribute("admin");
        getDashboardPage.addObject("admin", admin);

        //Get employee view
        List<EmployeeView> employeeViews = employeeViewRepository.getEmployeeView();
        getDashboardPage.addObject("employeeViews", employeeViews);

        //Get user view
        List<UserView> userViews = userViewRepository.getUserView();
        getDashboardPage.addObject("userViews", userViews);



        return getDashboardPage;
    }

    @GetMapping("/employee_panel")
    public ModelAndView getEmployeePanel(HttpSession session, RedirectAttributes redirectAttributes) {
        System.out.println("In employee panel controller");
        //Set view
        ModelAndView getEmployeePage = new ModelAndView("employeePanel");

        //Get all employees
        List<Employee> allEmployees =  employeeRepository.getAllEmployee();
        getEmployeePage.addObject("allEmployees", allEmployees);

        //Get Departments
        List<Department> allDepartments = departmentRepository.getAllDepartment();
        getEmployeePage.addObject("allDepartments", allDepartments);

        //Get Branches
        List<Branch> allBranches = branchRepository.getAllBranch();
        getEmployeePage.addObject("allBranches", allBranches);

        return getEmployeePage;

    }

    @PostMapping("/sort_personal")
    public ModelAndView getPersonalPanelSorted(@RequestParam("sort-option") String sortOption,
                                               @RequestParam("sorting-technique") String sortingTechnique,
                                               HttpSession session,
                                               RedirectAttributes redirectAttributes) {
        System.out.println("In sorting personal panel controller");
        ModelAndView getPersonalSortedPage = new ModelAndView("employeePersonalSorting");

        //Get all employees
        List<Employee> allEmployees =  employeeRepository.getAllEmployee();
        getPersonalSortedPage.addObject("allEmployees", allEmployees);

        //Get Departments
        List<Department> allDepartments = departmentRepository.getAllDepartment();
        getPersonalSortedPage.addObject("allDepartments", allDepartments);

        //Get Branches
        List<Branch> allBranches = branchRepository.getAllBranch();
        getPersonalSortedPage.addObject("allBranches", allBranches);

        getPersonalSortedPage.addObject("workSortedEmployees", allEmployees);
        getPersonalSortedPage.addObject("activeTab", "personal");

        //Check for empty field
        if(sortOption.equals("")) {
            getPersonalSortedPage.addObject("error", "Please select Sorting Column");
            getPersonalSortedPage.addObject("sortedEmployees", allEmployees);
            return getPersonalSortedPage;
        }

        //Get employees sorted by Age ASC
        if(sortOption.equals("age") && sortingTechnique.equals("ascending")) {
            List<Employee> sortedEmployees = employeeRepository.getAllEmployeeSortByAge();
            getPersonalSortedPage.addObject("sortedEmployees", sortedEmployees);
            getPersonalSortedPage.addObject("sortingColumn_technique", "age_asc");
        }
        //Get employees sorted by Age DESC
        else if(sortOption.equals("age") && sortingTechnique.equals("descending")) {
            List<Employee> sortedEmployees = employeeRepository.getAllEmployeeSortByAgeDesc();
            getPersonalSortedPage.addObject("sortedEmployees", sortedEmployees);
            getPersonalSortedPage.addObject("sortingColumn_technique", "age_desc");
        }
        //Get employees sorted by Name ASC
        else if(sortOption.equals("name") && sortingTechnique.equals("ascending")) {
            List<Employee> sortedEmployees = employeeRepository.getAllEmployeeSortByName();
            getPersonalSortedPage.addObject("sortedEmployees", sortedEmployees);
            getPersonalSortedPage.addObject("sortingColumn_technique", "name_asc");
        }
        //Get employees sorted by Name DESC
        else if(sortOption.equals("name") && sortingTechnique.equals("descending")) {
            List<Employee> sortedEmployees = employeeRepository.getAllEmployeeSortByNameDesc();
            getPersonalSortedPage.addObject("sortedEmployees", sortedEmployees);
            getPersonalSortedPage.addObject("sortingColumn_technique", "name_desc");
        }
        //Get employees sorted by City ASC
        else if(sortOption.equals("city") && sortingTechnique.equals("ascending")) {
            List<Employee> sortedEmployees = employeeRepository.getAllEmployeeSortByCity();
            getPersonalSortedPage.addObject("sortedEmployees", sortedEmployees);
            getPersonalSortedPage.addObject("sortingColumn_technique", "city_asc");
        }
        //Get employees sorted by City DESC
        else if(sortOption.equals("city") && sortingTechnique.equals("descending")) {
            List<Employee> sortedEmployees = employeeRepository.getAllEmployeeSortByCityDesc();
            getPersonalSortedPage.addObject("sortedEmployees", sortedEmployees);
            getPersonalSortedPage.addObject("sortingColumn_technique", "city_desc");
        }
        //Get employees sorted by ID ASC
        else if(sortOption.equals("ID") && sortingTechnique.equals("ascending")) {
            List<Employee> sortedEmployees = employeeRepository.getAllEmployeeSortByID();
            getPersonalSortedPage.addObject("sortedEmployees", sortedEmployees);
            getPersonalSortedPage.addObject("sortingColumn_technique", "ID_asc");
        }
        //Get employees sorted by ID DESC
        else if(sortOption.equals("ID") && sortingTechnique.equals("descending")) {
            List<Employee> sortedEmployees = employeeRepository.getAllEmployeeSortByIDDesc();
            getPersonalSortedPage.addObject("sortedEmployees", sortedEmployees);
            getPersonalSortedPage.addObject("sortingColumn_technique", "ID_desc");
        }

        return getPersonalSortedPage;
    }

    @PostMapping("/group_personal")
    public ModelAndView getPersonalPanelGrouped(@RequestParam("group-option") String groupOption,
                                               HttpSession session,
                                               RedirectAttributes redirectAttributes) {
        System.out.println("In grouping personal panel controller");
        ModelAndView getPersonalGroupedPage = new ModelAndView("employeePersonalGrouping");

        //Get all employees
        List<Employee> allEmployees =  employeeRepository.getAllEmployee();
        getPersonalGroupedPage.addObject("allEmployees", allEmployees);

        //Get Departments
        List<Department> allDepartments = departmentRepository.getAllDepartment();
        getPersonalGroupedPage.addObject("allDepartments", allDepartments);

        //Get Branches
        List<Branch> allBranches = branchRepository.getAllBranch();
        getPersonalGroupedPage.addObject("allBranches", allBranches);

        getPersonalGroupedPage.addObject("workSortedEmployees", allEmployees);
        getPersonalGroupedPage.addObject("activeTab", "personal");

        //Check for empty field
        if(groupOption.equals("")) {
            getPersonalGroupedPage.addObject("errorGrouping", "Please select Grouping By Column");
            getPersonalGroupedPage.addObject("sortedEmployees", allEmployees);
            return getPersonalGroupedPage;
        }

        //Get employees grouped by city
        if(groupOption.equals("city")) {
            List<String> distinctCity = employeeRepository.getDistinctCity();
            Map<String, List<Employee>> employeesGroupedByCity = new HashMap<>();
            for (String city : distinctCity)
                employeesGroupedByCity.put(city, employeeRepository.getSpecificCity(city));
            getPersonalGroupedPage.addObject("employeesGroupedByCity", employeesGroupedByCity);
        }

        //Get employees grouped by state
        if(groupOption.equals("state")) {
            List<String> distinctState = employeeRepository.getDistinctState();
            Map<String, List<Employee>> employeesGroupedByState = new HashMap<>();
            for (String state : distinctState)
                employeesGroupedByState.put(state, employeeRepository.getSpecificState(state));
            getPersonalGroupedPage.addObject("employeesGroupedByState", employeesGroupedByState);
        }

        //Get employees grouped by age
        if(groupOption.equals("age")) {
            List<String> distinctAge = employeeRepository.getDistinctAge();
            Map<String, List<Employee>> employeesGroupedByAge = new HashMap<>();
            for (String age : distinctAge)
                employeesGroupedByAge.put(age, employeeRepository.getSpecificAge(age));
            getPersonalGroupedPage.addObject("employeesGroupedByAge", employeesGroupedByAge);
        }

        //Get employees grouped by gender
        if(groupOption.equals("gender")) {
            List<String> distinctGender = employeeRepository.getDistinctGender();
            Map<String, List<Employee>> employeesGroupedByGender = new HashMap<>();
            for (String gender : distinctGender)
                employeesGroupedByGender.put(gender, employeeRepository.getSpecificGender(gender));
            getPersonalGroupedPage.addObject("employeesGroupedByGender", employeesGroupedByGender);
        }

        //Get employees grouped by marital_status
        if(groupOption.equals("marital_status")) {
            List<String> distinctMaritalStatus = employeeRepository.getDistinctMaritalStatus();
            Map<String, List<Employee>> employeesGroupedByMaritalStatus = new HashMap<>();
            for (String marital_status : distinctMaritalStatus)
                employeesGroupedByMaritalStatus.put(marital_status, employeeRepository.getSpecificMaritalStatus(marital_status));
            getPersonalGroupedPage.addObject("employeesGroupedByMaritalStatus", employeesGroupedByMaritalStatus);
        }

        //Get employees grouped by education_level
        if(groupOption.equals("education_level")) {
            List<String> distinctEducationLevel = employeeRepository.getDistinctEducationLevel();
            Map<String, List<Employee>> employeesGroupedByEducationLevel = new HashMap<>();
            for (String education_level : distinctEducationLevel)
                employeesGroupedByEducationLevel.put(education_level, employeeRepository.getSpecificEducationLevel(education_level));
            getPersonalGroupedPage.addObject("employeesGroupedByEducationLevel", employeesGroupedByEducationLevel);
        }

        //Get employees grouped by subsidiary_language
        if(groupOption.equals("subsidiary_language")) {
            List<String> distinctSubsidiaryLanguage = employeeRepository.getDistinctSubsidiaryLanguage();
            Map<String, List<Employee>> employeesGroupedBySubsidiaryLanguage = new HashMap<>();
            for (String subsidiary_language : distinctSubsidiaryLanguage)
                employeesGroupedBySubsidiaryLanguage.put(subsidiary_language, employeeRepository.getSpecificSubsidiaryLanguage(subsidiary_language));
            getPersonalGroupedPage.addObject("employeesGroupedBySubsidiaryLanguage", employeesGroupedBySubsidiaryLanguage);
        }

        return getPersonalGroupedPage;
    }

    @PostMapping("/sort_work")
    public ModelAndView getWorkPanelSorted(@RequestParam("work-sort-option") String workSortOption,
                                               @RequestParam("work-sorting-technique") String workSortingTechnique,
                                               HttpSession session,
                                               RedirectAttributes redirectAttributes) {
        System.out.println("In sorting work panel controller");
        ModelAndView getWorkSortedPage = new ModelAndView("employeePersonalSorting");

        //Get all employees
        List<Employee> allEmployees =  employeeRepository.getAllEmployee();
        getWorkSortedPage.addObject("allEmployees", allEmployees);

        //Get Departments
        List<Department> allDepartments = departmentRepository.getAllDepartment();
        getWorkSortedPage.addObject("allDepartments", allDepartments);

        //Get Branches
        List<Branch> allBranches = branchRepository.getAllBranch();
        getWorkSortedPage.addObject("allBranches", allBranches);

        getWorkSortedPage.addObject("sortedEmployees", allEmployees);
        getWorkSortedPage.addObject("activeTab", "work");

        //Check for empty field
        if(workSortOption.equals("")) {
            getWorkSortedPage.addObject("workErrorSorting", "Please select Sorting Column");

            getWorkSortedPage.addObject("workSortedEmployees", allEmployees);
            return getWorkSortedPage;
        }

        //Get employees sorted by ID ASC
        else if(workSortOption.equals("ID") && workSortingTechnique.equals("ascending")) {
            List<Employee> workSortedEmployees = employeeRepository.getAllEmployeeSortByID();
            getWorkSortedPage.addObject("workSortedEmployees", workSortedEmployees);
            getWorkSortedPage.addObject("workSortingColumn_technique", "ID_asc");
        }

        //Get employees sorted by ID DESC
        else if(workSortOption.equals("ID") && workSortingTechnique.equals("descending")) {
            List<Employee> workSortedEmployees = employeeRepository.getAllEmployeeSortByIDDesc();
            getWorkSortedPage.addObject("workSortedEmployees", workSortedEmployees);
            getWorkSortedPage.addObject("workSortingColumn_technique", "ID_desc");
        }

        //Get employees sorted by Name ASC
        else if(workSortOption.equals("name") && workSortingTechnique.equals("ascending")) {
            List<Employee> workSortedEmployees = employeeRepository.getAllEmployeeSortByName();
            getWorkSortedPage.addObject("workSortedEmployees", workSortedEmployees);
            getWorkSortedPage.addObject("workSortingColumn_technique", "name_asc");
        }

        //Get employees sorted by Name DESC
        else if(workSortOption.equals("name") && workSortingTechnique.equals("descending")) {
            List<Employee> workSortedEmployees = employeeRepository.getAllEmployeeSortByNameDesc();
            getWorkSortedPage.addObject("workSortedEmployees", workSortedEmployees);
            getWorkSortedPage.addObject("workSortingColumn_technique", "name_desc");
        }

        //Get employees sorted by Hire Date ASC
        else if(workSortOption.equals("hire_date") && workSortingTechnique.equals("ascending")) {
            List<Employee> workSortedEmployees = employeeRepository.getAllEmployeeSortByHireDate();
            getWorkSortedPage.addObject("workSortedEmployees", workSortedEmployees);
            getWorkSortedPage.addObject("workSortingColumn_technique", "hire_date_asc");
        }

        //Get employees sorted by Hire Date DESC
        else if(workSortOption.equals("hire_date") && workSortingTechnique.equals("descending")) {
            List<Employee> workSortedEmployees = employeeRepository.getAllEmployeeSortByHireDateDesc();
            getWorkSortedPage.addObject("workSortedEmployees", workSortedEmployees);
            getWorkSortedPage.addObject("workSortingColumn_technique", "hire_date_desc");
        }

        //Get employees sorted by Salary ASC
        else if(workSortOption.equals("salary") && workSortingTechnique.equals("ascending")) {
            List<Employee> workSortedEmployees = employeeRepository.getAllEmployeeSortBySalary();
            getWorkSortedPage.addObject("workSortedEmployees", workSortedEmployees);
            getWorkSortedPage.addObject("workSortingColumn_technique", "salary_asc");
        }

        //Get employees sorted by Salary DESC
        else if(workSortOption.equals("salary") && workSortingTechnique.equals("descending")) {
            List<Employee> workSortedEmployees = employeeRepository.getAllEmployeeSortBySalaryDesc();
            getWorkSortedPage.addObject("workSortedEmployees", workSortedEmployees);
            getWorkSortedPage.addObject("workSortingColumn_technique", "salary_desc");
        }

        return getWorkSortedPage;
    }

    @PostMapping("/group_work")
    public ModelAndView getWorkPanelGrouped(@RequestParam("work-group-option") String workGroupOption,
                                                HttpSession session,
                                                RedirectAttributes redirectAttributes) {
        System.out.println("In grouping work panel controller");
        ModelAndView getWorkGroupedPage = new ModelAndView("employeePersonalGrouping");
        String[] groupByCols = {"education_level", "employee_type", "employee_status", "job_title", "department_id", "branch_id", "manager_id"};

        //Get all employees
        List<Employee> allEmployees =  employeeRepository.getAllEmployee();
        getWorkGroupedPage.addObject("allEmployees", allEmployees);

        //Get Departments
        List<Department> allDepartments = departmentRepository.getAllDepartment();
        getWorkGroupedPage.addObject("allDepartments", allDepartments);

        //Get Branches
        List<Branch> allBranches = branchRepository.getAllBranch();
        getWorkGroupedPage.addObject("allBranches", allBranches);

        getWorkGroupedPage.addObject("sortedEmployees", allEmployees);
        getWorkGroupedPage.addObject("activeTab", "work");

        //Check for empty field
        if(workGroupOption.equals("")) {
            getWorkGroupedPage.addObject("workErrorSorting", "Please select Sorting Column");
            getWorkGroupedPage.addObject("workSortedEmployees", allEmployees);
            return getWorkGroupedPage;
        }

        List<String> distinctValues = new ArrayList<>();
        Map<String, List<Employee>> employeesGroupedByCol;
        Map<String,Map<String, List<Employee>>> employeeObj = new HashMap<>();
        Map<String, String> departmentNames = new HashMap<>();
        Map<String, String> branchNames = new HashMap<>();
        Map<String, String> managerNames = new HashMap<>();

        for (String col : groupByCols) {
            if (workGroupOption.equals(col)) {
                try {
                    String colFormatted = "";
                    for(String s : col.split("_"))
                        colFormatted += s.substring(0, 1).toUpperCase() + s.substring(1);
                    Method getDistinctValuesMethod = EmployeeRepository.class.getDeclaredMethod("getDistinct" + colFormatted);
                    distinctValues = (List<String>) getDistinctValuesMethod.invoke(employeeRepository);

                    if(col.equals("manager_id"))
                        distinctValues.remove(0);

                    Method getSpecificValuesMethod = EmployeeRepository.class.getDeclaredMethod("getSpecific" + colFormatted, String.class);
                    employeesGroupedByCol = new HashMap<>();
                    for (String value : distinctValues) {
                        List<Employee> employees = (List<Employee>) getSpecificValuesMethod.invoke(employeeRepository, value);
                        employeesGroupedByCol.put(value, employees);
                    }
                    employeeObj.put(col, employeesGroupedByCol);
                } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
                    e.printStackTrace();
                }
            }
        }

        getWorkGroupedPage.addObject("groupedEmployeeObj", employeeObj);

        List<String> distinctDepartmentId = employeeRepository.getDistinctDepartmentId();
        for(String id : distinctDepartmentId)
            departmentNames.put(id, departmentRepository.getDepartmentNameById(id));
        getWorkGroupedPage.addObject("departmentNames", departmentNames);

        List<String> distinctBranchId = employeeRepository.getDistinctBranchId();
        for(String id : distinctBranchId)
            branchNames.put(id, branchRepository.getBranchNameById(id));
        getWorkGroupedPage.addObject("branchNames", branchNames);

        List<String> distinctManagerId = employeeRepository.getDistinctManagerId();
        distinctManagerId.remove(0);
        for(String id : distinctManagerId)
            managerNames.put(id, employeeRepository.getEmployeeNameById(id).replace(",", " "));
        getWorkGroupedPage.addObject("managerNames", managerNames);

        return getWorkGroupedPage;
    }

    @GetMapping("/application_panel")
    public ModelAndView getApplicationPanel(HttpSession session, RedirectAttributes redirectAttributes) {
        System.out.println("In application panel controller");
        //Set view
        ModelAndView getEmployeePage = new ModelAndView("applicationPanel");

        //Get all home loan applications
        List<HomeLoanApplication> allHomeLoanApplications = homeApplicationRepository.getAllHomeLoanApplications();
        getEmployeePage.addObject("allHomeLoanApplications", allHomeLoanApplications);

        //Get all personal loan applications
        List<PersonalLoanApplication> allPersonalLoanApplications = personalLoanApplicationRepository.getAllPersonalLoanApplications();
        getEmployeePage.addObject("allPersonalLoanApplications", allPersonalLoanApplications);

        //Get all gold loan applications
        List<GoldLoanApplication> allGoldLoanApplications = goldLoanApplicationRepository.getAllGoldLoanApplications();
        getEmployeePage.addObject("allGoldLoanApplications", allGoldLoanApplications);

        return getEmployeePage;

    }
}
