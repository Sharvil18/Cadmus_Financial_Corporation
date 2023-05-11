<!--Main Page Header-->
    <div class="main-page-header mb-3" id="header" style="position: fixed; z-index: 1; left: 0px; right: 0px; top: 0px;">
        <!--Container-->
        <div class="container-fluid d-flex align-items-center justify-content-center mb-2 mt-3">
            <!--Company name-->
            <div class="company-name">
                <span>( admin )</span> Cadmus Finance Corporation
            </div>
            <!--End of Company name-->

            <!--Navigation-->
            <div class="navigation ms-3 me-5">
                <li><a href="admin_dashboard">Dashboard</a></li>
                <li><a href="application_panel">Applications</a></li>
                <li><a href="employee_panel">Employees</a></li>
                <li><a href="">Customers</a></li>
                <li><a href="">Customer Affluency</a></li>
                <li><a href="">Branches</a></li>
            </div>
            <!--End of Navigation-->

            <!-- Company Logo -->
                <a href="/app/admin_dashboard"><img src="images/logos/5.png" height="72px" style="position: fixed;" class="company-logo"></a>
            <!--End of Company Logo -->

            <!--Display Name-->
            <div class="display-name ms-5 text-white">
                <i class="fa fa-circle text-success me-2"></i> Welcome: Admin <span>${admin.admin_first_name} ${admin.admin_last_name}</span>
            </div>
            <!--End of Display Name-->

            <!--Signout button-->
            <a href="/adminlogout" class="btn btn-md text-white mt-1 ms-3">
                <i class="fa-solid fa-right-from-bracket ms-3 me-3"></i>Sign Out
            </a>
            <!--End of Signout button-->
        </div>
        <!--End of Container-->
    </div>
    <!--End of Main Page Header-->

    <div style="height:100px"></div>