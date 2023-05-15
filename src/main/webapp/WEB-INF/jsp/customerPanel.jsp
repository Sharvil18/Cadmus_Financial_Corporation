<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.time.LocalDateTime,java.time.ZoneId,java.util.Date" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/fontawesome/css/all.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="css/admin_main.css">
    <script src="js/bootstrap.bundle.js"></script>
    <title>Customer Panel</title>
</head>

<style>
    .highlight {
        color: #4f2900;
        background-color: #ffe18b;
        z-index: -1;
    }

</style>

<body>

    <a id='top'></a>


    <!-- Header -->
    <c:import url="components/include/admin_header.jsp"/>

    <i class="fa-solid fa-angles-up fa-3x" id="top-btn" style="color: white;position: fixed; right: 100px;top: 20px; z-index:1" onmouseover="this.style.cursor = 'pointer'" onclick="document.getElementById('top').scrollIntoView();"></i>

                            <ul class="nav nav-tabs ms-3"
                            style="--bs-nav-tabs-border-color: hsl(325, 28%, 23%); --bs-nav-tabs-link-hover-border-color: #4C2B3E; --bs-nav-tabs-link-active-bg: #fe8a80; --bs-nav-tabs-link-active-border-color: #664b00 "
                            id="myTab" role="tablist">

                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="disabled-tab"
                                    style="--bs-nav-tabs-link-active-bg: white;" data-bs-toggle="tab"
                                    data-bs-target="#disabled-tab-pane" type="button" role="tab"
                                    aria-controls="disabled-tab-pane" aria-selected="false">&nbsp;</button>
                            </li>

                            <li class="nav-item" role="presentation">
                                <button class="nav-link ${activeTab == 'customer' ? 'active' : ''}"
                                    style="--bs-nav-link-color: #4C2B3E; --bs-nav-link-font-weight: 700; font-family: 'Roboto', sans-serif;"
                                    id="customer-tab" data-bs-toggle="tab" data-bs-target="#customer-tab-pane" type="button"
                                    role="tab" aria-controls="customer-tab-pane" aria-selected="true">Customers</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link ${activeTab == 'payment' ? 'active' : ''}"
                                    style="--bs-nav-link-color: #4C2B3E; --bs-nav-link-font-weight: 700; font-family: 'Roboto', sans-serif;"
                                    id="payment-tab" data-bs-toggle="tab" data-bs-target="#payment-tab-pane" type="button"
                                    role="tab" aria-controls="payment-tab-pane" aria-selected="false">Payments</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link"
                                    style="--bs-nav-link-color: #4C2B3E; --bs-nav-link-font-weight: 700; font-family: 'Roboto', sans-serif;"
                                    id="accounts-tab" data-bs-toggle="tab" data-bs-target="#accounts-tab-pane" type="button"
                                    role="tab" aria-controls="accounts-tab-pane" aria-selected="false">Accounts</button>
                            </li>
                        </ul>


                        <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade ${activeTab == 'customer' ? 'show active' : ''}" id="customer-tab-pane" role="tabpanel" aria-labelledby="all-record-tab"
                                tabindex="0">

                                <div class="toast mx-auto my-3" id="toast-customer-search" role="alert" aria-live="assertive" aria-atomic="true">
                                    <div class="toast-header">
                                    <h5 class="me-auto text-danger"><i class="fa-solid fa-triangle-exclamation me-3"></i>Error</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                    </div>
                                    <div class="toast-body text-white bg-danger text-center" style="font-size: 17px" id="toast-msg-customer-search">
                                        Toast message
                                    </div>
                                </div>

                                <div class="container my-4">
                                <c:if test="${errorCustomer != null}">
                                    <div class="alert alert-danger text-center border border-danger">
                                        <b>${errorCustomer}</b>
                                    </div>
                                </c:if>
                                </div>

                                <div class="d-flex" style="position: absolute; right: 40px; top: 100px">
                                    <i class="fa-solid fa-magnifying-glass fa-lg me-2" style="position:relative; top: 18px"></i>
                                    <input class="form-control me-2 border border-dark" id="search-customer" name="search-customer" type="search" placeholder="Enter customer info" aria-label="Search">
                                    <button class="btn border-dark" id="search-btn" style="background-color: #fe8a80;color: #4C2B3E; font-weight: 700; font-family: 'Roboto', sans-serif;" onclick="SearchCustomerForCustomerInfo()">SEARCH</button>
                                </div>

                                <div class="container" style="padding-left: 270px">
                                    <form action="/app/customer_panel" method="POST" class="d-flex align-items-center">
                                        <div class="d-flex">
                                            <i class="fa-solid fa-sort fa-2x me-2" style="position:relative; top: 3px"></i>
                                            <div class="form-group">
                                                <select class="form-select border-dark me-5" name="sort-option" style="width: 300px" aria-label="Default select example">
                                                    <option value="" selected>-- Select Sorting Column --</option>
                                                    <option value="ID">ID</option>
                                                    <option value="name">Name</option>
                                                    <option value="created_at">Creation Time</option>
                                                    <option value="verified_at">Verification Time</option>
                                                    <option value="updated_at">Update Time</option>
                                                    <option value="account_count">Number of Accounts</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <input type="radio" class="btn-check" name="sorting-technique" value="ascending" id="ascending-btn1" autocomplete="off" checked>
                                                <label class="btn btn-outline-primary ms-3 me-2" for="ascending-btn1">Ascending</label>
                                                <input type="radio" class="btn-check" name="sorting-technique" value="descending" id="danger-outlined1" autocomplete="off">
                                                <label class="btn btn-outline-success me-5" for="danger-outlined1">Descending</label>
                                            </div>
                                            <div class="form-group">
                                                <input type="hidden" value="customer" name="sorting-panel"/>
                                            </div>
                                            <div class="form-group">
                                                <button class="btn border-dark ms-3 px-4" id="sort-btn" style="background-color: #fe8a80;color: #4C2B3E; font-weight: 700; font-family: 'Roboto', sans-serif;" type="submit">SORT</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <div class="container mx-auto px-5 my-5" >

                                    <c:if test="${requestScope.allCustomers != null}">
                                        <!-- Payment History Table -->
                                        <table id='customer-table' class="table text-center table-striped my-5">
                                            <tr style="position: sticky; top:80px; background-color: #481e40;color: white;font-family: 'Oswald', sans-serif; text-align: center;">
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">ID</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Name</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Email</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Creation Time</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Verification Time</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Update Time</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Number of Accounts</th>
                                            </tr>
                                            <!-- Loop Through Payment History Records -->
                                            <c:forEach items="${requestScope.allCustomers}" var="customer">
                                            <tr style="border-bottom: 2px solid #481e40">
                                                    <td>${customer.user_id}</td>
                                                    <td>${customer.name}</td>
                                                    <td>${customer.email}</td>
                                                    <td>${customer.created_at}</td>
                                                    <td>${customer.verified_at}</td>
                                                    <td>${customer.updated_at}</td>
                                                    <td>${customer.account_count}</td>
                                                </tr>
                                             </c:forEach>
                                            <!-- End Of Loop Through Payment History Records -->
                                        </table>
                                    </c:if>

                                    <c:if test="${requestScope.customerSorted != null}">
                                    <!-- Payment History Table -->
                                    <table id='customer-table' class="table text-center table-striped">
                                        <tr style="position: sticky; top:80px; background-color: #481e40;color: white;font-family: 'Oswald', sans-serif; text-align: center;">
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">ID
                                                <c:if test="${customerSortingColumn_technique == 'ID_asc'}"><i class="fa-solid fa-sort-up fa-lg ms-2"></i></c:if>
                                                <c:if test="${customerSortingColumn_technique == 'ID_desc'}"><i class="fa-solid fa-sort-down fa-lg ms-2" style="position:relative; bottom: 7px"></i></c:if>
                                            </th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Name
                                                <c:if test="${customerSortingColumn_technique == 'name_asc'}"><i class="fa-solid fa-sort-up fa-lg ms-2"></i></c:if>
                                                <c:if test="${customerSortingColumn_technique == 'name_desc'}"><i class="fa-solid fa-sort-down fa-lg ms-2" style="position:relative; bottom: 7px"></i></c:if>
                                            </th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Email</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Creation Time
                                                <c:if test="${customerSortingColumn_technique == 'created_at_asc'}"><i class="fa-solid fa-sort-up fa-lg ms-2"></i></c:if>
                                                <c:if test="${customerSortingColumn_technique == 'created_at_desc'}"><i class="fa-solid fa-sort-down fa-lg ms-2" style="position:relative; bottom: 7px"></i></c:if>
                                            </th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Verification Time
                                                <c:if test="${customerSortingColumn_technique == 'verified_at_asc'}"><i class="fa-solid fa-sort-up fa-lg ms-2"></i></c:if>
                                                <c:if test="${customerSortingColumn_technique == 'verified_at_desc'}"><i class="fa-solid fa-sort-down fa-lg ms-2" style="position:relative; bottom: 7px"></i></c:if>
                                            </th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Update Time
                                                <c:if test="${customerSortingColumn_technique == 'updated_at_asc'}"><i class="fa-solid fa-sort-up fa-lg ms-2"></i></c:if>
                                                <c:if test="${customerSortingColumn_technique == 'updated_at_desc'}"><i class="fa-solid fa-sort-down fa-lg ms-2" style="position:relative; bottom: 7px"></i></c:if>
                                            </th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Number of Accounts
                                                <c:if test="${customerSortingColumn_technique == 'account_count_asc'}"><i class="fa-solid fa-sort-up fa-lg ms-2"></i></c:if>
                                                <c:if test="${customerSortingColumn_technique == 'account_count_desc'}"><i class="fa-solid fa-sort-down fa-lg ms-2" style="position:relative; bottom: 7px"></i></c:if>
                                            </th>
                                        </tr>
                                        <!-- Loop Through Payment History Records -->
                                        <c:forEach items="${requestScope.customerSorted}" var="customer">
                                        <tr style="border-bottom: 2px solid #481e40">
                                                <td>${customer.user_id}</td>
                                                <td>${customer.name}</td>
                                                <td>${customer.email}</td>
                                                <td>${customer.created_at}</td>
                                                <td>${customer.verified_at}</td>
                                                <td>${customer.updated_at}</td>
                                                <td>${customer.account_count}</td>
                                            </tr>
                                         </c:forEach>
                                        <!-- End Of Loop Through Payment History Records -->
                                    </table>
                                    <!-- End Of Payment History Table -->
                                    </c:if>

                                </div>
                                <!-- End of Container -->
                        </div>

                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade ${activeTab == 'payment' ? 'show active' : ''}" id="payment-tab-pane" role="tabpanel" aria-labelledby="payment-tab" tabindex="0">


                            <div class="toast mx-auto my-3" id="toast-payment-search" role="alert" aria-live="assertive" aria-atomic="true">
                                <div class="toast-header">
                                <h5 class="me-auto text-danger"><i class="fa-solid fa-triangle-exclamation me-3"></i>Error</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                </div>
                                <div class="toast-body text-white bg-danger text-center" style="font-size: 17px" id="toast-msg-payment-search">
                                    Toast message
                                </div>
                            </div>

                            <div class="container mt-4">
                            <c:if test="${errorPayment != null}">
                                <div class="alert alert-danger text-center border border-danger">
                                    <b>${errorPayment}</b>
                                </div>
                            </c:if>
                            </div>

                                <div class="d-flex" style="position: absolute; right: 44px; top: 100px">
                                    <i class="fa-solid fa-magnifying-glass fa-lg me-2" style="position:relative; top: 18px"></i>
                                    <input class="form-control me-2 border border-dark" id="search-payment" name="search-payment" type="search" placeholder="Enter payment info" aria-label="Search">
                                    <button class="btn border-dark" id="search-btn" style="background-color: #fe8a80;color: #4C2B3E; font-weight: 700; font-family: 'Roboto', sans-serif;" onclick="SearchCustomerForPaymentInfo()">SEARCH</button>
                                </div>

                                <div class="d-flex justify-content-between my-5 mx-5">
                                    <form action="/app/customer_panel" method="POST" class="d-flex align-items-center me-5" style="margin-right: 100px">
                                        <div class="d-flex">
                                            <i class="fa-solid fa-arrows-split-up-and-left fa-2x me-2" style="position:relative; top: 3px"></i>
                                            <div class="form-group">
                                                <select class="form-select border-dark me-5" name="sort-option" style="width: 300px" aria-label="Default select example">
                                                    <option value="" selected>-- Select Grouping By Column --</option>
                                                    <option value="account_id">Account ID</option>
                                                    <option value="user_id">User ID</option>
                                                    <option value="beneficiary_bank">Beneficiary Bank</option>
                                                    <option value="status">Status</option>
                                                    <option value="reason_code">Reason Code</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <input type="hidden" value="payment_grouping" name="sorting-panel"/>
                                                <input type="hidden" value="" name="sorting-technique"/>
                                            </div>
                                            <div class="form-group">
                                                <button class="btn border-dark ms-3 px-4 me-5" id="group-btn" style="background-color: #fe8a80;color: #4C2B3E; font-weight: 700; font-family: 'Roboto', sans-serif;" type="submit">GROUP</button>
                                            </div>
                                        </div>
                                    </form>

                                    <div style="height: 100px; border-right: 2px solid black;margin-left: 90px"></div>

                                    <form action="/app/customer_panel" method="POST" class="d-flex align-items-center">
                                        <div class="d-flex">
                                            <i class="fa-solid fa-sort fa-2x me-2" style="position:relative; top: 3px"></i>
                                            <div class="form-group">
                                                <select class="form-select border-dark me-5" name="sort-option" style="width: 300px" aria-label="Default select example">
                                                    <option value="" selected>-- Select Sorting Column --</option>
                                                    <option value="payment_id">Payment ID</option>
                                                    <option value="account_id">Account ID</option>
                                                    <option value="user_id">User ID</option>
                                                    <option value="amount">Amount</option>
                                                    <option value="payment_time">Payment Time</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <input type="radio" class="btn-check" name="sorting-technique" value="ascending" id="ascending-btn2" autocomplete="off" checked>
                                                <label class="btn btn-outline-primary ms-3 me-2" for="ascending-btn2">Ascending</label>
                                                <input type="radio" class="btn-check" name="sorting-technique" value="descending" id="danger-outlined2" autocomplete="off">
                                                <label class="btn btn-outline-success me-5" for="danger-outlined2">Descending</label>
                                            </div>
                                            <div class="form-group">
                                                <input type="hidden" value="payment" name="sorting-panel"/>
                                            </div>
                                            <div class="form-group">
                                                <button class="btn border-dark ms-3 px-4" id="sort-btn" style="background-color: #fe8a80;color: #4C2B3E; font-weight: 700; font-family: 'Roboto', sans-serif;" type="submit">SORT</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <div class="mx-auto px-5 my-5" >

                                    <c:if test="${requestScope.allPayments != null}">
                                        <!-- Payment History Table -->
                                        <table id='payment-table' class="table text-center table-striped my-5">
                                            <tr style="position: sticky; top:80px; background-color: #481e40;color: white;font-family: 'Oswald', sans-serif; text-align: center;">
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white;">Payment ID</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Account ID</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">User ID</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Beneficiary</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Beneficiary Account No.</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Beneficiary Bank</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Amount</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Status</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Reference</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Reason Code</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Payment Time</th>
                                            </tr>
                                            <!-- Loop Through Payment History Records -->
                                            <c:forEach items="${requestScope.allPayments}" var="payment">
                                            <tr style="border-bottom: 2px solid #481e40">
                                                    <td>${payment.payment_id}</td>
                                                    <td>${payment.account_id}</td>
                                                    <td>${payment.user_id}</td>
                                                    <td>${payment.beneficiary}</td>
                                                    <td>${payment.beneficiary_acc_no}</td>
                                                    <td>${payment.beneficiary_bank}</td>
                                                    <td>${payment.amount}</td>
                                                    <td>${payment.status}</td>
                                                    <td>${payment.reference_no}</td>
                                                    <td>${payment.reason_code}</td>
                                                    <td>${payment.created_at}</td>
                                            </tr>
                                            </c:forEach>
                                            <!-- End Of Loop Through Payment History Records -->
                                        </table>
                                    </c:if>

                                    <c:if test="${requestScope.paymentSorted != null}">
                                    <!-- Payment History Table -->
                                    <table id='payment-table' class="table text-center table-striped">
                                        <tr style="position: sticky; top:80px; background-color: #481e40;color: white;font-family: 'Oswald', sans-serif; text-align: center;">
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Payment
                                            <span style="white-space: nowrap;">
                                                ID<c:if test="${paymentSortingColumn_technique == 'payment_id_asc'}"><i class="fa-solid fa-sort-up fa-lg ms-2"></i></c:if>
                                                <c:if test="${paymentSortingColumn_technique == 'payment_id_desc'}"><i class="fa-solid fa-sort-down fa-lg ms-2" style="position:relative; bottom: 7px"></i></c:if>
                                            </span>
                                            </th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Account
                                            <span style="white-space: nowrap;">
                                                ID<c:if test="${paymentSortingColumn_technique == 'account_id_asc'}"><i class="fa-solid fa-sort-up fa-lg ms-2"></i></c:if>
                                                <c:if test="${paymentSortingColumn_technique == 'account_id_desc'}"><i class="fa-solid fa-sort-down fa-lg ms-2" style="position:relative; bottom: 7px"></i></c:if>
                                            </span>
                                            </th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">User
                                            <span style="white-space: nowrap;">
                                                ID<c:if test="${paymentSortingColumn_technique == 'user_id_asc'}"><i class="fa-solid fa-sort-up fa-lg ms-2"></i></c:if>
                                                <c:if test="${paymentSortingColumn_technique == 'user_id_desc'}"><i class="fa-solid fa-sort-down fa-lg ms-2" style="position:relative; bottom: 7px"></i></c:if>
                                            </span>
                                            </th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Beneficiary</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Beneficiary Account No.</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Beneficiary Bank</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white; white-space: nowrap">Amount
                                                <c:if test="${paymentSortingColumn_technique == 'amount_asc'}"><i class="fa-solid fa-sort-up fa-lg ms-2"></i></c:if>
                                                <c:if test="${paymentSortingColumn_technique == 'amount_desc'}"><i class="fa-solid fa-sort-down fa-lg ms-2" style="position:relative; bottom: 7px"></i></c:if>
                                            </th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Status</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Reference</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Reason Code</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Payment Time
                                                <c:if test="${paymentSortingColumn_technique == 'payment_time_asc'}"><i class="fa-solid fa-sort-up fa-lg ms-2"></i></c:if>
                                                <c:if test="${paymentSortingColumn_technique == 'payment_time_desc'}"><i class="fa-solid fa-sort-down fa-lg ms-2" style="position:relative; bottom: 7px"></i></c:if>
                                            </th>
                                        </tr>
                                        <!-- Loop Through Payment History Records -->
                                        <c:forEach items="${requestScope.paymentSorted}" var="payment">
                                        <tr style="border-bottom: 2px solid #481e40">
                                                <td>${payment.payment_id}</td>
                                                <td>${payment.account_id}</td>
                                                <td>${payment.user_id}</td>
                                                <td>${payment.beneficiary}</td>
                                                <td>${payment.beneficiary_acc_no}</td>
                                                <td>${payment.beneficiary_bank}</td>
                                                <td>${payment.amount}</td>
                                                <td>${payment.status}</td>
                                                <td>${payment.reference_no}</td>
                                                <td>${payment.reason_code}</td>
                                                <td>${payment.created_at}</td>
                                            </tr>
                                         </c:forEach>
                                        <!-- End Of Loop Through Payment History Records -->
                                    </table>
                                    <!-- End Of Payment History Table -->
                                    </c:if>

                                    <c:if test="${requestScope.groupedPaymentObj != null}">

                                        <c:forEach items="${requestScope.groupedPaymentObj}" var="PaymentList">

                                            <c:if test="${PaymentList != null}">
                                                <c:forEach items="${PaymentList.value}" var="groupByCol">
                                                    <c:if test="${groupByCol != null}">
                                                    <table id='payment-table' class="table text-center table-striped" style="margin-bottom: 70px">
                                                        <tr style="position: sticky; top:80px; background-color: #481e40;color: white;font-family: 'Oswald', sans-serif; text-align: center;">
                                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white;">Payment ID</th>
                                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Account ID</th>
                                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">User ID</th>
                                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Beneficiary</th>
                                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Beneficiary Account No.</th>
                                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Beneficiary Bank</th>
                                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Amount</th>
                                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Status</th>
                                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Reference</th>
                                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Reason Code</th>
                                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Payment Time</th>
                                                        </tr>

                                                        <c:forEach items="${groupByCol.value}" var="payment" varStatus="loop">
                                                            <tr style="border-bottom: 2px solid #481e40">

                                                                <td>${payment.payment_id}</td>

                                                                <c:choose>
                                                                    <c:when test="${PaymentList.key == 'account_id'}">
                                                                        <c:if test="${loop.first}">
                                                                            <td style="background-color:#7e3570;color:white; vertical-align: middle;text-size:18px" rowspan="${fn:length(groupByCol.value)}">${groupByCol.key}</td>
                                                                        </c:if>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <td>${payment.account_id}</td>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                                <c:choose>
                                                                    <c:when test="${PaymentList.key == 'user_id'}">
                                                                        <c:if test="${loop.first}">
                                                                            <td style="background-color:#7e3570;color:white; vertical-align: middle;text-size:18px" rowspan="${fn:length(groupByCol.value)}">${groupByCol.key}</td>
                                                                        </c:if>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <td>${payment.user_id}</td>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                                <td>${payment.beneficiary}</td>
                                                                <td>${payment.beneficiary_acc_no}</td>

                                                                <c:choose>
                                                                    <c:when test="${PaymentList.key == 'beneficiary_bank'}">
                                                                        <c:if test="${loop.first}">
                                                                            <td style="background-color:#7e3570;color:white; vertical-align: middle;text-size:18px" rowspan="${fn:length(groupByCol.value)}">${groupByCol.key}</td>
                                                                        </c:if>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <td>${payment.beneficiary_bank}</td>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                                <td>${payment.amount}</td>

                                                                <c:choose>
                                                                    <c:when test="${PaymentList.key == 'status'}">
                                                                        <c:if test="${loop.first}">
                                                                            <td style="background-color:#7e3570;color:white; vertical-align: middle;text-size:18px" rowspan="${fn:length(groupByCol.value)}">${groupByCol.key}</td>
                                                                        </c:if>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <td>${payment.status}</td>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                                <td>${payment.reference_no}</td>

                                                                <c:choose>
                                                                    <c:when test="${PaymentList.key == 'reason_code'}">
                                                                        <c:if test="${loop.first}">
                                                                            <td style="background-color:#7e3570;color:white; vertical-align: middle;text-size:18px" rowspan="${fn:length(groupByCol.value)}">${groupByCol.key}</td>
                                                                        </c:if>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <td>${payment.reason_code}</td>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                                <td>${payment.created_at}</td>

                                                            </tr>
                                                        </c:forEach>
                                                    </table>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>

                                    </c:if>

                                </div>
                                <!-- End of Container -->
                            </div>
                        </div>


                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade" id="accounts-tab-pane" role="tabpanel" aria-labelledby="accounts-tab" tabindex="0">

                                <div class="toast mx-auto my-3" id="toast-account-search" role="alert" aria-live="assertive" aria-atomic="true">
                                    <div class="toast-header">
                                    <h5 class="me-auto text-danger"><i class="fa-solid fa-triangle-exclamation me-3"></i>Error</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                    </div>
                                    <div class="toast-body text-white bg-danger text-center" style="font-size: 17px" id="toast-msg-account-search">
                                        Toast message
                                    </div>
                                </div>

                                <div class="d-flex" style="position: absolute; right: 40px; top: 100px">
                                    <i class="fa-solid fa-magnifying-glass fa-lg me-2" style="position:relative; top: 18px"></i>
                                    <input class="form-control me-2 border border-dark" id="search-account" name="search-account" type="search" placeholder="Enter account info" aria-label="Search">
                                    <button class="btn border-dark" id="search-btn" style="background-color: #fe8a80;color: #4C2B3E; font-weight: 700; font-family: 'Roboto', sans-serif;" onclick="SearchCustomerForAccountInfo()">SEARCH</button>
                                </div>

                                <div class="container mx-auto px-5 my-5" >
                                        <c:if test="${requestScope.allAccounts != null}">
                                        <!-- Payment History Table -->
                                        <table id='account-table' class="table text-center table-striped my-5">
                                            <tr style="position: sticky; top:80px; background-color: #481e40;color: white;font-family: 'Oswald', sans-serif; text-align: center;">
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Account ID</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">User ID</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Account Number</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Account Name</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Account Type</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Balance</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Creation Time</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Update Time</th>
                                            </tr>
                                            <!-- Loop Through Payment History Records -->
                                            <c:forEach items="${requestScope.allAccounts}" var="account">
                                            <tr style="border-bottom: 2px solid #481e40">
                                                    <td>${account.account_id}</td>
                                                    <td>${account.user_id}</td>
                                                    <td>${account.account_number}</td>
                                                    <td>${account.account_name}</td>
                                                    <td>${account.account_type}</td>
                                                    <td>${account.balance}</td>
                                                    <td>${account.created_at}</td>
                                                    <td>${account.updated_at}</td>
                                                </tr>
                                             </c:forEach>
                                            <!-- End Of Loop Through Payment History Records -->

                                        </table>
                                    </c:if>
                                </div>
                                <!-- End of Container -->

                            </div>
                        </div>

                        <div class="tab-content" id="myTabContent">

                                <div class="tab-pane fade" id="department-tab-pane" role="tabpanel" aria-labelledby="department-tab"
                                tabindex="0">

                                    <!-- Container -->
                                    <div class="container mx-auto my-5">
                                        <c:if test="${requestScope.allDepartments != null}">
                                        <!-- Payment History Table -->
                                        <table id='department-table' class="table table-striped">
                                            <tr style="position: sticky; top:80px; background-color: #481e40;color: white;font-family: 'Oswald', sans-serif; text-align: center;">
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">ID</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Name</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Head</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Description</th>
                                            </tr>
                                            <!-- Loop Through Payment History Records -->
                                            <c:forEach items="${requestScope.allDepartments}" var="department">
                                            <tr style="border-bottom: 2px solid #481e40">
                                                    <td>${department.department_id}</td>
                                                    <td>${department.department_name}</td>
                                                    <td>${department.department_head}</td>
                                                    <td>${department.department_description}</td>
                                                </tr>
                                             </c:forEach>
                                            <!-- End Of Loop Through Payment History Records -->

                                        </table>
                                        <!-- End Of Payment History Table -->
                                        </c:if>
                                    </div>
                                    <!-- End of Container -->
                                </div>
                        </div>

                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade" id="branch-tab-pane" role="tabpanel" aria-labelledby="branch-tab" tabindex="0">

                                    <div class="container mx-auto my-5">
                                        <c:if test="${requestScope.allBranches != null}">
                                        <table id='branch-table' class="table table-striped">
                                            <tr style="position: sticky; top:80px; background-color: #481e40;color: white;font-family: 'Oswald', sans-serif; text-align: center;">
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">ID</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Name</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Address</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">City</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">State</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Contact</th>
                                                <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Branch Manager ID</th>
                                            </tr>
                                            <c:forEach items="${requestScope.allBranches}" var="branch">
                                            <tr style="border-bottom: 2px solid #481e40">
                                                    <td>${branch.branch_id}</td>
                                                    <td>${branch.name}</td>
                                                    <td>${branch.address}</td>
                                                    <td>${branch.city}</td>
                                                    <td>${branch.state}</td>
                                                    <td>${branch.contact}</td>
                                                    <td>${branch.manager_id}</td>
                                                </tr>
                                             </c:forEach>
                                        </table>
                                        </c:if>
                                    </div>
                            </div>
                        </div>

</body>

<script>
            function SearchCustomerForCustomerInfo() {
              let input = document.getElementById('search-customer');
              let table = document.getElementById('customer-table');
              let rows = table.getElementsByTagName('tr');
              for (let i = 0; i < rows.length; i++) {
                rows[i].classList.remove('highlight');
              }
              let name = input.value;
              let matchFound = false;
              for (let i = 0; i < rows.length; i++) {
                let cells = rows[i].getElementsByTagName('td');
                let rowMatchFound = false;
                for (let j = 0; j < cells.length; j++) {
                  let cell = cells[j];
                  if (cell.innerText.match(new RegExp('^' + name + '$', 'i'))) {
                    rowMatchFound = true;
                    break;
                  }
                }
                if (rowMatchFound) {
                  rows[i].classList.add('highlight');
                  let y = rows[i].offsetTop;
                  let scrollY = y - (window.innerHeight / 2) + (rows[i].offsetHeight / 2);
                  window.scrollTo(0, scrollY);
                  matchFound = true;
                }
              }
              if (!matchFound) {
                const toast = new bootstrap.Toast(document.getElementById('toast-customer-search'));
                document.getElementById('toast-msg-customer-search').innerHTML = 'Searched Customer Information not found';
                toast.show();
              }
            }

            function SearchCustomerForPaymentInfo() {
              let input = document.getElementById('search-payment');
              let table = document.getElementById('payment-table');
              let rows = table.getElementsByTagName('tr');
              for (let i = 0; i < rows.length; i++) {
                rows[i].classList.remove('highlight');
              }
              let name = input.value;
              let matchFound = false;
              for (let i = 0; i < rows.length; i++) {
                let cells = rows[i].getElementsByTagName('td');
                let rowMatchFound = false;
                for (let j = 0; j < cells.length; j++) {
                  let cell = cells[j];
                  if (cell.innerText.match(new RegExp('^' + name + '$', 'i'))) {
                    rowMatchFound = true;
                    break;
                  }
                }
                if (rowMatchFound) {
                  rows[i].classList.add('highlight');
                  let y = rows[i].offsetTop;
                  let scrollY = y - (window.innerHeight / 2) + (rows[i].offsetHeight / 2);
                  window.scrollTo(0, scrollY);
                  matchFound = true;
                }
              }
              if (!matchFound) {
                const toast = new bootstrap.Toast(document.getElementById('toast-payment-search'));
                document.getElementById('toast-msg-payment-search').innerHTML = 'Searched Payment Information not found';
                toast.show();
              }
            }

            function SearchCustomerForAccountInfo() {
              let input = document.getElementById('search-account');
              let table = document.getElementById('account-table');
              let rows = table.getElementsByTagName('tr');
              for (let i = 0; i < rows.length; i++) {
                rows[i].classList.remove('highlight');
              }
              let name = input.value;
              let matchFound = false;
              for (let i = 0; i < rows.length; i++) {
                let cells = rows[i].getElementsByTagName('td');
                let rowMatchFound = false;
                for (let j = 0; j < cells.length; j++) {
                  let cell = cells[j];
                  if (cell.innerText.match(new RegExp('^' + name + '$', 'i'))) {
                    rowMatchFound = true;
                    break;
                  }
                }
                if (rowMatchFound) {
                  rows[i].classList.add('highlight');
                  let y = rows[i].offsetTop;
                  let scrollY = y - (window.innerHeight / 2) + (rows[i].offsetHeight / 2);
                  window.scrollTo(0, scrollY);
                  matchFound = true;
                }
              }
              if (!matchFound) {
                const toast = new bootstrap.Toast(document.getElementById('toast-account-search'));
                document.getElementById('toast-msg-account-search').innerHTML = 'Searched Account Information not found';
                toast.show();
              }
            }
</script>

</html>