<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://example.com/functions" prefix="f" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

        <!-- Container -->
        <div class="payment-history">
        <!-- Card: Transaction History Card -->
        <div class="card shadow">
            <!-- Card Header -->
            <div class="card-header">
                <h2><i class="fa fa-file-invoice-dollar me-2" aria-hidden="true"></i> Transaction History</h2>
            </div>
            <!-- End Of Card Header -->

            <!-- Card Body -->
            <div class="card-body">
                <c:if test="${requestScope.transact_history != null}">
                    <table class="table text-center table-striped">
                    <tr>
                        <th style="position: sticky; top: 51px">Date</th>
                        <th style="position: sticky; top: 51px">Transaction ID</th>
                        <th style="position: sticky; top: 51px">Transaction Type</th>
                        <th style="position: sticky; top: 51px">Amount</th>
                        <th style="position: sticky; top: 51px">Source</th>
                        <th style="position: sticky; top: 51px">Status</th>
                        <th style="position: sticky; top: 51px">Reason Code</th>
                        <th style="position: sticky; top: 51px">Time</th>
                    </tr>
                    <c:forEach items="${requestScope.transact_history}" var="transactionHistory">
                      <tr style="border-bottom: 2px solid #413A92;">
                          <td>${f:getFormattedDate(transactionHistory.created_at)}</td>
                          <td>${transactionHistory.transaction_id}</td>
                          <td>${transactionHistory.transaction_type}</td>
                          <td>${transactionHistory.amount}</td>
                          <td>${transactionHistory.source}</td>
                          <td>${transactionHistory.status}</td>
                          <td>${transactionHistory.reason_code}</td>
                          <td>${f:getFormattedTime(transactionHistory.created_at)}</td>
                      </tr>
                    </c:forEach>
                    </table>
                </c:if>
            </div>
            <!-- End Of Card Body -->

            <!-- Card footer -->
            <div class="card-footer">
                <h4 class="my-3"><a href="transaction_history_export_pdf"><i class="fa-solid fa-download me-3"></i>Download Transaction History as PDF</a></h4>
            </div>
            <!-- End of Card footer -->
        </div>
        <!-- End Of Card: Transaction History Card -->

        </div>
        <!-- End of Container -->