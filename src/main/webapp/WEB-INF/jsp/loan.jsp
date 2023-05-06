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
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/fontawesome/css/all.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/loan.css">
    <title>Loan</title>
</head>

<body>
    <!-- Header -->
        <c:import url="components/include/header.jsp"/>


        <!-- Account check -->
                <c:choose>
                    <c:when test="${fn:length(userAccounts) == 0}">
                        <!-- Dont Display Accounts -->
                        <c:import url="components/no_account_display_view.jsp"/>
                    </c:when>
                    <c:otherwise>
                        <!-- Total balance check -->
                        <c:choose>
                            <c:when test="${totalAccountBalance >= 50000}">
                                <!-- Display loan -->
                                <c:import url="components/loan_display.jsp"/>

                            </c:when>
                            <c:otherwise>
                                <!-- Dont display loan -->
                                <c:import url="components/no_loan_display.jsp"/>
                            </c:otherwise>
                        </c:choose>
                        <!-- End of Total balance check -->
                    </c:otherwise>
                </c:choose>
                <!-- End of Account check -->

</body>

</html>