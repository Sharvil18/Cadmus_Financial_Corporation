<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!--Transfer card-->
            <div class="card transfer-card bg-transparent">
                <!--Card body-->
                <div class="card-body">
                    <!-- Transfer form -->
                    <form action="/transact/transfer" method="POST">
                        <!--Select account option-->
                        <!-- <button class="btn dropdown-toggle my-3 mx-0" type="button" id="accountDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            Select Account
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="accountDropdown">
                            <li><a class="dropdown-item" value="">-- select account --</a></li>
                        </ul> -->
                        <!--Form group-->
                        <div class="form-group">
                            <label for="">Select Transferor Account</label>
                            <select name="transfer_from" class="form-control my-3" id="">
                                <option value="">-- Select Account --</option>
                                <c:if test="${userAccounts != null}">
                                    <c:forEach items="${userAccounts}" var="selectAccount">
                                        <option value="${selectAccount.account_id}">${selectAccount.account_name}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                        <!-- End of Form group-->
                        <!--Form group-->
                        <div class="form-group">
                            <label for="">Select Transferee Account</label>
                            <select name="transfer_to" class="form-control my-3" id="">
                                <option value="">-- Select Account --</option>
                                <c:if test="${userAccounts != null}">
                                    <c:forEach items="${userAccounts}" var="selectAccount">
                                        <option value="${selectAccount.account_id}">${selectAccount.account_name}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                        <!-- End of Form group-->
                        <!--End of Select account option-->
                        <!--Form group-->
                        <div class="form-group mb-4">
                            <label for="">Enter Transfer Amount</label>
                            <input type="text" name="transfer_amount" class="form-control mt-2" placeholder="Enter Transfer Amount"/>
                        </div>
                        <!--End of Form group-->
                        <!--Form group-->
                        <div class="form-group mb-4">
                            <button class="btn btn-md transaction-btn">Transfer</button>
                        </div>
                        <!--End of Form group-->
                    </form
                    <!-- End of Transfer form -->
                </div>
                <!--End of Card body-->
            </div>
            <!--End of transfer card-->