<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://example.com/functions" prefix="f" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

    <!-- Container -->
        <div class="container">
            <div class="no-payment-history">
                <!--No payment history card -->
                <div class="card shadow">
                    <!-- Card header -->
                    <div class="card-header">
                        <div style="position: relative;right: 70px;">
                            <i class="fa-solid fa-slash fa-4x my-2" style="position: relative; left: 75px; top: 7px;color: red;"></i>
                            <i class="fa-solid fa-cash-register fa-4x"></i>
                            <h1 style="display: inline; position: relative; bottom: 7px; left: 15px;">NO Transactions carried out</h1>
                        </div>
                    </div>
                    <!--End of Card header -->
                    <!-- Card body -->
                    <div class="card-body">
                        <!-- Card text -->
                        <div class="card-text">

                            You have not carried out any transactions at the moment. <br>
                            To initiate a transaction, please head to the transaction section or click the link below.
                        </div>
                        <!--End of Card text -->

                        <!-- Transaction button -->
                        <a href="dashboard?transaction=true"><button class="btn btn-md my-3 px-4" type="button" style="background-color: #635bbe;border: 2px solid #191637;box-shadow: 2px 3px 6px rgb(0, 0, 145);color: white; font-size: 20px;"><i class="fa-solid fa-file-contract me-3 fa-lg"></i>Transact</button></a>
                        <!--End of transaction button -->
                    </div>
                    <!--End of Card body -->
                </div>
                <!--End of No payment history card -->
            </div>
        <div class="container">
    <!--End of Container -->