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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="css/default.css">
    <title>Register</title>
</head>
<style>
.custom-popover {
    --bs-popover-max-width: 400px;
    --bs-popover-header-bg: white;
    --bs-popover-border-color: black;
    font-size: 16px;
}

.custom-popover .popover-header {
    font-size: 20px;
    color: black;
    font-weight: bold;
}
</style>
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
    <a href="/"><img src="images/logos/3.png" height="62px" class="company-logo"></a>
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
            <c:if test="${requestScope.ContactExists != null}">
                <div class="alert alert-danger text-center border border-danger">
                    <b>${requestScope.ContactExists}</b>
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
            <form:form action="/register" id="reg-form" class="reg-form" modelAttribute="registerUser">

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

                <!--Form group-->
                <div class="form-group col mt-3">
                    <form:input type="text" path="contact" class="form-control form-control-lg" placeholder="Enter Contact" />
                    <form:errors path="contact" class="text-white bg-danger px-2" style="font-family: 'BioRhyme', serif;display: inline-block; margin-top: 5px" />
                </div>
                <!--End of Form group-->

                <!--Row-->
                <div class="row">
                    <!--Form group-->
                    <div class="form-group col">
                        <form:input type="password" path="password" id="passwordInput" class="form-control form-control-lg" placeholder="Enter Password" />
                        <form:errors path="password" class="text-white bg-danger px-2" style="font-family: 'BioRhyme', serif;display: inline-block; margin-top: 5px" />
                        <errors class="text-white bg-danger px-2" style="font-family: 'BioRhyme', serif;display: inline-block; margin-top: 5px" >${pass}</errors>
                        <!-- Password strength meter -->
                        <span tabindex="0" id="tipPassword" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-title="Tips for a stronger password" data-bs-html="true" data-bs-custom-class="custom-popover" data-bs-placement="left" data-bs-content="Strength Password">
                            <div id="strengthBox" class="text-center mt-4 mb-3 alert border alert-dark border-dark">Password Strength Meter</div>
                        </span>
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

                <div class="form-group">
                    <input type="hidden" name="password-strength" id="passwordStrength" class="form-control form-control-lg"/>
                </div>

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

                            <div class="toast mx-auto mb-5" id="GL_error-toast-personal-info" data-bs-delay="10000" role="alert" aria-live="assertive" aria-atomic="true">
                                <div class="toast-header">

                                <h5 class="me-auto text-danger"><i class="fa-solid fa-triangle-exclamation me-3"></i>Error</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                </div>
                                <div class="toast-body text-white bg-danger text-center" style="font-size: 17px" id="GL_error-toast-msg-personal-info">
                                    Toast message
                                </div>
                            </div>

        </div>
        <!--End of Card body-->
    </div>
    <!--End of Registration form card-->

    <script>
        const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]');
        const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl));
    </script>

    <script>
        var timeout;
        const password = document.getElementById('passwordInput');
        const strengthBox = document.getElementById('strengthBox');
        const tipPopover = bootstrap.Popover.getOrCreateInstance('#tipPassword');

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
                document.getElementById('passwordStrength').value = 'Strong';
                tipPopover.setContent({
                    '.popover-header': "<div class='text-success'>This is a strong password!</div>",
                    '.popover-body' : ''
                });
            }

            else if(isLength8 & isLower & isDigit & isSpecial) {
                strengthBox.classList.replace('alert-danger','alert-warning');
                strengthBox.classList.replace('border-danger','border-warning');
                strengthBox.innerHTML = 'Medium';
                document.getElementById('passwordStrength').value = 'Medium';
                tipString = "<ul>";
                tipString += '<li>Upper Character</li>';
                tipPopover.setContent({
                    '.popover-header': "<div class='text-warning'>Tips for a strong password:</div>",
                    '.popover-body': tipString
                });
            }

            else if(isLength8 & isUpper & isDigit & isSpecial) {
                strengthBox.classList.replace('alert-danger','alert-warning');
                strengthBox.classList.replace('border-danger','border-warning');
                strengthBox.innerHTML = 'Medium';
                document.getElementById('passwordStrength').value = 'Medium';
                tipString = "<ul>";
                tipString += '<li>Lower Character</li>';
                tipPopover.setContent({
                    '.popover-header': "<div class='text-warning'>Tips for a strong password:</div>",
                    '.popover-body': tipString
                });
            }

            else if(isLength8 & isUpper & isLower & isSpecial) {
                strengthBox.classList.replace('alert-danger','alert-warning');
                strengthBox.classList.replace('border-danger','border-warning');
                strengthBox.innerHTML = 'Medium';
                document.getElementById('passwordStrength').value = 'Medium';
                tipString = "<ul>";
                tipString += '<li>Digits</li>';
                tipPopover.setContent({
                    '.popover-header': "<div class='text-warning'>Tips for a strong password:</div>",
                    '.popover-body': tipString
                });
            }

            else if(isLength8 & isUpper & isLower & isDigit) {
                strengthBox.classList.replace('alert-danger','alert-warning');
                strengthBox.classList.replace('border-danger','border-warning');
                strengthBox.innerHTML = 'Medium';
                document.getElementById('passwordStrength').value = 'Medium';
                tipString = "<ul>";
                tipString += '<li>Special Characters</li>';
                tipPopover.setContent({
                    '.popover-header': "<div class='text-warning'>Tips for a strong password:</div>",
                    '.popover-body': tipString
                });
            }

            else {
                strengthBox.classList.replace('alert-dark','alert-danger');
                strengthBox.classList.replace('border-dark', 'border-danger');
                strengthBox.innerHTML = 'Weak';
                document.getElementById('passwordStrength').value = 'Weak';
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
                tipPopover.setContent({
                    '.popover-header': "<div class='text-danger'>Tips for a strong password:</div>",
                    '.popover-body': tipString
                });
            }
        }

        password.addEventListener('input', () => {
            strengthBox.style.display = 'block';
            tipString = '<ul>';
            clearTimeout(timeout);
            timeout = setTimeout(() => PasswordStrength(password.value), 500);
            PasswordStrength(password.value);
            if(password.value.length !== 0) {
                strengthBox.style.display != 'block';

            } else {
                strengthBox.style.display = 'none';
            }
        });
    </script>
</body>
</html>