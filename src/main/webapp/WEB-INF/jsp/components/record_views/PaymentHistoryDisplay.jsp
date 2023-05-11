<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://example.com/functions" prefix="f" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
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
                                <th style="position: sticky; top:51px">Record Number</th>
                                <th style="position: sticky; top:51px">Date</th>
                                <th style="position: sticky; top:51px">Beneficiary</th>
                                <th style="position: sticky; top:51px">Beneficiary Acc. No.</th>
                                <th style="position: sticky; top:51px">Beneficiary Bank</th>
                                <th style="position: sticky; top:51px">Amount</th>
                                <th style="position: sticky; top:51px">Status</th>
                                <th style="position: sticky; top:51px">Reference</th>
                                <th style="position: sticky; top:51px">Reason Code</th>
                                <th style="position: sticky; top:51px">Time</th>
                            </tr>
                            <!-- Loop Through Payment History Records -->
                            <c:forEach items="${requestScope.payment_history}" var="payments">
                            <tr style="border-bottom: 2px solid #413A92;">
                                <td>${payments.payment_id}</td>
                                <td>${f:getFormattedDate(payments.created_at)}</td>
                                <td>${payments.beneficiary}</td>
                                <td>${payments.beneficiary_acc_no}</td>
                                <td>${payments.beneficiary_bank}</td>
                                <td>${payments.amount}</td>
                                <td>${payments.status}</td>
                                <td>${payments.reference_no}</td>
                                <td>${payments.reason_code}</td>
                                <td>${f:getFormattedTime(payments.created_at)}</td>
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