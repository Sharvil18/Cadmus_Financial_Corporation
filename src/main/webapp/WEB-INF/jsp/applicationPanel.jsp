<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://example.com/functions" prefix="f" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <title>Application Panel</title>
</head>

<body>

    <!-- Header -->
    <c:import url="components/include/admin_header.jsp"/>

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
                                <button class="nav-link active"
                                    style="--bs-nav-link-color: #4C2B3E; --bs-nav-link-font-weight: 700; font-family: 'Roboto', sans-serif;"
                                    id="home-loan-tab" data-bs-toggle="tab" data-bs-target="#home-loan-tab-pane" type="button"
                                    role="tab" aria-controls="home-loan-tab-pane" aria-selected="true">Home Loan</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link"
                                    style="--bs-nav-link-color: #4C2B3E; --bs-nav-link-font-weight: 700; font-family: 'Roboto', sans-serif;"
                                    id="personal-loan-tab" data-bs-toggle="tab" data-bs-target="#personal-loan-tab-pane" type="button"
                                    role="tab" aria-controls="personal-loan-tab-pane" aria-selected="false">Personal Loan</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link"
                                    style="--bs-nav-link-color: #4C2B3E; --bs-nav-link-font-weight: 700; font-family: 'Roboto', sans-serif;"
                                    id="gold-loan-tab" data-bs-toggle="tab" data-bs-target="#gold-loan-tab-pane" type="button"
                                    role="tab" aria-controls="gold-loan-tab-pane" aria-selected="false">Gold Loan</button>
                            </li>
                        </ul>





<fmt:setLocale value="en_IN" />


                            <div class="tab-content" id="myTabContent">

                                <div class="tab-pane fade show active" id="home-loan-tab-pane" role="tabpanel" aria-labelledby="home-loan-tab"
                                tabindex="0">

                                    <div class="container my-4">
                                        <h2 class="me-auto" style="font-family: 'Oswald', sans-serif;font-size: 45px; color: #4C2B3E"><i class="fa-solid fa-house fa-1x me-3 "></i>Home Loan Applications</h2>
                                    </div>

                                    <!--Accordian menu container-->
                                    <div class="container my-4">
                                        <!--Accordian menu-->
                                        <c:if test="${requestScope.allHomeLoanApplications != null }">
                                            <c:forEach items="${requestScope.allHomeLoanApplications}" var="application">
                                                <div class="accordion accordion-flush" id="accordionFlushExample">
                                                    <div class="accordion-item">
                                                        <h2 class="accordion-header d-flex" id="flush-headingOne">
                                                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-${application.application_number}" aria-expanded="false" aria-controls="flush-collapseOne" style="font-size: 19px;font-family: 'Trirong', serif;">
                                                              ${fn:toUpperCase(application.first_name)} ${fn:toUpperCase(application.last_name)}
                                                            </button>
                                                        </h2>
                                                        <div id="flush-${application.application_number}" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                                            <div class="accordion-body">

                                                                <c:choose>
                                                                    <c:when test="${application.approved == 'no'}">
                                                                        <div class="container my-5 p-4 alert-warning border-warning border rounded" style="font-size:25px;">
                                                                            <form action="" class="d-flex">
                                                                                <div class="form-group mb-3">
                                                                                    <label for="">Loan Amount</label>
                                                                                    <div class="input-group">
                                                                                        <span class="input-group-text"><i class="fa-solid fa-indian-rupee-sign me-1"></i></span>
                                                                                        <input type="text" class="form-control" name="loan_amount" />
                                                                                        <span class="input-group-text">.00</span>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group ms-auto mb-3">
                                                                                    <label for="">Interest Rate</label>
                                                                                    <div class="input-group">
                                                                                        <span class="input-group-text"><i class="fa-solid fa-percent me-1"></i></span>
                                                                                        <input type="text" class="form-control" name="loan_amount" />
                                                                                        <span class="input-group-text">p.a.</span>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group ms-auto mb-3">
                                                                                    <label for="">Tenure</label>
                                                                                    <div class="input-group">
                                                                                        <span class="input-group-text"><i class="fa-solid fa-hourglass-start me-1"></i></span>
                                                                                        <input type="text" class="form-control" name="tenure" />
                                                                                        <span class="input-group-text">years</span>
                                                                                    </div>
                                                                                </div>
                                                                                <button type="button" class="btn btn-outline-success ms-auto px-4 my-auto" style="height: 50px;font-weight: bold;" type="submit"><i class="fa-regular fa-circle-check fa-lg me-2"></i>Approve</button>
                                                                            </form>
                                                                        </div>
                                                                    </c:when>

                                                                    <c:otherwise>
                                                                        <div class="container text-center my-5 p-2 alert-success border-success border rounded" style="font-size:25px;font-weight: bold">
                                                                            This loan has been approved
                                                                        </div>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                                <div class="container mt-5 p-3 border border-dark rounded" style="width: 70%">
                                                                    <h3 class="text-center" style="font-family: 'Eczar', serif;">Property Information</h3>
                                                                    <ul class="list-group list-group-flush">
                                                                        <li class="list-group-item d-flex">Property Purchase Price <span class="ms-auto"><b><i class="fa-solid fa-indian-rupee-sign me-1"></i><fmt:formatNumber value="${application.purchase_price}" /></b></span></li>
                                                                        <li class="list-group-item d-flex">Loan Amount Requested <span class="ms-auto"><b><i class="fa-solid fa-indian-rupee-sign me-1"></i><fmt:formatNumber value="${application.loan_amount_requested}" /></b></span></li>
                                                                        <li class="list-group-item d-flex">Down Payment Amount <span class="ms-auto"><b><i class="fa-solid fa-indian-rupee-sign me-1"></i><fmt:formatNumber value="${application.down_payment_amount}" /></b></span></li>
                                                                        <li class="list-group-item d-flex">Current House Status <span class="ms-auto"><b>${application.current_home}</b></span></li>
                                                                        <li class="list-group-item d-flex">Current House Sell Status <span class="ms-auto"><b>${application.sell_current}</b></span></li>
                                                                        <li class="list-group-item d-flex">Reason of Purchase <span class="ms-auto"><b>${application.motto_purchase}</b></span></li>
                                                                    </ul>
                                                                </div>

                                                                <div class="container my-5 p-3 border border-dark rounded" style="width: 70%">
                                                                    <h3 class="text-center" style="font-family: 'Eczar', serif;">Personal Information</h3>
                                                                    <ul class="list-group list-group-flush">
                                                                        <li class="list-group-item d-flex">Application Number <span class="ms-auto"><b>${application.application_number}</b></span></li>
                                                                        <li class="list-group-item d-flex">User ID <span class="ms-auto"><b>${application.user_id}</b></span></li>
                                                                        <li class="list-group-item d-flex">Account ID <span class="ms-auto"><b>${application.account}</b></span></li>
                                                                        <li class="list-group-item d-flex">Email <span class="ms-auto"><b>${application.email}</b></span></li>
                                                                        <li class="list-group-item d-flex">Contact <span class="ms-auto"><b>${application.contact}</b></span></li>
                                                                        <li class="list-group-item d-flex">Age <span class="ms-auto"><b>${application.age}</b></span></li>
                                                                        <li class="list-group-item d-flex">Religion <span class="ms-auto"><b>${application.religion}</b></span></li>
                                                                        <li class="list-group-item d-flex">Birth Date <span class="ms-auto"><b>${application.birth_date}</b></span></li>
                                                                        <li class="list-group-item d-flex">Marital Status <span class="ms-auto"><b>${application.marital_status}</b></span></li>
                                                                    </ul>
                                                                </div>

                                                                <div class="container mt-5 p-3 border border-dark rounded" style="width: 70%">
                                                                    <h3 class="text-center" style="font-family: 'Eczar', serif;">Address</h3>
                                                                    <ul class="list-group list-group-flush">
                                                                        <li class="list-group-item d-flex">House <span class="ms-auto"><b>${application.address_house}</b></span></li>
                                                                        <li class="list-group-item d-flex">Complex <span class="ms-auto"><b>${application.address_complex}</b></span></li>
                                                                        <li class="list-group-item d-flex">Street Address Line 1 <span class="ms-auto"><b>${application.address_street_line1}</b></span></li>
                                                                        <li class="list-group-item d-flex">Street Address LIne 2 <span class="ms-auto"><b>${application.address_street_line2}</b></span></li>
                                                                        <li class="list-group-item d-flex">City <span class="ms-auto"><b>${application.address_city}</b></span></li>
                                                                        <li class="list-group-item d-flex">State <span class="ms-auto"><b>${application.address_state}</b></span></li>
                                                                        <li class="list-group-item d-flex">Postal Code <span class="ms-auto"><b>${application.address_postal_code}</b></span></li>
                                                                    </ul>
                                                                </div>

                                                                <div class="container mt-5 p-3 border border-dark rounded" style="width: 70%">
                                                                    <h3 class="text-center" style="font-family: 'Eczar', serif;">Job Information</h3>
                                                                    <ul class="list-group list-group-flush">
                                                                        <li class="list-group-item d-flex">Company Name <span class="ms-auto"><b>${application.company_name}</b></span></li>
                                                                        <li class="list-group-item d-flex">Job Title <span class="ms-auto"><b>${application.job_title}</b></span></li>
                                                                        <li class="list-group-item d-flex">Employment Status <span class="ms-auto"><b>${application.employment_status}</b></span></li>
                                                                        <li class="list-group-item d-flex">Period of Employment (in Years) <span class="ms-auto"><b>${application.employment_period}</b></span></li>
                                                                        <li class="list-group-item d-flex">Department <span class="ms-auto"><b>${application.department}</b></span></li>
                                                                        <li class="list-group-item d-flex">Annual Salary <span class="ms-auto"><b><i class="fa-solid fa-indian-rupee-sign me-1"></i><fmt:formatNumber value="${application.salary}" /></b></span></li>
                                                                        <li class="list-group-item d-flex">Industry <span class="ms-auto"><b>${application.industry}</b></span></li>
                                                                    </ul>
                                                                </div>

                                                                <div class="container mt-5 p-3 border border-dark rounded" style="width: 70%">
                                                                    <h3 class="text-center" style="font-family: 'Eczar', serif;">Financial Information</h3>
                                                                    <ul class="list-group list-group-flush">
                                                                        <li class="list-group-item d-flex">Monthly Income <span class="ms-auto"><b><i class="fa-solid fa-indian-rupee-sign me-1"></i><fmt:formatNumber value="${application.income}" /></b></span></li>
                                                                        <li class="list-group-item d-flex">Investment Amount <span class="ms-auto"><b><i class="fa-solid fa-indian-rupee-sign me-1"></i><fmt:formatNumber value="${application.investment}" /></b></span></li>
                                                                        <li class="list-group-item d-flex">Credit Card Debt <span class="ms-auto"><b><i class="fa-solid fa-indian-rupee-sign me-1"></i><fmt:formatNumber value="${application.credit_card_debt}" /></b></span></li>
                                                                        <li class="list-group-item d-flex">Account <span class="ms-auto"><b>${application.account}</b></span></li>
                                                                    </ul>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                        <!--End of Accordian menu-->
                                    </div>
                                    <!--End of Accordian menu container-->
                                </div>
                            </div>


                            <div class="tab-content" id="myTabContent">

                                <div class="tab-pane fade" id="personal-loan-tab-pane" role="tabpanel" aria-labelledby="personal-loan-tab"
                                tabindex="0">

                                    <div class="container my-4">
                                        <h2 class="me-auto" style="font-family: 'Oswald', sans-serif;font-size: 45px; color: #4C2B3E"><i class="fa-solid fa-sack-dollar fa-1x me-3 "></i>Personal Loan Applications</h2>
                                    </div>

                                    <!--Accordian menu container-->
                                    <div class="container my-4">
                                        <!--Accordian menu-->
                                        <c:if test="${requestScope.allPersonalLoanApplications != null }">
                                            <c:forEach items="${requestScope.allPersonalLoanApplications}" var="application">
                                                <div class="accordion accordion-flush" id="accordionFlushExample">
                                                    <div class="accordion-item">
                                                        <h2 class="accordion-header d-flex" id="flush-headingOne">
                                                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-${application.application_number}" aria-expanded="false" aria-controls="flush-collapseOne" style="font-size: 19px;font-family: 'Trirong', serif;">
                                                              ${fn:toUpperCase(application.first_name)} ${fn:toUpperCase(application.last_name)}
                                                            </button>
                                                        </h2>
                                                        <div id="flush-${application.application_number}" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                                            <div class="accordion-body">

                                                                <c:choose>
                                                                    <c:when test="${application.approved == 'no'}">
                                                                        <div class="container my-5 p-4 alert-warning border-warning border rounded" style="font-size:25px;">
                                                                            <form action="" class="d-flex">
                                                                                <div class="form-group mb-3">
                                                                                    <label for="">Loan Amount</label>
                                                                                    <div class="input-group">
                                                                                        <span class="input-group-text"><i class="fa-solid fa-indian-rupee-sign me-1"></i></span>
                                                                                        <input type="text" class="form-control" name="loan_amount" />
                                                                                        <span class="input-group-text">.00</span>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group ms-auto mb-3">
                                                                                    <label for="">Interest Rate</label>
                                                                                    <div class="input-group">
                                                                                        <span class="input-group-text"><i class="fa-solid fa-percent me-1"></i></span>
                                                                                        <input type="text" class="form-control" name="loan_amount" />
                                                                                        <span class="input-group-text">p.a.</span>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group ms-auto mb-3">
                                                                                    <label for="">Tenure</label>
                                                                                    <div class="input-group">
                                                                                        <span class="input-group-text"><i class="fa-solid fa-hourglass-start me-1"></i></span>
                                                                                        <input type="text" class="form-control" name="tenure" />
                                                                                        <span class="input-group-text">months</span>
                                                                                    </div>
                                                                                </div>
                                                                                <button type="button" class="btn btn-outline-success ms-auto px-4 my-auto" style="height: 50px;font-weight: bold;" type="submit"><i class="fa-regular fa-circle-check fa-lg me-2"></i>Approve</button>
                                                                            </form>
                                                                        </div>
                                                                    </c:when>

                                                                    <c:otherwise>
                                                                        <div class="container text-center my-5 p-2 alert-success border-success border rounded" style="font-size:25px;font-weight: bold">
                                                                            This loan has been approved
                                                                        </div>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                                <div class="container mt-5 p-3 border border-dark rounded" style="width: 70%">
                                                                    <h3 class="text-center" style="font-family: 'Eczar', serif;">Loan Information</h3>
                                                                    <ul class="list-group list-group-flush">
                                                                        <li class="list-group-item d-flex">Loan Amount Requested <span class="ms-auto"><b><i class="fa-solid fa-indian-rupee-sign me-1"></i><fmt:formatNumber value="${application.loan_amount_requested}" /></b></span></li>
                                                                        <li class="list-group-item d-flex">Purpose of Loan <span class="ms-auto"><b>${application.loan_purpose}</b></span></li>
                                                                        <li class="list-group-item d-flex">Loan Term (in Months) <span class="ms-auto"><b>${application.loan_term}</b></span></li>
                                                                    </ul>
                                                                </div>

                                                                <div class="container my-5 p-3 border border-dark rounded" style="width: 70%">
                                                                    <h3 class="text-center" style="font-family: 'Eczar', serif;">Personal Information</h3>
                                                                    <ul class="list-group list-group-flush">
                                                                        <li class="list-group-item d-flex">Application Number <span class="ms-auto"><b>${application.application_number}</b></span></li>
                                                                        <li class="list-group-item d-flex">User ID <span class="ms-auto"><b>${application.user_id}</b></span></li>
                                                                        <li class="list-group-item d-flex">Account ID <span class="ms-auto"><b>${application.account}</b></span></li>
                                                                        <li class="list-group-item d-flex">Email <span class="ms-auto"><b>${application.email}</b></span></li>
                                                                        <li class="list-group-item d-flex">Contact <span class="ms-auto"><b>${application.contact}</b></span></li>
                                                                        <li class="list-group-item d-flex">Age <span class="ms-auto"><b>${application.age}</b></span></li>
                                                                        <li class="list-group-item d-flex">Religion <span class="ms-auto"><b>${application.religion}</b></span></li>
                                                                        <li class="list-group-item d-flex">Birth Date <span class="ms-auto"><b>${application.birth_date}</b></span></li>
                                                                        <li class="list-group-item d-flex">Marital Status <span class="ms-auto"><b>${application.marital_status}</b></span></li>
                                                                    </ul>
                                                                </div>

                                                                <div class="container mt-5 p-3 border border-dark rounded" style="width: 70%">
                                                                    <h3 class="text-center" style="font-family: 'Eczar', serif;">Address</h3>
                                                                    <ul class="list-group list-group-flush">
                                                                        <li class="list-group-item d-flex">House <span class="ms-auto"><b>${application.address_house}</b></span></li>
                                                                        <li class="list-group-item d-flex">Complex <span class="ms-auto"><b>${application.address_complex}</b></span></li>
                                                                        <li class="list-group-item d-flex">Street Address Line 1 <span class="ms-auto"><b>${application.address_street_line1}</b></span></li>
                                                                        <li class="list-group-item d-flex">Street Address LIne 2 <span class="ms-auto"><b>${application.address_street_line2}</b></span></li>
                                                                        <li class="list-group-item d-flex">City <span class="ms-auto"><b>${application.address_city}</b></span></li>
                                                                        <li class="list-group-item d-flex">State <span class="ms-auto"><b>${application.address_state}</b></span></li>
                                                                        <li class="list-group-item d-flex">Postal Code <span class="ms-auto"><b>${application.address_postal_code}</b></span></li>
                                                                    </ul>
                                                                </div>

                                                                <div class="container mt-5 p-3 border border-dark rounded" style="width: 70%">
                                                                    <h3 class="text-center" style="font-family: 'Eczar', serif;">Job Information</h3>
                                                                    <ul class="list-group list-group-flush">
                                                                        <li class="list-group-item d-flex">Company Name <span class="ms-auto"><b>${application.company_name}</b></span></li>
                                                                        <li class="list-group-item d-flex">Job Title <span class="ms-auto"><b>${application.job_title}</b></span></li>
                                                                        <li class="list-group-item d-flex">Employment Status <span class="ms-auto"><b>${application.employment_status}</b></span></li>
                                                                        <li class="list-group-item d-flex">Period of Employment (in Years) <span class="ms-auto"><b>${application.employment_period}</b></span></li>
                                                                        <li class="list-group-item d-flex">Department <span class="ms-auto"><b>${application.department}</b></span></li>
                                                                        <li class="list-group-item d-flex">Annual Salary <span class="ms-auto"><b><i class="fa-solid fa-indian-rupee-sign me-1"></i><fmt:formatNumber value="${application.salary}" /></b></span></li>
                                                                        <li class="list-group-item d-flex">Industry <span class="ms-auto"><b>${application.industry}</b></span></li>
                                                                    </ul>
                                                                </div>

                                                                <div class="container mt-5 p-3 border border-dark rounded" style="width: 70%">
                                                                    <h3 class="text-center" style="font-family: 'Eczar', serif;">Financial Information</h3>
                                                                    <ul class="list-group list-group-flush">
                                                                        <li class="list-group-item d-flex">Monthly Income <span class="ms-auto"><b><i class="fa-solid fa-indian-rupee-sign me-1"></i><fmt:formatNumber value="${application.income}" /></b></span></li>
                                                                        <li class="list-group-item d-flex">Investment Amount <span class="ms-auto"><b><i class="fa-solid fa-indian-rupee-sign me-1"></i><fmt:formatNumber value="${application.investment}" /></b></span></li>
                                                                        <li class="list-group-item d-flex">Credit Card Debt <span class="ms-auto"><b><i class="fa-solid fa-indian-rupee-sign me-1"></i><fmt:formatNumber value="${application.credit_card_debt}" /></b></span></li>
                                                                        <li class="list-group-item d-flex">Account <span class="ms-auto"><b>${application.account}</b></span></li>
                                                                    </ul>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                        <!--End of Accordian menu-->
                                    </div>
                                    <!--End of Accordian menu container-->
                                </div>
                            </div>

                            <div class="tab-content" id="myTabContent">

                                <div class="tab-pane fade" id="gold-loan-tab-pane" role="tabpanel" aria-labelledby="gold-loan-tab"
                                tabindex="0">

                                    <div class="container my-4">
                                        <h2 class="me-auto" style="font-family: 'Oswald', sans-serif;font-size: 45px; color: #4C2B3E"><i class="fa-solid fa-hand-holding-dollar fa-1x me-3"></i>Gold Loan Applications</h2>
                                    </div>

                                    <!--Accordian menu container-->
                                    <div class="container my-4">
                                        <!--Accordian menu-->
                                        <c:if test="${requestScope.allGoldLoanApplications != null }">
                                            <c:forEach items="${requestScope.allGoldLoanApplications}" var="application">
                                                <div class="accordion accordion-flush" id="accordionFlushExample">
                                                    <div class="accordion-item">
                                                        <h2 class="accordion-header d-flex" id="flush-headingOne">
                                                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-${application.application_number}" aria-expanded="false" aria-controls="flush-collapseOne" style="font-size: 19px;font-family: 'Trirong', serif;">
                                                              ${fn:toUpperCase(application.first_name)} ${fn:toUpperCase(application.last_name)}
                                                            </button>
                                                        </h2>
                                                        <div id="flush-${application.application_number}" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                                            <div class="accordion-body">


                                                                <c:choose>
                                                                    <c:when test="${application.approved == 'no'}">
                                                                        <div class="container my-5 p-4 alert-warning border-warning border rounded" style="font-size:25px;">
                                                                            <form action="" class="d-flex">
                                                                                <div class="form-group mb-3">
                                                                                    <label for="">Gold Weight</label>
                                                                                    <div class="input-group">
                                                                                        <span class="input-group-text"><i class="fa-solid fa-coins me-1"></i></span>
                                                                                        <input type="text" class="form-control" name="gold_weight" />
                                                                                        <span class="input-group-text">grams</span>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group ms-auto mb-3">
                                                                                    <label for="">Interest Rate</label>
                                                                                    <div class="input-group">
                                                                                        <span class="input-group-text"><i class="fa-solid fa-percent me-1"></i></span>
                                                                                        <input type="text" class="form-control" name="loan_amount" />
                                                                                        <span class="input-group-text">p.a.</span>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group ms-auto mb-3">
                                                                                    <label for="">Gold Rate</label>
                                                                                    <div class="input-group">
                                                                                        <span class="input-group-text"><i class="fa-solid fa-arrow-trend-up"></i></span>
                                                                                        <input type="text" class="form-control" name="gold_rate" />
                                                                                        <span class="input-group-text">per gram</span>
                                                                                    </div>
                                                                                </div>
                                                                                <button type="button" class="btn btn-outline-success ms-auto px-4 my-auto" style="height: 50px;font-weight: bold;" type="submit"><i class="fa-regular fa-circle-check fa-lg me-2"></i>Approve</button>
                                                                            </form>
                                                                        </div>
                                                                    </c:when>

                                                                    <c:otherwise>
                                                                        <div class="container text-center my-5 p-2 alert-success border-success border rounded" style="font-size:25px;font-weight: bold">
                                                                            This loan has been approved
                                                                        </div>
                                                                    </c:otherwise>
                                                                </c:choose>



                                                                <div class="container mt-5 p-3 border border-dark rounded" style="width: 70%">
                                                                    <h3 class="text-center" style="font-family: 'Eczar', serif;">Gold Information</h3>
                                                                    <ul class="list-group list-group-flush">
                                                                        <li class="list-group-item d-flex">Purpose of Loan <span class="ms-auto"><b>${application.loan_purpose}</b></span></li>
                                                                        <li class="list-group-item d-flex">Gold Weight <span class="ms-auto"><b>${application.gold_weight}</b></span></li>
                                                                        <li class="list-group-item d-flex">Gold Ornament <span class="ms-auto"><b>${application.gold_ornament}</b></span></li>
                                                                        <li class="list-group-item d-flex">Total Gold Ornament Count <span class="ms-auto"><b>${application.gold_ornament_count}</b></span></li>
                                                                    </ul>
                                                                </div>

                                                                <div class="container my-5 p-3 border border-dark rounded" style="width: 70%">
                                                                    <h3 class="text-center" style="font-family: 'Eczar', serif;">Personal Information</h3>
                                                                    <ul class="list-group list-group-flush">
                                                                        <li class="list-group-item d-flex">Application Number <span class="ms-auto"><b>${application.application_number}</b></span></li>
                                                                        <li class="list-group-item d-flex">User ID <span class="ms-auto"><b>${application.user_id}</b></span></li>
                                                                        <li class="list-group-item d-flex">Account ID <span class="ms-auto"><b>${application.account}</b></span></li>
                                                                        <li class="list-group-item d-flex">Email <span class="ms-auto"><b>${application.email}</b></span></li>
                                                                        <li class="list-group-item d-flex">Contact <span class="ms-auto"><b>${application.contact}</b></span></li>
                                                                        <li class="list-group-item d-flex">Age <span class="ms-auto"><b>${application.age}</b></span></li>
                                                                        <li class="list-group-item d-flex">Religion <span class="ms-auto"><b>${application.religion}</b></span></li>
                                                                        <li class="list-group-item d-flex">Birth Date <span class="ms-auto"><b>${application.birth_date}</b></span></li>
                                                                        <li class="list-group-item d-flex">Marital Status <span class="ms-auto"><b>${application.marital_status}</b></span></li>
                                                                    </ul>
                                                                </div>

                                                                <div class="container mt-5 p-3 border border-dark rounded" style="width: 70%">
                                                                    <h3 class="text-center" style="font-family: 'Eczar', serif;">Address</h3>
                                                                    <ul class="list-group list-group-flush">
                                                                        <li class="list-group-item d-flex">House <span class="ms-auto"><b>${application.address_house}</b></span></li>
                                                                        <li class="list-group-item d-flex">Complex <span class="ms-auto"><b>${application.address_complex}</b></span></li>
                                                                        <li class="list-group-item d-flex">Street Address Line 1 <span class="ms-auto"><b>${application.address_street_line1}</b></span></li>
                                                                        <li class="list-group-item d-flex">Street Address LIne 2 <span class="ms-auto"><b>${application.address_street_line2}</b></span></li>
                                                                        <li class="list-group-item d-flex">City <span class="ms-auto"><b>${application.address_city}</b></span></li>
                                                                        <li class="list-group-item d-flex">State <span class="ms-auto"><b>${application.address_state}</b></span></li>
                                                                        <li class="list-group-item d-flex">Postal Code <span class="ms-auto"><b>${application.address_postal_code}</b></span></li>
                                                                    </ul>
                                                                </div>

                                                                <div class="container mt-5 p-3 border border-dark rounded" style="width: 70%">
                                                                    <h3 class="text-center" style="font-family: 'Eczar', serif;">Job Information</h3>
                                                                    <ul class="list-group list-group-flush">
                                                                        <li class="list-group-item d-flex">Company Name <span class="ms-auto"><b>${application.company_name}</b></span></li>
                                                                        <li class="list-group-item d-flex">Job Title <span class="ms-auto"><b>${application.job_title}</b></span></li>
                                                                        <li class="list-group-item d-flex">Employment Status <span class="ms-auto"><b>${application.employment_status}</b></span></li>
                                                                        <li class="list-group-item d-flex">Period of Employment (in Years) <span class="ms-auto"><b>${application.employment_period}</b></span></li>
                                                                        <li class="list-group-item d-flex">Department <span class="ms-auto"><b>${application.department}</b></span></li>
                                                                        <li class="list-group-item d-flex">Annual Salary <span class="ms-auto"><b><i class="fa-solid fa-indian-rupee-sign me-1"></i><fmt:formatNumber value="${application.salary}" /></b></span></li>
                                                                        <li class="list-group-item d-flex">Industry <span class="ms-auto"><b>${application.industry}</b></span></li>
                                                                    </ul>
                                                                </div>

                                                                <div class="container mt-5 p-3 border border-dark rounded" style="width: 70%">
                                                                    <h3 class="text-center" style="font-family: 'Eczar', serif;">Financial Information</h3>
                                                                    <ul class="list-group list-group-flush">
                                                                        <li class="list-group-item d-flex">Monthly Income <span class="ms-auto"><b><i class="fa-solid fa-indian-rupee-sign me-1"></i><fmt:formatNumber value="${application.income}" /></b></span></li>
                                                                        <li class="list-group-item d-flex">Investment Amount <span class="ms-auto"><b><i class="fa-solid fa-indian-rupee-sign me-1"></i><fmt:formatNumber value="${application.investment}" /></b></span></li>
                                                                        <li class="list-group-item d-flex">Credit Card Debt <span class="ms-auto"><b><i class="fa-solid fa-indian-rupee-sign me-1"></i><fmt:formatNumber value="${application.credit_card_debt}" /></b></span></li>
                                                                        <li class="list-group-item d-flex">Account <span class="ms-auto"><b>${application.account}</b></span></li>
                                                                    </ul>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                        <!--End of Accordian menu-->
                                    </div>
                                    <!--End of Accordian menu container-->
                                </div>
                            </div>


</body>

</html>