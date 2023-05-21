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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Login</title>
</head>
<body class="d-flex align-items-center justify-content-center bg-image login">

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
                <li class="navbar-selected"><a href="/"><i class="fa-solid fa-house mx-2 my-2"></i>Home</a></li>
                <li ><a href="/perk"><i class="fa-solid fa-hand-holding-heart fa-lg mx-2 my-3"></i>Perks</a></li>
                <li ><a href="/aboutus"><i class="fa-solid fa-users fa-lg mx-2 my-3"></i>About Us</a></li>
                <li ><a href="/adminlogin"><i class="fa-solid fa-briefcase fa-lg mx-2 my-3"></i>Admin Login</a></li>
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
    <div class="card registration-form-card col-4 bg-transparent border-0">
        <!--Card body-->
        <div class="card-body">
            <!--Form header-->
            <h1 class="form-header card-title mb-3">
                <i class="fa fa-user-circle me-3"></i> Login
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
                <div id='error-msg' class="alert alert-danger text-center border border-danger">
                    <b>${requestScope.error}</b>
                </div>
            </c:if>
            <!-- End of Display Message -->

            <div class="toast mx-auto mb-5" id="HL_error-toast-personal-info" role="alert" aria-live="assertive" aria-atomic="true" style="display:none">
                <div class="toast-header">
                <h5 class="me-auto text-danger"><i class="fa-solid fa-triangle-exclamation me-3"></i>Error</h5>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body text-white bg-danger text-center" style="font-size: 17px" id="HL_error-toast-msg-personal-info">
                    Your OTP has expired. Please try again.
                </div>
            </div>

            <!--Login form-->
            <form action="/login" method="POST" class="login-form">

                <!--Form group-->
                <div class="form-group col mb-4">
                    <input type="text" name="email" class="form-control form-control-lg" placeholder="Enter Email" />
                </div>
                <!--End of Form group-->

                <div class="input-group col mb-4">
                  <span class="input-group-text me-2" style="height: 47px; position: relative; top:10px" id="basic-addon1">
                  <img src="https://cdn.britannica.com/97/1597-004-05816F4E/Flag-India.jpg" height="20px" class="me-1" /> +91
                  </span>
                  <input type="text" class="form-control form-control-lg" name="contact" placeholder="Enter Phone Number" aria-describedby="basic-addon1">
                </div>

                <!--Form group-->
                <div class="form-group col">
                    <input type="password" name="password" class="form-control form-control-lg" placeholder="Enter Password" />
                </div>
                <!--End of Form group-->

                <!--Form group-->
                <div class="form-group col">
                    <input type="hidden" name="_token" value="${token}" />
                </div>
                <!--End of Form group-->

                <!--Form group-->
                <button class="btn btn-lg login_button">Generate OTP</button>
                <!--End of Form group-->

            </form>
            <!--End of Login form-->

            <!--Card Text-->
            <p class="card-text mt-4">
                Don't have an account? <a href="/register" id="signup_link">Sign up</a>
            </p>
            <!--End of Card Text-->

            <!--Back button to home page-->
            <p>
                <a href="/" id="back_button" class="btn btn-md"><i class="fa fa-arrow-alt-circle-left me-2"></i> Back</a>
            </p>
            <!--End of Back button to home page-->

        </div>
        <!--End of Card body-->
    </div>
    <!--End of Login form card-->

<script>
    var urlParams = new URLSearchParams(window.location.search);
    var otpStatus = urlParams.get('otp');
    if(otpStatus == 'expired') {
        var otpToast = document.getElementById('HL_error-toast-personal-info');
        otpToast.style.display = 'block';
        const toast = new bootstrap.Toast(document.getElementById('HL_error-toast-personal-info'));
        toast.show();

        otpToast.addEventListener('hidden.bs.toast', function () {
            otpToast.style.display = 'none';
        });
    }
</script>

</body>
</html>