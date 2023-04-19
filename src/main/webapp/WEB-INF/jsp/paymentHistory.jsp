<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://example.com/functions" prefix="f" %>
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
    <title>Payment History</title>
</head>
<body>
    <div id="blur-effect">

        <!-- Header -->
        <c:import url="components/include/header.jsp"/>

        <!-- Account check -->
        <c:choose>
            <c:when test="${fn:length(userAccounts) == 0}">
                <!-- Dont Display Accounts -->
                <c:import url="components/no_account_display_view.jsp"/>
            </c:when>
            <c:otherwise>
                <!-- Payment check -->
                <c:choose>
                    <c:when test="${fn:length(payment_history) > 0}">
                        <!-- Display payment history -->
                        <c:import url="components/record_views/PaymentHistoryDisplay.jsp"/>
                    </c:when>
                    <c:otherwise>
                        <!-- Dont display payment history -->
                        <c:import url="components/record_views/PaymentHistoryNoDisplay.jsp"/>
                    </c:otherwise>
                </c:choose>
                <!-- End of Payment check -->
            </c:otherwise>
        </c:choose>
        <!-- End of Account check -->

<!-- Footer -->
<c:import url="components/include/footer.jsp"/>