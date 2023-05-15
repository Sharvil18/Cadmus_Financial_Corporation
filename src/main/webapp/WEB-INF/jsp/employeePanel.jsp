<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

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
    <title>Employee Panel</title>
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
                                <button class="nav-link active"
                                    style="--bs-nav-link-color: #4C2B3E; --bs-nav-link-font-weight: 700; font-family: 'Roboto', sans-serif;"
                                    id="all-record-tab" data-bs-toggle="tab" data-bs-target="#all-record-tab-pane" type="button"
                                    role="tab" aria-controls="all-record-tab-pane" aria-selected="true">All Records</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link"
                                    style="--bs-nav-link-color: #4C2B3E; --bs-nav-link-font-weight: 700; font-family: 'Roboto', sans-serif;"
                                    id="personal-info-tab" data-bs-toggle="tab" data-bs-target="#personal-info-tab-pane" type="button"
                                    role="tab" aria-controls="personal-info-tab-pane" aria-selected="false">Personal</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link"
                                    style="--bs-nav-link-color: #4C2B3E; --bs-nav-link-font-weight: 700; font-family: 'Roboto', sans-serif;"
                                    id="work-info-tab" data-bs-toggle="tab" data-bs-target="#work-info-tab-pane" type="button"
                                    role="tab" aria-controls="work-info-tab-pane" aria-selected="false">Work Representation</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link"
                                    style="--bs-nav-link-color: #4C2B3E; --bs-nav-link-font-weight: 700;  font-family: 'Roboto', sans-serif;"
                                    id="department-tab" data-bs-toggle="tab" data-bs-target="#department-tab-pane"
                                    type="button" role="tab" aria-controls="department-tab-pane" aria-selected="false">Departments</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link"
                                    style="--bs-nav-link-color: #4C2B3E; --bs-nav-link-font-weight: 700;  font-family: 'Roboto', sans-serif;"
                                    id="branch-tab" data-bs-toggle="tab" data-bs-target="#branch-tab-pane"
                                    type="button" role="tab" aria-controls="branch-tab-pane" aria-selected="false">Branches</button>
                            </li>
                        </ul>


                        <div class="tab-content" id="myTabContent">


                                <div class="tab-pane fade show active" id="all-record-tab-pane" role="tabpanel" aria-labelledby="all-record-tab"
                                tabindex="0">



                                    <c:if test="${requestScope.allEmployees != null}">
                                    <!-- Payment History Table -->
                                    <table id='all-record-table' class="table text-center table-striped my-5">
                                        <tr style="position: sticky; top:80px; background-color: #481e40;color: white;font-family: 'Oswald', sans-serif; text-align: center;">
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">ID</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Name</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Email</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Contact</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Address</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">City</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">State</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Postal Code</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Hire Date</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Age</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Gender</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Marital Status</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Education Level</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Primary Language</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Subsidiary Language</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Employee Type</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Employee Status</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Job Title</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Salary</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Department ID</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Branch ID</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Manager ID</th>
                                        </tr>
                                        <!-- Loop Through Payment History Records -->
                                        <c:forEach items="${requestScope.allEmployees}" var="employee">
                                        <tr style="border-bottom: 2px solid #481e40">
                                                <td>${employee.employee_id}</td>
                                                <td>${employee.first_name} ${employee.last_name}</td>
                                                <td>${employee.email}</td>
                                                <td>${employee.contact}</td>
                                                <td>${employee.address}</td>
                                                <td>${employee.city}</td>
                                                <td>${employee.state}</td>
                                                <td>${employee.postal_code}</td>
                                                <td>${employee.hire_date}</td>
                                                <td>${employee.age}</td>
                                                <td>${employee.gender}</td>
                                                <td>${employee.marital_status}</td>
                                                <td>${employee.education_level}</td>
                                                <td>${employee.primary_language}</td>
                                                <td>${employee.subsidiary_language}</td>
                                                <td>${employee.employee_type}</td>
                                                <td>${employee.employee_status}</td>
                                                <td>${employee.job_title}</td>
                                                <td>${employee.salary}</td>
                                                <td>${employee.department_id}</td>
                                                <td>${employee.branch_id}</td>
                                                <c:choose>
                                                    <c:when test="${employee.manager_id == null}">
                                                        <td> - </td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>${employee.manager_id}</td>
                                                    </c:otherwise>
                                                </c:choose>
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
                            <div class="tab-pane fade" id="personal-info-tab-pane" role="tabpanel" aria-labelledby="personal-info-tab" tabindex="0">


                            <div class="toast mx-auto my-3" id="toast-personal-search" role="alert" aria-live="assertive" aria-atomic="true">
                                <div class="toast-header">
                                <h5 class="me-auto text-danger"><i class="fa-solid fa-triangle-exclamation me-3"></i>Error</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                </div>
                                <div class="toast-body text-white bg-danger text-center" style="font-size: 17px" id="toast-msg-personal-search">
                                    Toast message
                                </div>
                            </div>

                            <div class="container mt-4">
                            <c:if test="${error != null}">
                                <div class="alert alert-danger text-center border border-danger">
                                    <b>${error}</b>
                                </div>
                            </c:if>
                            </div>

                                <div class="d-flex" style="position: absolute; right: 44px; top: 100px">
                                    <i class="fa-solid fa-magnifying-glass fa-lg me-2" style="position:relative; top: 18px"></i>
                                    <input class="form-control me-2 border border-dark" id="search-personal" name="search-name" type="search" placeholder="Enter personal info" aria-label="Search">
                                    <button class="btn border-dark" id="search-btn" style="background-color: #fe8a80;color: #4C2B3E; font-weight: 700; font-family: 'Roboto', sans-serif;" onclick="SearchEmployeeForPersonalInfo()">SEARCH</button>
                                </div>

                                <div class="d-flex justify-content-between my-5 mx-5">
                                    <form action="/app/group_personal" method="POST" class="d-flex align-items-center me-5" style="margin-right: 100px">
                                        <div class="d-flex">
                                            <i class="fa-solid fa-arrows-split-up-and-left fa-2x me-2" style="position:relative; top: 3px"></i>
                                            <div class="form-group">
                                                <select class="form-select border-dark me-5" name="group-option" style="width: 300px" aria-label="Default select example">
                                                    <option value="" selected>-- Select Grouping By Column --</option>
                                                    <option value="city">City</option>
                                                    <option value="state">State</option>
                                                    <option value="age">Age</option>
                                                    <option value="gender">Gender</option>
                                                    <option value="marital_status">Marital Status</option>
                                                    <option value="education_level">Education Level</option>
                                                    <option value="subsidiary_language">Subsidiary Language</option>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <button class="btn border-dark ms-3 px-4 me-5" id="group-btn" style="background-color: #fe8a80;color: #4C2B3E; font-weight: 700; font-family: 'Roboto', sans-serif;" type="submit">GROUP</button>
                                            </div>
                                        </div>
                                    </form>

                                    <div style="height: 100px; border-right: 2px solid black;margin-left: 90px"></div>

                                    <form action="/app/sort_personal" method="POST" class="d-flex align-items-center">
                                        <div class="d-flex">
                                            <i class="fa-solid fa-sort fa-2x me-2" style="position:relative; top: 3px"></i>
                                            <div class="form-group">
                                                <select class="form-select border-dark me-5" name="sort-option" style="width: 300px" aria-label="Default select example">
                                                    <option value="" selected>-- Select Sorting Column --</option>
                                                    <option value="ID">ID</option>
                                                    <option value="name">Name</option>
                                                    <option value="age">Age</option>
                                                    <option value="city">City</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <input type="radio" class="btn-check" name="sorting-technique" value="ascending" id="ascending-btn2" autocomplete="off" checked>
                                                <label class="btn btn-outline-primary ms-3 me-2" for="ascending-btn2">Ascending</label>
                                                <input type="radio" class="btn-check" name="sorting-technique" value="descending" id="danger-outlined2" autocomplete="off">
                                                <label class="btn btn-outline-success me-5" for="danger-outlined2">Descending</label>
                                            </div>
                                            <div class="form-group">
                                                <button class="btn border-dark ms-3 px-4" id="sort-btn" style="background-color: #fe8a80;color: #4C2B3E; font-weight: 700; font-family: 'Roboto', sans-serif;" type="submit">SORT</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <!-- Container -->
                                <div class="mx-auto px-5 my-5" >
                                    <c:if test="${requestScope.allEmployees != null}">
                                    <!-- Payment History Table -->
                                    <table id='personal-info-table' class="table text-center table-striped">
                                        <tr style="position: sticky; top:80px; background-color: #481e40;color: white;font-family: 'Oswald', sans-serif; text-align: center;">
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">ID<i class="fa-solid fa-sort-up fa-lg ms-2"></i></th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Name</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Email</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Contact</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Address</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">City</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">State</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Postal Code</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Age</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Gender</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Marital Status</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Education Level</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Primary Language</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Subsidiary Language</th>
                                        </tr>
                                        <!-- Loop Through Payment History Records -->
                                        <c:forEach items="${requestScope.allEmployees}" var="employee">
                                        <tr style="border-bottom: 2px solid #481e40">
                                                <td>${employee.employee_id}</td>
                                                <td>${employee.first_name} ${employee.last_name}</td>
                                                <td>${employee.email}</td>
                                                <td>${employee.contact}</td>
                                                <td>${employee.address}</td>
                                                <td>${employee.city}</td>
                                                <td>${employee.state}</td>
                                                <td>${employee.postal_code}</td>
                                                <td>${employee.age}</td>
                                                <td>${employee.gender}</td>
                                                <td>${employee.marital_status}</td>
                                                <td>${employee.education_level}</td>
                                                <td>${employee.primary_language}</td>
                                                <td>${employee.subsidiary_language}</td>
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
                            <div class="tab-pane fade" id="work-info-tab-pane" role="tabpanel" aria-labelledby="work-info-tab" tabindex="0">

                                <div class="toast mx-auto my-3" id="toast-work-search" role="alert" aria-live="assertive" aria-atomic="true">
                                    <div class="toast-header">
                                    <h5 class="me-auto text-danger"><i class="fa-solid fa-triangle-exclamation me-3"></i>Error</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                    </div>
                                    <div class="toast-body text-white bg-danger text-center" style="font-size: 17px" id="toast-msg-work-search">
                                        Toast message
                                    </div>
                                </div>

                                <div class="container mt-4">
                                <c:if test="${error != null}">
                                    <div class="alert alert-danger text-center border border-danger">
                                        <b>${error}</b>
                                    </div>
                                </c:if>
                                </div>

                                <div class="d-flex" style="position: absolute; right: 40px; top: 100px">
                                    <i class="fa-solid fa-magnifying-glass fa-lg me-2" style="position:relative; top: 18px"></i>
                                    <input class="form-control me-2 border border-dark" id="search-work" name="search-work" type="search" placeholder="Enter work info" aria-label="Search">
                                    <button class="btn border-dark" id="search-btn" style="background-color: #fe8a80;color: #4C2B3E; font-weight: 700; font-family: 'Roboto', sans-serif;" onclick="SearchEmployeeForWorkInfo()">SEARCH</button>
                                </div>

                                <div class="d-flex justify-content-between my-5 mx-5">
                                    <form action="/app/group_work" method="POST" class="d-flex align-items-center me-5" style="margin-right: 100px">
                                        <div class="d-flex">
                                            <i class="fa-solid fa-arrows-split-up-and-left fa-2x me-2" style="position:relative; top: 3px"></i>
                                            <div class="form-group">
                                                <select class="form-select border-dark me-5" name="work-group-option" style="width: 300px" aria-label="Default select example">
                                                    <option value="" selected>-- Select Grouping By Column --</option>
                                                    <option value="education_level">Education Level</option>
                                                    <option value="employee_type">Employee Type</option>
                                                    <option value="employee_status">Employee Status</option>
                                                    <option value="job_title">Job Title</option>
                                                    <option value="department_id">Department ID</option>
                                                    <option value="branch_id">Branch ID</option>
                                                    <option value="manager_id">Manager ID</option>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <button class="btn border-dark ms-3 px-4 me-5" id="group-btn" style="background-color: #fe8a80;color: #4C2B3E; font-weight: 700; font-family: 'Roboto', sans-serif;" type="submit">GROUP</button>
                                            </div>
                                        </div>
                                    </form>

                                    <div style="height: 100px; border-right: 2px solid black;margin-left: 90px"></div>

                                    <form action="/app/sort_work" method="POST" class="d-flex align-items-center">
                                        <div class="d-flex">
                                            <i class="fa-solid fa-sort fa-2x me-2" style="position:relative; top: 3px"></i>
                                            <div class="form-group">
                                                <select class="form-select border-dark me-5" name="work-sort-option" style="width: 300px" aria-label="Default select example">
                                                    <option value="" selected>-- Select Sorting Column --</option>
                                                    <option value="ID">ID</option>
                                                    <option value="name">Name</option>
                                                    <option value="hire_date">Hire Date</option>
                                                    <option value="salary">Salary</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <input type="radio" class="btn-check" name="work-sorting-technique" value="ascending" id="ascending-btn3" autocomplete="off" checked>
                                                <label class="btn btn-outline-primary ms-3 me-2" for="ascending-btn3">Ascending</label>
                                                <input type="radio" class="btn-check" name="work-sorting-technique" value="descending" id="danger-outlined3" autocomplete="off">
                                                <label class="btn btn-outline-success me-5" for="danger-outlined3">Descending</label>
                                            </div>
                                            <div class="form-group">
                                                <button class="btn border-dark ms-3 px-4" id="sort-btn" style="background-color: #fe8a80;color: #4C2B3E; font-weight: 700; font-family: 'Roboto', sans-serif;" type="submit">SORT</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>


                                <!-- Container -->
                                <div class="mx-auto px-5 my-5" style="width: 80%">
                                    <c:if test="${requestScope.allEmployees != null}">
                                    <!-- Payment History Table -->
                                    <table id='work-info-table' class="table text-center table-striped">
                                        <tr style="position: sticky; top:80px; background-color: #481e40;color: white;font-family: 'Oswald', sans-serif; text-align: center;">
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">ID</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Name</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Hire Date<i class="fa-solid fa-sort-up fa-lg ms-2"></i></th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Education Level</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Employee Type</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Employee Status</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Job Title</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Salary</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Department ID</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Branch ID</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Manager ID</th>
                                        </tr>
                                        <!-- Loop Through Payment History Records -->
                                        <c:forEach items="${requestScope.allEmployees}" var="employee">
                                        <tr style="border-bottom: 2px solid #481e40">
                                            <td>${employee.employee_id}</td>
                                            <td>${employee.first_name} ${employee.last_name}</td>
                                            <td>${employee.hire_date}</td>
                                            <td>${employee.education_level}</td>
                                            <td>${employee.employee_type}</td>
                                            <td>${employee.employee_status}</td>
                                            <td>${employee.job_title}</td>
                                            <td>${employee.salary}</td>
                                            <td>${employee.department_id}</td>
                                            <td>${employee.branch_id}</td>
                                            <c:choose>
                                                <c:when test="${employee.manager_id == null}">
                                                    <td> - </td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>${employee.manager_id}</td>
                                                </c:otherwise>
                                            </c:choose>
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
            function SearchEmployeeForPersonalInfo() {
                    let input = document.getElementById('search-personal');
                    let table = document.getElementById('personal-info-table');
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
                        if(rowMatchFound) {
                            rows[i].classList.add('highlight');
                            let y = rows[i].offsetTop;
                            let scrollY = y - (window.innerHeight / 2) + (rows[i].offsetHeight / 2);
                            window.scrollTo(0, scrollY);
                            matchFound = true;
                        }
                    }
                    if(!matchFound) {
                            const toast = new bootstrap.Toast(document.getElementById('toast-personal-search'));
                            document.getElementById('toast-msg-personal-search').innerHTML = 'Searched Personal Information not found';
                            toast.show();
                        }
            }

            function SearchEmployeeForWorkInfo() {
                    let input = document.getElementById('search-work');
                    let table = document.getElementById('work-info-table');
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
                        if(rowMatchFound) {
                            rows[i].classList.add('highlight');
                            let y = rows[i].offsetTop;
                            let scrollY = y - (window.innerHeight / 2) + (rows[i].offsetHeight / 2);
                            window.scrollTo(0, scrollY);
                            matchFound = true;
                        }
                    }
                        if (!matchFound) {
                            const toast = new bootstrap.Toast(document.getElementById('toast-work-search'));
                            document.getElementById('toast-msg-work-search').innerHTML = 'Searched Work Information not found';
                            toast.show();
                        }
            }
</script>

</html>