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
        <div class="payment-history">
               <!-- Payment history card -->
               <div class="card shadow">
                    <!-- Card header -->
                    <div class="card-header">
                        <h2><i class="fas fa-credit-card me-2" aria-hidden="true"></i> Payment History</h2>
                    </div>
                    <!-- End of Card header -->
                    <!-- Card body -->
                    <div class="card-body">
                        <c:if test="${requestScope.payment_history != null}">
                        <!-- Payment History Table -->
                        <table class="table text-center table-striped">
                            <tr>
                                <th>Record Number</th>
                                <th>Beneficiary</th>
                                <th>Beneficiary Account Number</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th>Reference</th>
                                <th>Reason Code</th>
                                <th>Created at</th>
                            </tr>
                            <!-- Loop Through Payment History Records -->
                            <c:forEach items="${requestScope.payment_history}" var="payments">
                            <tr style="border-bottom: 2px solid #413A92;">
                                <td>${payments.payment_id}</td>
                                <td>${payments.beneficiary}</td>
                                <td>${payments.beneficiary_acc_no}</td>
                                <td>${payments.amount}</td>
                                <td>${payments.status}</td>
                                <td>${payments.reference_no}</td>
                                <td>${payments.reason_code}</td>
                                <td>${payments.created_at}</td>
                            </tr>
                             </c:forEach>
                            <!-- End Of Loop Through Payment History Records -->

                        </table>
                        <!-- End Of Payment History Table -->
                    </c:if>
                    </div>
                    <!-- End of Card body -->

                    <!-- Card footer -->
                    <div class="card-footer">
                        <h4 class="my-3"><a href="payment_history_export_pdf"><i class="fa-solid fa-download me-3"></i>Download Payment History as PDF</a></h4>
                    </div>
                    <!-- End of Card footer -->
               </div>
               <!-- End of Payment history card -->

        </div>
        <!-- End of Container -->

<!-- Footer -->
<c:import url="components/include/footer.jsp"/>