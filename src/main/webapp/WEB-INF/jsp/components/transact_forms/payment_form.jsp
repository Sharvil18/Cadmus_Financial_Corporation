<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!--Payment card-->
            <div class="card payment-card bg-transparent">
                <!--Card body-->
                <div class="card-body">
                    <!-- Payment form -->
                    <form action="/transact/payment" method="POST">
                        <!--Form group-->
                        <div class="form-group mb-4">
                            <label for="">Account Holder / Beneficiary</label>
                            <input type="text" name="beneficiary" class="form-control mt-2"  placeholder="Enter Account holder / Beneficiary name"/>
                        </div>
                        <!--End of Form group-->
                        <!--Form group-->
                        <div class="form-group mb-4">
                            <label for="">Beneficiary Account Number</label>
                            <input type="text" name="account_number" class="form-control mt-2" placeholder="Enter Beneficiary Account number"/>
                        </div>
                        <!--End of Form group-->

                        <!--Select account option-->
                        <!-- <button class="btn dropdown-toggle my-3 mx-0" type="button" id="accountDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            Select Account
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="accountDropdown">
                            <li><a class="dropdown-item" value="">-- select account --</a></li>
                        </ul> -->
                        <!--Form group-->
                        <div class="form-group">
                            <label for="">Select Payment Account</label>
                            <select name="account_id" class="form-control my-3" id="">
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
                            <label for="">Reference</label>
                            <input type="text" name="reference" class="form-control mt-2"  placeholder="Enter Reference"/>
                        </div>
                        <!--End of Form group-->
                        <!--Form group-->
                        <div class="form-group mb-4">
                            <label for="">Enter Payment Amount</label>
                            <input type="text" name="payment_amount" class="form-control mt-2" placeholder="Enter Payment Amount"/>
                        </div>
                        <!--End of Form group-->
                        <!--Form group-->
                        <div class="form-group mb-4">
                            <button class="btn btn-md transaction-btn">Pay</button>
                        </div>
                        <!--End of Form group-->
                    </form>
                    <!-- End of Payment form -->
                </div>
                <!--End of Card body-->
            </div>
<!--End of Payment card-->