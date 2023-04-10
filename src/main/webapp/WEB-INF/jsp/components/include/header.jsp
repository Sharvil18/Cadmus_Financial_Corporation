<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

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
                    <li><a href="">Dashboard</a></li>
                    <li><a href="">Payment History</a></li>
                    <li><a href="">Transaction History</a></li>
                </nav>
                <!--End of Navigation-->

                <!-- Company Logo -->
                <img src="src/main/resources/static/images/logos/4.png" height="58px" class="company-logo">
                <!--End of Company Logo -->

                <!--Display Name-->
                <div class="display-name ms-auto text-white">
                    <i class="fa fa-circle text-success me-2"></i> Welcome: <span>${user.first_name} ${user.last_name}</span>
                </div>
                <!--End of Display Name-->

                <!--Signout button-->
                <a href="/logout" class="btn btn-md text-white ms-5">
                    <i class="fa-solid fa-right-from-bracket me-2"></i>Sign Out
                </a>
                <!--End of Signout button-->
            </div>
            <!--End of Container-->
        </div>
<!--End of Main Page Header-->