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
    <title>OTP Gateway</title>
</head>
<body class="d-flex align-items-center justify-content-center bg-image otp-gateway">
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
                <i class="fa fa-key me-2"></i> OTP Verification
            </h1>
            <!--End of Form header-->

            <!--Login form-->
            <form action="/otpvalidate" method="POST" class="login-form">


                <div class="my-4">
                    <h5>Please enter the One Time Password (OTP) to verify your login</h5>
                    <small>A code has been sent to ${contact}</small>
                    <div>
                        <small> The OTP expires in: <b> <span class="text-danger ms-2" id="timer"></span></b></small>
                    </div>

                    <div id="otp" class="inputs d-flex mt-3">
                        <input class="m-3 text-center form-control rounded" type="text" name="otp1" id="otp1" maxlength="1" onkeyup="moveToNext(this, 'otp2')" autofocus/>
                        <input class="m-3 text-center form-control rounded" type="text" name="otp2" id="otp2" maxlength="1" onkeyup="moveToNext(this, 'otp3')" />
                        <input class="m-3 text-center form-control rounded" type="text" name="otp3" id="otp3" maxlength="1" onkeyup="moveToNext(this, 'otp4')" />
                        <input class="m-3 text-center form-control rounded" type="text" name="otp4" id="otp4" maxlength="1" onkeyup="moveToNext(this, 'otp5')" />
                        <input class="m-3 text-center form-control rounded" type="text" name="otp5" id="otp5" maxlength="1" onkeyup="moveToNext(this, 'otp6')" />
                        <input class="m-3 text-center form-control rounded" type="text" name="otp6" id="otp6" maxlength="1" onkeyup="moveToNext(this, 'otp6')" />
                    </div>
                </div>

                <!--Form group-->
                <div class="container" style="margin-left: 150px"><button class="btn btn-lg login_button mx-auto">Login</button></div>
                <!--End of Form group-->

            </form>
            <!--End of Login form-->

        </div>
        <!--End of Card body-->
    </div>
    <!--End of Login form card-->

    <script>
        var container = document.getElementsByClassName("inputs")[0];
        container.onkeyup = function(e) {
        var target = e.target;
        var maxLength = parseInt(target.attributes["maxlength"].value);
        var myLength = target.value.length;
        if (myLength >= maxLength) {
            var next = target;
            next = next.nextElementSibling;
            if(next != null)
                next.focus();
        }

        else if (myLength === 0) {
            var previous = target;
            previous = previous.previousElementSibling;
            if(previous != null)
                previous.focus();
        }
    }
    </script>


    <script>
        var countdown = 2 * 60;
        var timerDisplay = document.getElementById("timer");

        function startTimer() {
            var minutes, seconds;
            var countdownInterval = setInterval(function() {
                minutes = Math.floor(countdown / 60);
                seconds = countdown % 60;

                // Add leading zeros if necessary
                var displayMinutes = ("0" + minutes).slice(-2);
                var displaySeconds = ("0" + seconds).slice(-2);

                timerDisplay.textContent = displayMinutes + ":" + displaySeconds;

                countdown--;

                if (countdown < 0) {
                    clearInterval(countdownInterval);
                    window.location.href = "http://localhost:8070/login?otp=expired";
                }
            }, 1000);
        }

        startTimer();
    </script>

</body>
</html>