<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!--No account container-->
        <div class="container mt-3">
            <!--No account card-->
            <div class="card no-account-card">
                <!--Card body-->
                <div class="card-body">
                    <!--Card title-->
                    <h1 class="card-title">
                        <i class="fa-solid fa-handshake-slash text-danger me-3 fa-lg"></i>NO Registered Accounts
                    </h1>
                    <!--End of Card title-->
                    <hr>
                    <!--Card text-->
                    <div class="card-text">
                        You currently do not have any registered accounts. <br>
                        To sign up or add a new account, please click the link below.
                    </div>
                    <!--End of Card text-->

                    <!--Account Button-->
                    <button data-bs-toggle="offcanvas" data-bs-target="#offcanvasaccount" class="btn btn-md account-btn mt-3 mb-3" type="button"><i class="fa-regular fa-credit-card fa-xl me-2"></i>Add new Account</button>
                    <!--End of Account Button-->

                </div>
                <!--End of Card body-->
            </div>
            <!--End of No account card-->
        </div>
<!--End of No account container-->