<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!--Accounts Offcanvas-->
    <div class="offcanvas offcanvas-top col-5 mx-auto" tabindex="-1" id="offcanvasaccount" aria-labelledby="offcanvasaccount">
        <!--Offcanvas Header-->
        <div class="offcanvas-header">
            <h2 class="offcanvas-title" id="offcanvasaccount">Create or Add an Account</h2>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <!--End of Offcanvas Header-->

        <!--Offcanvas Body-->
        <div class="offcanvas-body">
            <br>
            <p class="card-text my-2">
                Select one of the options below to perform a transaction
            </p>
            <!--Account form card-->
            <div class="card bg-transparent">
                <!--Card body-->
                <div class="card-body">
                    <form action="/account/create_account" method="POST" class="add-account-form">
                        <!--Form group-->
                        <div class="form-group mb-3">
                            <label for="">Select Account Type</label>
                            <select name="account_type" class="form-control" id="">
                                <option value="">-- Select Account Type --</option>
                                <option value="check">Check</option>
                                <option value="savings">Savings</option>
                                <option value="business">Business</option>
                            </select>
                        </div>
                        <!--End of Form group-->
                        <!--Form group-->
                        <div class="form-group mb-3">
                            <label for="">Enter Account Name</label>
                            <input type="text" name="account_name" class="form-control" placeholder="Enter Account Name">
                        </div>
                        <!--End of Form group-->
                        <!--Form group-->
                        <div class="form-group mb-4">
                            <button class="btn btn-md account-btn">Add Account</button>
                        </div>
                        <!--End of Form group-->
                    </form>
                </div>
                <!--End of Card body-->
            </div>
            <!--End of Account form card-->
        </div>
        <!--End of Offcanvas Body-->

        <!--Script for blurring effect-->
        <script>
            const offcanvasAcc =
                document.getElementById('offcanvasaccount')
            offcanvasAcc.addEventListener('show.bs.offcanvas', () => {
                document.getElementById('blur-effect').style.filter = "blur(6px)";
            })
            offcanvasAcc.addEventListener('hide.bs.offcanvas', () => {
                document.getElementById('blur-effect').style.filter = "blur(0px)";
            })
        </script>
        <!--End of Script for blurring effect-->
    </div>
<!--End of Accounts Offcanvas-->