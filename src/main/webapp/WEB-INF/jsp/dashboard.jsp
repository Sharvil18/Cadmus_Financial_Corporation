<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="../css/fontawesome/css/all.css">
    <link rel="stylesheet" href="../css/main.css">
    <script src="../js/bootstrap.bundle.js"></script>
    <title>Dashboard</title>
</head>
<body>
    <div id="blur-effect">

        <!-- Header -->
        <c:import url="components/include/header.jsp"/>

        <!-- Container -->
        <div class="container">
            <!-- Display Message -->
            <c:if test="${success != null}">
                <div class="alert alert-success text-center border border-success">
                    <b>${success}</b>
                </div>
            </c:if>
            <!-- End of Display Message -->

            <!-- Display Message -->
            <c:if test="${error != null}">
                <div class="alert alert-danger text-center border border-danger">
                    <b>${error}</b>
                </div>
            </c:if>
            <!-- End of Display Message -->
        </div>
        <!-- End of Container -->

        <c:choose>
            <c:when test="${fn:length(userAccounts) > 0}">
                <!-- Display Accounts -->
                <c:import url="components/account_display.jsp"/>
            </c:when>
            <c:otherwise>
                <!-- Dont Display Accounts -->
                <c:import url="components/no_account_display.jsp"/>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Transaction Offcanvas -->
    <c:import url="components/transaction_offcanvas.jsp"/>

    <!-- Add Accounts Offcanvas -->
    <c:import url="components/add_account_offcanvas.jsp"/>

<!-- Footer -->
<c:import url="components/include/footer.jsp"/>


