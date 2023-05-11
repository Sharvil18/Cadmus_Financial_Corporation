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
    <link rel="stylesheet" href="css/default.css">
    <title>Admin Login</title>
</head>
<body id="admin-login" class="d-flex align-items-center justify-content-center bg-image login">

    <!--Main Page Header-->
    <div class="main-page-header mb-3">
        <!--Container-->
        <div class="container d-flex align-items-center">
            <!--Company name-->
            <div class="company-name">
                Cadmus Finance Corporation
            </div>
            <!--End of Company name-->

            <!--Navigation-->
            <nav class="navigation">
                <li ><a href="/"><i class="fa-solid fa-house mx-2 my-2"></i>Home</a></li>
                <li ><a href="/perk"><i class="fa-solid fa-hand-holding-heart fa-lg mx-2 my-3"></i>Perks</a></li>
                <li ><a href="/aboutus"><i class="fa-solid fa-users fa-lg mx-2 my-3"></i>About Us</a></li>
                <li class="navbar-selected"><a href="/admin_login"><i class="fa-solid fa-briefcase fa-lg mx-2 my-3"></i>Admin Login</a></li>
            </nav>
            <!--End of Navigation-->

        </div>
        <!--End of Container-->
    </div>
    <!--End of Main Page Header-->

    <!-- Company Logo -->
    <a href="/"><img src="images/logos/3.png" height="62px" class="company-logo"></a>
    <!--End of Company Logo -->

    <!--Login form card-->
    <div id="admin-login-card" class="card registration-form-card col-4 bg-transparent border-0">
        <!--Card body-->
        <div class="card-body">
            <!--Form header-->
            <h1 class="form-header card-title mb-3">
                <i class="fa-solid fa-briefcase me-3"></i></i> Admin Login
            </h1>
            <!--End of Form header-->

            <!-- Display Message -->
            <c:if test="${requestScope.success != null}">
                <div class="alert alert-success text-center border border-success">
                    <b>${requestScope.success}</b>
                </div>
            </c:if>
            <!-- End of Display Message -->

            <!-- Display Message -->
            <c:if test="${logged_out != null}">
                <div class="alert alert-info text-center border border-info">
                    <b>${logged_out}</b>
                </div>
            </c:if>
            <!-- End of Display Message -->

            <!-- Display Message -->
            <c:if test="${requestScope.error != null}">
                <div class="alert alert-danger text-center border border-danger">
                    <b>${requestScope.error}</b>
                </div>
            </c:if>
            <!-- End of Display Message -->

            <!--Login form-->
            <form action="/adminlogin" method="POST" class="login-form">

                <!--Form group-->
                <div class="form-group col mb-4">
                    <input type="text" name="admin_id" class="form-control form-control-lg" placeholder="Enter Admin Identification Code" />
                </div>
                <!--End of Form group-->

                <!--Form group-->
                <div class="form-group col mb-4">
                    <input type="text" name="admin_email" class="form-control form-control-lg" placeholder="Enter Admin Email: abc@cadmus.com" />
                </div>
                <!--End of Form group-->
                <!--Form group-->
                <div class="form-group col mb-4">
                    <input type="password" name="admin_password" class="form-control form-control-lg" placeholder="Enter Admin Password" />
                </div>
                <!--End of Form group-->

                <!--Form group-->
                <button class="btn btn-lg admin-login-btn" type="submit">Login</button>
                <!--End of Form group-->

            </form>
            <!--End of Login form-->

        </div>
        <!--End of Card body-->
    </div>
    <!--End of Login form card-->
</body>
</html>