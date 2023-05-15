<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://example.com/functions" prefix="f" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/fontawesome/css/all.css">
    <link rel="stylesheet" href="css/admin_main.css">
    <script src="js/bootstrap.bundle.js"></script>
    <title>Admin Dashboard</title>
</head>

<body>

    <!-- Header -->
    <c:import url="components/include/admin_header.jsp"/>

    <!-- Application container-->
    <div class="container mt-4">
        <!--Applications card-->
        <div class="card shadow">
            <!--Card body-->
            <div class="card-body">
                <!--Card title-->
                <h1 class="card-title">
                    Application Section
                </h1>
                <!--End of Card title-->
                <hr>
                <!--Card text-->
                <div class="card-text">

                    <ol class="list-group  mx-auto my-3" style="width: 60%;">
                      <li class="list-group-item border-bottom border-dark d-flex justify-content-between align-items-start">
                        <div class="ms-2 me-auto">
                          <h2 class="fw-bold" style="font-family: 'Oswald', sans-serif; color: #4C2B3E"><i class="fa-solid fa-house fa-1x me-3 "></i>Home Loan Applications</h2>
                          <ul type="disc" style="color: #4C2B3E; margin: 20px 10px">
                            <c:if test="${requestScope.allUsersAppliedHomeLoan != null}">
                                <c:forEach items="${allUsersAppliedHomeLoan}" var="application">
                                  <h4><li style="font-family: 'BioRhyme', serif;">Application Number: ${application.application_number}</li></h4>
                                </c:forEach>
                            </c:if>
                          </ul>
                        </div>
                        <span class="badge bg-primary rounded-pill mt-3 me-3" style="font-size: 18px; padding: 10px 30px">${requestScope.homeLoanCount}</span>
                      </li>

                      <li class="list-group-item border-bottom border-dark d-flex justify-content-between align-items-start">
                        <div class="ms-2 me-auto">
                          <h2 class="fw-bold" style="font-family: 'Oswald', sans-serif; color: #4C2B3E"><i class="fa-solid fa-sack-dollar fa-1x me-3 "></i>Personal Loan Applications</h2>
                          <ul type="disc" style="color: #4C2B3E; margin: 20px 10px">
                            <c:if test="${requestScope.allUsersAppliedPersonalLoan != null}">
                                <c:forEach items="${allUsersAppliedPersonalLoan}" var="application">
                                  <h4><li style="font-family: 'BioRhyme', serif;">Application Number: ${application.application_number}</li></h4>
                                </c:forEach>
                            </c:if>
                          </ul>
                        </div>
                        <span class="badge bg-primary rounded-pill mt-3 me-3" style="font-size: 18px; padding: 10px 30px">${requestScope.personalLoanCount}</span>
                      </li>

                      <li class="list-group-item border-bottom border-dark d-flex justify-content-between align-items-start">
                        <div class="ms-2 me-auto">
                          <h2 class="fw-bold" style="font-family: 'Oswald', sans-serif; color: #4C2B3E"><i class="fa-solid fa-hand-holding-dollar fa-1x me-3"></i>Gold Loan Applications</h2>
                          <ul type="disc" style="color: #4C2B3E; margin: 20px 10px">
                            <c:if test="${requestScope.allUsersAppliedGoldLoan != null}">
                                <c:forEach items="${allUsersAppliedGoldLoan}" var="application">
                                  <h4><li style="font-family: 'BioRhyme', serif;">Application Number: ${application.application_number}</li></h4>
                                </c:forEach>
                            </c:if>
                          </ul>
                        </div>
                        <span class="badge bg-primary rounded-pill mt-3 me-3" style="font-size: 18px; padding: 10px 30px">${requestScope.goldLoanCount}</span>
                      </li>
                    </ol>

                </div>
                <!--End of Card text-->
            </div>
            <!--End of Card body-->
        </div>
        <!--End of Application card-->
    </div>
    <!--End of Application container-->

    <!-- Databases section -->
    <div class="container mt-4 d-flex">
        <!-- Employee DB container -->
        <div class="container">
            <!--Employee DB card-->
            <div class="card shadow">
                <!--Card body-->
                <div class="card-body">
                    <!--Card title-->
                    <h1 class="card-title">
                        Employee DB
                    </h1>
                    <!--End of Card title-->
                    <hr>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Age</th>
                                <th>Job Title</th>
                                <th>Hire Date</th>
                                <th>Department</th>
                                <th>Branch</th>
                            </tr>
                        </thead>
                            <!-- Loop Through Employee Records -->
                            <c:forEach items="${requestScope.employeeViews}" var="employee">
                            <tr style="border-bottom: 2px solid #481e40;">
                                <td>${employee.employee_id}</td>
                                <td>${employee.name}</td>
                                <td>${employee.age}</td>
                                <td>${employee.job_title}</td>
                                <td>${employee.hire_date}</td>
                                <td>${employee.department_name}</td>
                                <td>${employee.branch_name}</td>
                            </tr>
                             </c:forEach>
                            <!-- End Of Loop Through Employee Records -->
                    </table>
                </div>
                <!--End of Card body-->
            </div>
            <!--End of Employee DB card-->
        </div>
        <!--End of Employee DB container -->

        <!-- Customer DB container -->
        <div class="container">
            <!--Customer DB card-->
            <div class="card shadow">
                <!--Card body-->
                <div class="card-body">
                    <!--Card title-->
                    <h1 class="card-title">
                        Customer DB
                    </h1>
                    <!--End of Card title-->
                    <hr>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Account Count</th>
                            </tr>
                        </thead>
                            <!-- Loop Through User Records -->
                            <c:forEach items="${requestScope.userViews}" var="user">
                            <tr style="border-bottom: 2px solid #481e40;">
                                <td>${user.user_id}</td>
                                <td>${user.name}</td>
                                <td>${user.email}</td>
                                <td>${user.account_count}</td>
                            </tr>
                             </c:forEach>
                            <!-- End Of Loop Through User Records -->
                    </table>
                </div>
                <!--End of Card body-->
            </div>
            <!--End of Customer DB card-->
        </div>
        <!--End of Customer DB container -->
    </div>
    <!--End of Databases section -->

    <!-- Transaction container-->
            <div class="container mt-4">
                <!--Transactions card-->
                <div class="card shadow">
                    <!--Card body-->
                    <div class="card-body">
                        <!--Card title-->
                        <h1 class="card-title">
                            Transaction Section
                        </h1>
                        <!--End of Card title-->
                        <hr>
                        <!--Card text-->
                        <div class="card-text mx-5">

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Transaction ID</th>
                                        <th>Account ID</th>
                                        <th>User ID</th>
                                        <th>Type</th>
                                        <th>Amount</th>
                                        <th>Source</th>
                                        <th>Status</th>
                                        <th>Reason Code</th>
                                        <th>Date</th>
                                        <th>Time</th>
                                    </tr>
                                </thead>
                                    <!-- Loop Through Employee Records -->
                                    <c:forEach items="${requestScope.allTransactionRecords}" var="transactionHistory">
                                    <tr style="border-bottom: 2px solid #481e40;">
                                      <td>${transactionHistory.transaction_id}</td>
                                      <td>${transactionHistory.account_id}</td>
                                      <td>${transactionHistory.user_id}</td>
                                      <td>${transactionHistory.transaction_type}</td>
                                      <td>${transactionHistory.amount}</td>
                                      <td>${transactionHistory.source}</td>
                                      <td>${transactionHistory.status}</td>
                                      <td>${transactionHistory.reason_code}</td>
                                      <td>${f:getFormattedTime(transactionHistory.created_at)}</td>
                                      <td>${f:getFormattedDate(transactionHistory.created_at)}</td>
                                    </tr>
                                     </c:forEach>
                                    <!-- End Of Loop Through Employee Records -->
                            </table>

                        </div>
                        <!--End of Card text-->
                    </div>
                    <!--End of Card body-->
                </div>
                <!--End of Transaction card-->
            </div>
            <!--End of Transaction container-->

    <!-- Affluency container-->
    <div class="container mb-5 mt-4">
        <!--Affluency card-->
        <div class="card shadow">
            <!--Card body-->
            <div class="card-body">
                <!--Card title-->
                <h1 class="card-title">
                    Customer Affluency Section
                </h1>
                <!--End of Card title-->
                <hr>
                <!--Card text-->
                <div class="card-text">
                    <h4>Information for the betterment of the customers like fraud detection, loan eligible clients, etc.</h4>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum dolore iure quod consectetur optio
                    placeat ipsam in laudantium omnis rerum?
                </div>
                <!--End of Card text-->
            </div>
            <!--End of Card body-->
        </div>
        <!--End of Affluency card-->
    </div>
    <!--End of Affluency container-->


</body>

</html>