<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!--Transaction Offcanvas-->
    <div class="offcanvas offcanvas-top col-5 mx-auto" tabindex="-1" id="offcanvastransaction" aria-labelledby="offcanvastransaction">
        <!--Offcanvas Header-->
        <div class="offcanvas-header">
            <h2 class="offcanvas-title" id="offcanvastransaction">Transaction</h2>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <!--End of Offcanvas Header-->

        <!--Offcanvas Body-->
        <div class="offcanvas-body">
            <br>
            <p class="card-text my-2">
                Select one of the options below to perform a transaction
            </p>
            <!--Transaction type drop down-->
            <!-- <button class="btn dropdown-toggle my-3 mx-0" type="button" id="transactDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                Select Transaction Type
            </button>
            <ul class="dropdown-menu    " aria-labelledby="transactDropdown" id="transact-type">
                <li><a class="dropdown-item" value="payment">Payment</a></li>
                <li><a class="dropdown-item" value="transfer">Transfer</a></li>
                <li><a class="dropdown-item" value="deposit">Deposit</a></li>
                <li><a class="dropdown-item" value="withdraw">Withdraw</a></li>
            </ul> -->

            <select name="transact-type" class="form-control my-3" id="transact-type">
                <option value="">-- Select Transaction Type --</option>
                <option value="payment">Payment</option>
                <option value="transfer">Transfer</option>
                <option value="deposit">Deposit</option>
                <option value="withdraw">Withdraw</option>
            </select>

            <!--End of Transaction type drop down-->

            <!-- Payment form card -->
            <c:import url="components/transact_forms/payment_form.jsp"/>
            <!-- Transfer form card -->
            <c:import url="components/transact_forms/transfer_form.jsp"/>
            <!-- Deposit form card -->
            <c:import url="components/transact_forms/deposit_form.jsp"/>
            <!-- Withdraw form card -->
            <c:import url="components/transact_forms/withdraw_form.jsp"/>






        </div>
        <!--End of Offcanvas Body-->

        <!--Script for blurring effect-->
        <script>
            const offcanvasTransac =
                document.getElementById('offcanvastransaction')
            offcanvasTransac.addEventListener('show.bs.offcanvas', () => {
                document.getElementById('blur-effect').style.filter = "blur(6px)";
            })
            offcanvasTransac.addEventListener('hide.bs.offcanvas', () => {
                document.getElementById('blur-effect').style.filter = "blur(0px)";
            })
        </script>
        <!--End of Script for blurring effect-->
    </div>
<!--End of Transaction Offcanvas-->