<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                    <div class="card-text">
                        <h4>Transactions of customers for loan, mortgage, credit card, etc.</h4>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum dolore iure quod consectetur optio
                        placeat ipsam in laudantium omnis rerum?
                    </div>
                    <!--End of Card text-->
                </div>
                <!--End of Card body-->
            </div>
            <!--End of Transaction card-->
        </div>
        <!--End of Transaction container-->

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
                    <h4>Applications of customers for loan, mortgage, credit card, etc.</h4>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum dolore iure quod consectetur optio
                    placeat ipsam in laudantium omnis rerum?
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
                            <tr style="border-bottom: 2px solid #413A92;">
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

    <!-- Branch container-->
    <div class="container mb-5 mt-4">
        <!--Branch card-->
        <div class="card shadow">
            <!--Card body-->
            <div class="card-body">
                <!--Card title-->
                <h1 class="card-title">
                    Branch Section
                </h1>
                <!--End of Card title-->
                <hr>
                <!--Card text-->
                <div class="card-text">
                    <h4>Stats about this particular branch of the bank</h4>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum dolore iure quod consectetur optio
                    placeat ipsam in laudantium omnis rerum?
                </div>
                <!--End of Card text-->
            </div>
            <!--End of Card body-->
        </div>
        <!--End of Branch card-->
    </div>
    <!--End of Branch container-->

</body>

</html>