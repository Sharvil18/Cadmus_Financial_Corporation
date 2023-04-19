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
    <title>Register</title>
</head>
<body class="d-flex align-items-center justify-content-center bg-image signup">

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
    <a href="/"><img src="images/logos/3.png" height="66px" class="company-logo"></a>
    <!--End of Company Logo -->

    <!--Registration form card-->
    <div class="card registration-form-card col-6 bg-transparent border-0">
        <!--Card body-->
        <div class="card-body">
            <!--Form header-->
            <h1 class="form-header card-title mb-3">
                <i class="fa-regular fa-address-card me-3"></i> Sign Up
            </h1>
            <!--End of Form header-->

            <!-- Display Message -->
            <c:if test="${requestScope.passwordMisMatch != null}">
                <div class="alert alert-danger text-center border border-danger">
                    <b>${requestScope.passwordMisMatch}</b>
                </div>
            </c:if>
            <!-- End of Display Message -->

            <!-- Display Message -->
            <c:if test="${requestScope.EmailExists != null}">
                <div class="alert alert-danger text-center border border-danger">
                    <b>${requestScope.EmailExists}</b>
                </div>
            </c:if>
            <!-- End of Display Message -->

            <!-- Display Message -->
            <c:if test="${requestScope.success != null}">
                <div class="alert alert-success text-center border border-success">
                    <b>${requestScope.success}</b>
                </div>
            </c:if>
            <!-- End of Display Message -->

            <!--Registration form-->
            <form:form action="/register" class="reg-form" modelAttribute="registerUser">

                <!--Row-->
                <div class="row">
                    <!--Form group-->
                    <div class="form-group col">
                        <form:input type="text" path="first_name" class="form-control form-control-lg" placeholder="Enter First Name" />
                        <form:errors path="first_name" class="text-white bg-danger px-2" style="font-family: 'BioRhyme', serif;display: inline-block; margin-top: 5px" />
                    </div>
                    <!--End of Form group-->

                    <!--Form group-->
                    <div class="form-group col">
                        <form:input type="text" path="last_name" class="form-control form-control-lg" placeholder="Enter Last Name" />
                        <form:errors path="last_name" class="text-white bg-danger px-2" style="font-family: 'BioRhyme', serif;display: inline-block; margin-top: 5px" />
                    </div>
                    <!--End of Form group-->
                </div>
                <!--End of Row-->

                <!--Form group-->
                <div class="form-group col">
                    <form:input type="text" path="email" class="form-control form-control-lg" placeholder="Enter Email" />
                    <form:errors path="email" class="text-white bg-danger px-2" style="font-family: 'BioRhyme', serif;display: inline-block; margin-top: 5px" />
                </div>
                <!--End of Form group-->

                <!--Row-->
                <div class="row">
                    <!--Form group-->
                    <div class="form-group col">
                        <form:input type="password" path="password" id="passwordInput" class="form-control form-control-lg" placeholder="Enter Password" />
                        <form:errors path="password" class="text-white bg-danger px-2" style="font-family: 'BioRhyme', serif;display: inline-block; margin-top: 5px" />
                        <!-- Password strength meter -->
                        <div id="strengthBox" class="text-center mt-4 mb-3 alert border alert-dark border-dark">Password Strength Meter</div>
                        <!-- End of Password strength meter -->
                    </div>
                    <!--End of Form group-->

                    <!--Form group-->
                    <div class="form-group col">
                        <input type="password" name="confirm_password" class="form-control form-control-lg" placeholder="Re-Enter Password" />
                        <errors class="text-white bg-danger px-2" style="font-family: 'BioRhyme', serif;display: inline-block; margin-top: 5px" >${confirm_pass}</errors>
                    </div>
                    <!--End of Form group-->
                </div>
                <!--End of Row-->

                <!--Form group-->
                <button class="btn btn-lg register_button">Register</button>
                <!--End of Form group-->

            </form:form>
            <!--End of Registration form-->

            <!--Card Text-->
            <p class="card-text mt-4">
                Already have an account? <a href="/login" id="login_link">Login</a>
            </p>
            <!--End of Card Text-->

            <!--Back button to home page-->
            <p>
                <a href="/" id="back_button" class="btn btn-md"><i class="fa fa-arrow-alt-circle-left me-2"></i> Back</a>
            </p>
            <!--End of Back button to home page-->

            <!-- Password Strength Suggestions -->
            <div id="suggest">
                <h1>Tips for a stronger password:</h1>
                <div id="tip"></div>
            </div>
            <!--End of Password Strength Suggestions -->

        </div>
        <!--End of Card body-->
    </div>
    <!--End of Registration form card-->

    <script>
        var timeout;
        const password = document.getElementById('passwordInput');
        const strengthBox = document.getElementById('strengthBox');
        const suggest = document.getElementById('suggest');
        const tip = document.getElementById('tip');
        var tipString = '<ul>';

        const length8Regex = new RegExp('.{8,}');
        const length6Regex = new RegExp('.{6,}');
        const upperRegex = new RegExp('.*[A-Z]');
        const lowerRegex = new RegExp('.*[a-z]');
        const digitRegex = new RegExp('.*[0-9]');
        const specialCharRegex = new RegExp('[^A-Za-z0-9]');

        function PasswordStrength(password) {
            isLength8 = length8Regex.test(password);
            isUpper = upperRegex.test(password);
            isLower = lowerRegex.test(password);
            isDigit = digitRegex.test(password);
            isSpecial = specialCharRegex.test(password);

            if(strengthBox.innerHTML == 'Strong') {
                if(strengthBox.classList.contains('alert-danger')) {
                    strengthBox.classList.replace('alert-danger','alert-success');
                    strengthBox.classList.replace('border-danger', 'border-success');
                }
                else if(strengthBox.classList.contains('alert-warning')) {
                    strengthBox.classList.replace('alert-warning','alert-success');
                    strengthBox.classList.replace('border-warning', 'border-success');
                }
            }

            if(strengthBox.innerHTML == 'Medium') {
                if(strengthBox.classList.contains('alert-danger')) {
                    strengthBox.classList.replace('alert-danger','alert-warning');
                    strengthBox.classList.replace('border-danger', 'border-warning');
                }
                else if(strengthBox.classList.contains('alert-success')) {
                    strengthBox.classList.replace('alert-success','alert-warning');
                    strengthBox.classList.replace('border-success', 'border-warning');
                }
            }

            if(strengthBox.innerHTML == 'Weak') {
                if(strengthBox.classList.contains('alert-warning')) {
                    strengthBox.classList.replace('alert-warning','alert-danger');
                    strengthBox.classList.replace('border-warning', 'border-danger');
                }
                else if(strengthBox.classList.contains('alert-success')) {
                    strengthBox.classList.replace('alert-success','alert-danger');
                    strengthBox.classList.replace('border-success', 'border-danger');
                }
            }

            if(isLength8 & isUpper & isLower & isDigit & isSpecial) {
                strengthBox.classList.replace('alert-warning', 'alert-success');
                strengthBox.classList.replace('border-warning', 'border-success');
                strengthBox.innerHTML = 'Strong';
                tip.innerHTML = '<ul>';
            }

            else if(isLength8 & isLower & isDigit & isSpecial) {
                strengthBox.classList.replace('alert-danger','alert-warning');
                strengthBox.classList.replace('border-danger','border-warning');
                strengthBox.innerHTML = 'Medium';
                tipString = "<ul>";
                tipString += '<li>Upper Character</li>';
                tip.innerHTML = tipString;
            }

            else if(isLength8 & isUpper & isDigit & isSpecial) {
                strengthBox.classList.replace('alert-danger','alert-warning');
                strengthBox.classList.replace('border-danger','border-warning');
                strengthBox.innerHTML = 'Medium';
                tipString = "<ul>";
                tipString += '<li>Lower Character</li>';
                tip.innerHTML = tipString;
            }

            else if(isLength8 & isUpper & isLower & isSpecial) {
                strengthBox.classList.replace('alert-danger','alert-warning');
                strengthBox.classList.replace('border-danger','border-warning');
                strengthBox.innerHTML = 'Medium';
                tipString = "<ul>";
                tipString += '<li>Digits</li>';
                tip.innerHTML = tipString;
            }

            else if(isLength8 & isUpper & isLower & isDigit) {
                strengthBox.classList.replace('alert-danger','alert-warning');
                strengthBox.classList.replace('border-danger','border-warning');
                strengthBox.innerHTML = 'Medium';
                tipString = "<ul>";
                tipString += '<li>Special Characters</li>';
                tip.innerHTML = tipString;
            }

            else {
                strengthBox.classList.replace('alert-dark','alert-danger');
                strengthBox.classList.replace('border-dark', 'border-danger');
                strengthBox.innerHTML = 'Weak';
                tipString = "<ul>";
                if(!isLength8) {
                    tipString += '<li>8 characters</li>';
                }
                if(!isUpper) {
                    tipString += '<li>uppercase</li>';
                }
                if(!isLower) {
                    tipString += '<li>lowercase</li>';
                }
                if(!isDigit) {
                    tipString += '<li>digit</li>';
                }
                if(!isSpecial) {
                    tipString += '<li>special character</li>';
                }
                tipString += "</ul>";
                tip.innerHTML = tipString;
            }
        }

        password.addEventListener('input', () => {
            strengthBox.style.display = 'block';
            suggest.style.display = 'block';
            tipString = '<ul>';
            clearTimeout(timeout);
            timeout = setTimeout(() => PasswordStrength(password.value), 500);
            PasswordStrength(password.value);
            if(password.value.length !== 0) {
                strengthBox.style.display != 'block';
                suggest.style.display = 'block';
            } else {
                strengthBox.style.display = 'none';
                suggest.style.display = 'none';
            }
        });
    </script>
</body>
</html>