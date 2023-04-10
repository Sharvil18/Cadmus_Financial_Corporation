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
    <!--Main Page Header-->
    <div class="main-page-header mb-3">
        <!--Container-->
        <div class="container-fluid d-flex align-items-center justify-content-center mb-2 mt-3">
            <!--Company name-->
            <div class="company-name">
                <span>( admin )</span> Cadmus Finance Corporation
            </div>
            <!--End of Company name-->

            <!--Navigation-->
            <div class="navigation ms-3 me-5">
                <li><a href="">Dashboard</a></li>
                <li><a href="">Applications</a></li>
                <li><a href="">Employees DB</a></li>
                <li><a href="">Customers DB</a></li>
                <li><a href="">Customer Affluency</a></li>
                <li><a href="">Branches</a></li>
            </div>
            <!--End of Navigation-->

            <!-- Company Logo -->
                <a href="/admindashboard"><img src="images/logos/5.png" height="75px" class="company-logo"></a>
            <!--End of Company Logo -->

            <!--Display Name-->
            <div class="display-name ms-5 text-white">
                <i class="fa fa-circle text-success me-2"></i> Welcome: <span>Admin</span>
            </div>
            <!--End of Display Name-->

            <!--Signout button-->
            <a href="" class="btn btn-md text-white mt-1 ms-3">
                <i class="fa-solid fa-right-from-bracket ms-3 me-3"></i>Sign Out
            </a>
            <!--End of Signout button-->
        </div>
        <!--End of Container-->
    </div>
    <!--End of Main Page Header-->

    <!-- Transaction container-->
    <div class="container mt-5">
        <!--transaction card-->
        <div class="card">
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
                    <h4>Stats for transactions carried out in that day</h4>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum dolore iure quod consectetur optio
                    placeat ipsam in laudantium omnis rerum?
                </div>
                <!--End of Card text-->
            </div>
            <!--End of Card body-->
        </div>
        <!--End of transaction card-->
    </div>
    <!--End of Transaction container-->

    <!-- Application container-->
    <div class="container mt-4">
        <!--Applications card-->
        <div class="card">
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
        <div class=" container">
            <!--Employee DB card-->
            <div class="card">
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
                                <th>Department</th>
                                <th>Designation</th>
                                <th>Manager</th>
                                <th>Age</th>
                                <th>Hiring</th>
                            </tr>
                        </thead>
                            <tr>
                                <td>101</td>
                                <td>Sharvil</th>
                                <td>Accounts</td>
                                <td>Assistant</td>
                                <td>Krina</td>
                                <td>23</td>
                                <td>23/05/1992</td>
                            </tr>
                            <tr>
                                <td>101</td>
                                <td>Sharvil</th>
                                <td>Accounts</td>
                                <td>Assistant</td>
                                <td>Krina</td>
                                <td>23</td>
                                <td>23/05/1992</td>
                            </tr>
                            <tr>
                                <td>101</td>
                                <td>Sharvil</th>
                                <td>Accounts</td>
                                <td>Assistant</td>
                                <td>Krina</td>
                                <td>23</td>
                                <td>23/05/1992</td>
                            </tr>
                            <tr style="border-bottom: 2px solid #481e40;">
                                <td>101</td>
                                <td>Sharvil</th>
                                <td>Accounts</td>
                                <td>Assistant</td>
                                <td>Krina</td>
                                <td>23</td>
                                <td>23/05/1992</td>
                            </tr>
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
            <div class="card">
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
                                <th>Sr. No.</th>
                                <th>First</th>
                                <th>Last</th>
                                <th>Email</th>
                                <th>Contact</th>
                            </tr>
                        </thead>
                            <tr>
                                <td>1</td>
                                <td>Sharvil</th>
                                <td>Rane</td>
                                <td>sharvil@gmail.com</td>
                                <td>401520123</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Sharvil</th>
                                <td>Rane</td>
                                <td>sharvil@gmail.com</td>
                                <td>401520123</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Sharvil</th>
                                <td>Rane</td>
                                <td>sharvil@gmail.com</td>
                                <td>401520123</td>
                            </tr>
                            <tr style="border-bottom: 2px solid #481e40;">
                                <td>1</td>
                                <td>Sharvil</th>
                                <td>Rane</td>
                                <td>sharvil@gmail.com</td>
                                <td>401520123</td>
                            </tr>
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
        <div class="card">
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
        <div class="card">
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