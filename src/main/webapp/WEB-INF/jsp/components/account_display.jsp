<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://example.com/functions" prefix="f" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>



        <!--Container-->
        <div class="container d-flex">
            <!--Account Button-->
            <button data-bs-toggle="offcanvas" data-bs-target="#offcanvasaccount" class="btn btn-lg account-btn" type="button"><i class="fa-regular fa-credit-card fa-xl me-2"></i>Add new Account</button>
            <!--End of Account Button-->

            <!--Transaction Button-->
            <button data-bs-toggle="offcanvas" data-bs-target="#offcanvastransaction" class="btn btn-lg ms-auto transaction-btn" type="button"><i class="fa-solid fa-file-invoice-dollar me-2 fa-xl"></i>Transaction</button>
            <!--End of Transaction Button-->
        </div>
        <!--End of Container-->

        <!--Total accounts balance display container-->
        <div class="container d-flex my-4">
            <h2 class="me-auto">Total Accounts Balance:</h2>
            <h2 class="ms-auto">
                <c:if test="${requestScope.totalBalance != null}">
                    <c:out value="${totalBalance}" />
                </c:if>
            </h2>
        </div>
        <!--End of Total accounts balance display container-->

        <!--Accordian menu container-->
        <div class="container my-4">
            <!--Accordian menu-->
            <c:if test="${requestScope.userAccounts != null }">
                <c:forEach items="${requestScope.userAccounts}" var="account">
                    <div class="accordion accordion-flush" id="accordionFlushExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-headingOne">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-${account.account_id}" aria-expanded="false" aria-controls="flush-collapseOne" style="font-size: 19px">
                                  ${account.account_name}
                                </button>
                            </h2>
                            <div id="flush-${account.account_id}" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                    <!-- Account Details List -->
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item d-flex">Account Name <span class="ms-auto"><b>${account.account_name}</b></span></li>
                                        <li class="list-group-item d-flex">Account Number <span class="ms-auto"><b>${account.account_number}</b></span></li>
                                        <li class="list-group-item d-flex">Account Type <span class="ms-auto"><b>${account.account_type}</b></span></li>
                                        <li class="list-group-item d-flex">Account Balance <span class="ms-auto"><b>${account.balance}</b></span></li>
                                        <li class="list-group-item d-flex">Created at Date <span class="ms-auto"><b>${f:formatLocalDateTime(account.created_at, 'yyyy/MM/dd')}</b></span></li>
                                    </ul>
                                    <!-- Account Details List -->
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <!--End of Accordian menu-->
        </div>
        <!--End of Accordian menu container-->