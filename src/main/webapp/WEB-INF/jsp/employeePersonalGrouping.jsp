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
    <title>Admin Dashboard</title>
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
                                <button class="nav-link"
                                    style="--bs-nav-link-color: #4C2B3E; --bs-nav-link-font-weight: 700; font-family: 'Roboto', sans-serif;"
                                    id="all-record-tab" data-bs-toggle="tab" data-bs-target="#all-record-tab-pane" type="button"
                                    role="tab" aria-controls="all-record-tab-pane" aria-selected="false">All Records</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link ${activeTab == 'personal' ? 'active' : ''}"
                                    style="--bs-nav-link-color: #4C2B3E; --bs-nav-link-font-weight: 700; font-family: 'Roboto', sans-serif;"
                                    id="personal-info-tab" data-bs-toggle="tab" data-bs-target="#personal-info-tab-pane" type="button"
                                    role="tab" aria-controls="personal-info-tab-pane" aria-selected="true">Personal</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link ${activeTab == 'work' ? 'active' : ''}"
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


                            <div class="tab-pane fade" id="all-record-tab-pane" role="tabpanel" aria-labelledby="all-record-tab"
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
                        </div>

                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade ${activeTab == 'personal' ? 'show active' : ''}" id="personal-info-tab-pane" role="tabpanel" aria-labelledby="personal-info-tab" tabindex="0">

                                <div class="toast mx-auto my-3" id="toast-personal-search" role="alert" aria-live="assertive" aria-atomic="true">
                                    <div class="toast-header">
                                    <h5 class="me-auto text-danger"><i class="fa-solid fa-triangle-exclamation me-3"></i>Error</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                    </div>
                                    <div class="toast-body text-white bg-danger text-center" style="font-size: 17px" id="toast-msg-personal-search">
                                        Toast message
                                    </div>
                                </div>

                            <div class="container my-4">
                            <c:if test="${error != null}">
                                <div class="alert alert-danger text-center border border-danger">
                                    <b>${error}</b>
                                </div>
                            </c:if>
                            </div>

                            <div class="container my-4">
                            <c:if test="${errorGrouping != null}">
                                <div class="alert alert-danger text-center border border-danger">
                                    <b>${errorGrouping}</b>
                                </div>
                            </c:if>
                            </div>


                                <div class="d-flex" style="position: absolute; right: 40px; top: 100px">
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
                                    <c:if test="${requestScope.sortedEmployees != null}">
                                    <!-- Payment History Table -->
                                    <table id='personal-info-table' class="table text-center table-striped">
                                        <tr style="position: sticky; top:80px; background-color: #481e40;color: white;font-family: 'Oswald', sans-serif; text-align: center;">
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">ID
                                                <c:if test="${sortingColumn_technique == 'ID_asc'}"><i class="fa-solid fa-sort-up fa-lg ms-2"></i></c:if>
                                                <c:if test="${sortingColumn_technique == 'ID_desc'}"><i class="fa-solid fa-sort-down fa-lg ms-2" style="position:relative; bottom: 7px"></i></c:if>
                                            </th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Name
                                                <c:if test="${sortingColumn_technique == 'name_asc'}"><i class="fa-solid fa-sort-up fa-lg ms-2"></i></c:if>
                                                <c:if test="${sortingColumn_technique == 'name_desc'}"><i class="fa-solid fa-sort-down fa-lg ms-2" style="position:relative; bottom: 7px"></i></c:if>
                                            </th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Email</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Contact</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Address</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">City
                                                <c:if test="${sortingColumn_technique == 'city_asc'}"><i class="fa-solid fa-sort-up fa-lg ms-2"></i></c:if>
                                                <c:if test="${sortingColumn_technique == 'city_desc'}"><i class="fa-solid fa-sort-down fa-lg ms-2" style="position:relative; bottom: 7px"></i></c:if>
                                            </th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">State</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Postal Code</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Age
                                                <c:if test="${sortingColumn_technique == 'age_asc'}"><i class="fa-solid fa-sort-up fa-lg ms-2"></i></c:if>
                                                <c:if test="${sortingColumn_technique == 'age_desc'}"><i class="fa-solid fa-sort-down fa-lg ms-2" style="position:relative; bottom: 7px"></i></c:if>
                                            </th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Gender</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Marital Status</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Education Level</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Primary Language</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Subsidiary Language</th>
                                        </tr>
                                        <!-- Loop Through Payment History Records -->
                                        <c:forEach items="${requestScope.sortedEmployees}" var="employee">
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


                                    <c:if test="${requestScope.employeesGroupedByCity != null}">
                                        <c:forEach items="${requestScope.employeesGroupedByCity}" var="groupByCity">
                                            <table id='personal-info-table' class="table text-center table-striped" style="margin-bottom: 70px">
                                                <tr style="position: sticky; top:80px; background-color: #481e40;color: white;font-family: 'Oswald', sans-serif; text-align: center;">
                                                    <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">ID</th>
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

                                                <c:forEach items="${groupByCity.value}" var="employee" varStatus="loop">
                                                    <tr style="border-bottom: 2px solid #481e40">
                                                        <td>${employee.employee_id}</td>
                                                        <td>${employee.first_name} ${employee.last_name}</td>
                                                        <td>${employee.email}</td>
                                                        <td>${employee.contact}</td>
                                                        <td>${employee.address}</td>
                                                        <c:if test="${loop.first}">
                                                            <td style="background-color:#7e3570;color:white; vertical-align: middle;text-size:18px" rowspan="${fn:length(groupByCity.value)}">${groupByCity.key}</td>
                                                        </c:if>
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
                                            </table>
                                        </c:forEach>
                                    </c:if>


                                    <c:if test="${requestScope.employeesGroupedByState != null}">
                                        <c:forEach items="${requestScope.employeesGroupedByState}" var="groupByState">
                                            <table id='personal-info-table' class="table text-center table-striped" style="margin-bottom: 70px">
                                                <tr style="position: sticky; top:80px; background-color: #481e40;color: white;font-family: 'Oswald', sans-serif; text-align: center;">
                                                    <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">ID</th>
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

                                                <c:forEach items="${groupByState.value}" var="employee" varStatus="loop">
                                                    <tr style="border-bottom: 2px solid #481e40">
                                                        <td>${employee.employee_id}</td>
                                                        <td>${employee.first_name} ${employee.last_name}</td>
                                                        <td>${employee.email}</td>
                                                        <td>${employee.contact}</td>
                                                        <td>${employee.address}</td>
                                                        <td>${employee.city}</td>
                                                        <c:if test="${loop.first}">
                                                            <td style="background-color:#7e3570;color:white; vertical-align: middle;text-size:18px" rowspan="${fn:length(groupByState.value)}">${groupByState.key}</td>
                                                        </c:if>
                                                        <td>${employee.postal_code}</td>
                                                        <td>${employee.age}</td>
                                                        <td>${employee.gender}</td>
                                                        <td>${employee.marital_status}</td>
                                                        <td>${employee.education_level}</td>
                                                        <td>${employee.primary_language}</td>
                                                        <td>${employee.subsidiary_language}</td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </c:forEach>
                                    </c:if>


                                    <c:if test="${requestScope.employeesGroupedByAge != null}">
                                        <c:forEach items="${requestScope.employeesGroupedByAge}" var="groupByAge">
                                            <table id='personal-info-table' class="table text-center table-striped" style="margin-bottom: 70px">
                                                <tr style="position: sticky; top:80px; background-color: #481e40;color: white;font-family: 'Oswald', sans-serif; text-align: center;">
                                                    <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">ID</th>
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

                                                <c:forEach items="${groupByAge.value}" var="employee" varStatus="loop">
                                                    <tr style="border-bottom: 2px solid #481e40">
                                                        <td>${employee.employee_id}</td>
                                                        <td>${employee.first_name} ${employee.last_name}</td>
                                                        <td>${employee.email}</td>
                                                        <td>${employee.contact}</td>
                                                        <td>${employee.address}</td>
                                                        <td>${employee.city}</td>
                                                        <td>${employee.state}</td>
                                                        <td>${employee.postal_code}</td>
                                                        <c:if test="${loop.first}">
                                                            <td style="background-color:#7e3570;color:white; vertical-align: middle;text-size:18px" rowspan="${fn:length(groupByAge.value)}">${groupByAge.key}</td>
                                                        </c:if>
                                                        <td>${employee.gender}</td>
                                                        <td>${employee.marital_status}</td>
                                                        <td>${employee.education_level}</td>
                                                        <td>${employee.primary_language}</td>
                                                        <td>${employee.subsidiary_language}</td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </c:forEach>
                                    </c:if>


                                    <c:if test="${requestScope.employeesGroupedByGender != null}">
                                        <c:forEach items="${requestScope.employeesGroupedByGender}" var="groupByGender">
                                            <table id='personal-info-table' class="table text-center table-striped" style="margin-bottom: 70px">
                                                <tr style="position: sticky; top:80px; background-color: #481e40;color: white;font-family: 'Oswald', sans-serif; text-align: center;">
                                                    <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">ID</th>
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

                                                <c:forEach items="${groupByGender.value}" var="employee" varStatus="loop">
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
                                                        <c:if test="${loop.first}">
                                                            <td style="background-color:#7e3570;color:white; vertical-align: middle;text-size:18px" rowspan="${fn:length(groupByGender.value)}">${groupByGender.key}</td>
                                                        </c:if>
                                                        <td>${employee.marital_status}</td>
                                                        <td>${employee.education_level}</td>
                                                        <td>${employee.primary_language}</td>
                                                        <td>${employee.subsidiary_language}</td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </c:forEach>
                                    </c:if>


                                    <c:if test="${requestScope.employeesGroupedByMaritalStatus != null}">
                                        <c:forEach items="${requestScope.employeesGroupedByMaritalStatus}" var="groupByMaritalStatus">
                                            <table id='personal-info-table' class="table text-center table-striped" style="margin-bottom: 70px">
                                                <tr style="position: sticky; top:80px; background-color: #481e40;color: white;font-family: 'Oswald', sans-serif; text-align: center;">
                                                    <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">ID</th>
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

                                                <c:forEach items="${groupByMaritalStatus.value}" var="employee" varStatus="loop">
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
                                                        <c:if test="${loop.first}">
                                                            <td style="background-color:#7e3570;color:white; vertical-align: middle;text-size:18px" rowspan="${fn:length(groupByMaritalStatus.value)}">${groupByMaritalStatus.key}</td>
                                                        </c:if>
                                                        <td>${employee.education_level}</td>
                                                        <td>${employee.primary_language}</td>
                                                        <td>${employee.subsidiary_language}</td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </c:forEach>
                                    </c:if>


                                    <c:if test="${requestScope.employeesGroupedByEducationLevel != null}">
                                        <c:forEach items="${requestScope.employeesGroupedByEducationLevel}" var="groupByEducationLevel">
                                            <table id='personal-info-table' class="table text-center table-striped" style="margin-bottom: 70px">
                                                <tr style="position: sticky; top:80px; background-color: #481e40;color: white;font-family: 'Oswald', sans-serif; text-align: center;">
                                                    <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">ID</th>
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
                                                <c:forEach items="${groupByEducationLevel.value}" var="employee" varStatus="loop">
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
                                                        <c:if test="${loop.first}">
                                                            <td style="background-color:#7e3570;color:white; vertical-align: middle;text-size:18px" rowspan="${fn:length(groupByEducationLevel.value)}">${groupByEducationLevel.key}</td>
                                                        </c:if>
                                                        <td>${employee.primary_language}</td>
                                                        <td>${employee.subsidiary_language}</td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </c:forEach>
                                    </c:if>

                                    <c:if test="${requestScope.employeesGroupedBySubsidiaryLanguage != null}">
                                        <c:forEach items="${requestScope.employeesGroupedBySubsidiaryLanguage}" var="groupBySubsidiaryLanguage">
                                            <table id='personal-info-table' class="table text-center table-striped" style="margin-bottom: 70px">
                                                <tr style="position: sticky; top:80px; background-color: #481e40;color: white;font-family: 'Oswald', sans-serif; text-align: center;">
                                                    <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">ID</th>
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

                                                <c:forEach items="${groupBySubsidiaryLanguage.value}" var="employee" varStatus="loop">
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
                                                        <c:if test="${loop.first}">
                                                            <td style="background-color:#7e3570;color:white; vertical-align: middle;text-size:18px" rowspan="${fn:length(groupBySubsidiaryLanguage.value)}">${groupBySubsidiaryLanguage.key}</td>
                                                        </c:if>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </c:forEach>
                                    </c:if>

                                </div>
                                <!-- End of Container -->
                            </div>
                        </div>


                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade ${activeTab == 'work' ? 'show active' : ''}" id="work-info-tab-pane" role="tabpanel" aria-labelledby="work-info-tab" tabindex="0">

                                <div class="toast mx-auto my-3" id="toast-work-search" role="alert" aria-live="assertive" aria-atomic="true">
                                    <div class="toast-header">
                                    <h5 class="me-auto text-danger"><i class="fa-solid fa-triangle-exclamation me-3"></i>Error</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                    </div>
                                    <div class="toast-body text-white bg-danger text-center" style="font-size: 17px" id="toast-msg-work-search">
                                        Toast message
                                    </div>
                                </div>

                                <div class="container my-4">
                                    <c:if test="${workErrorSorting != null}">
                                        <div class="alert alert-danger text-center border border-danger">
                                            <b>${workErrorSorting}</b>
                                        </div>
                                    </c:if>
                                    </div>

                                    <div class="container my-4">
                                    <c:if test="${workErrorGrouping != null}">
                                        <div class="alert alert-danger text-center border border-danger">
                                            <b>${workErrorGrouping}</b>
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
                                                <button class="btn border-dark ms-3 px-4 me-5" id="work-group-btn" style="background-color: #fe8a80;color: #4C2B3E; font-weight: 700; font-family: 'Roboto', sans-serif;" type="submit">GROUP</button>
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
                                                <button class="btn border-dark ms-3 px-4" id="work-sort-btn" style="background-color: #fe8a80;color: #4C2B3E; font-weight: 700; font-family: 'Roboto', sans-serif;" type="submit">SORT</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <!-- Container -->
                                <div class="mx-auto px-5 my-5" style="width: 80%">
                                    <c:if test="${requestScope.workSortedEmployees != null}">
                                    <!-- Payment History Table -->
                                    <table id='work-info-table' class="table text-center table-striped">
                                        <tr style="position: sticky; top:80px; background-color: #481e40;color: white;font-family: 'Oswald', sans-serif; text-align: center;">
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">ID
                                                <c:if test="${workSortingColumn_technique == 'ID_asc'}"><i class="fa-solid fa-sort-up fa-lg ms-2"></i></c:if>
                                                <c:if test="${workSortingColumn_technique == 'ID_desc'}"><i class="fa-solid fa-sort-down fa-lg ms-2" style="position:relative; bottom: 7px"></i></c:if>
                                            </th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Name
                                                <c:if test="${workSortingColumn_technique == 'name_asc'}"><i class="fa-solid fa-sort-up fa-lg ms-2"></i></c:if>
                                                <c:if test="${workSortingColumn_technique == 'name_desc'}"><i class="fa-solid fa-sort-down fa-lg ms-2" style="position:relative; bottom: 7px"></i></c:if>
                                            </th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Hire Date
                                                <c:if test="${workSortingColumn_technique == 'hire_date_asc'}"><i class="fa-solid fa-sort-up fa-lg ms-2"></i></c:if>
                                                <c:if test="${workSortingColumn_technique == 'hire_date_desc'}"><i class="fa-solid fa-sort-down fa-lg ms-2" style="position:relative; bottom: 7px"></i></c:if>
                                            </th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Education Level</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Employee Type</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Employee Status</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Job Title</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Salary
                                                <c:if test="${workSortingColumn_technique == 'salary_asc'}"><i class="fa-solid fa-sort-up fa-lg ms-2"></i></c:if>
                                                <c:if test="${workSortingColumn_technique == 'salary_desc'}"><i class="fa-solid fa-sort-down fa-lg ms-2" style="position:relative; bottom: 7px"></i></c:if>
                                            </th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Department ID</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Branch ID</th>
                                            <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Manager ID</th>
                                        </tr>
                                        <!-- Loop Through Payment History Records -->
                                        <c:forEach items="${requestScope.workSortedEmployees}" var="employee">
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

                                    <c:forEach items="${requestScope.groupedEmployeeObj}" var="employeeList">

                                        <c:if test="${employeeList != null}">
                                            <c:forEach items="${employeeList.value}" var="groupByCol">
                                                <c:if test="${groupByCol != null}">
                                                <table id='personal-info-table' class="table text-center table-striped" style="margin-bottom: 70px">
                                                    <tr style="position: sticky; top:80px; background-color: #481e40;color: white;font-family: 'Oswald', sans-serif; text-align: center;">
                                                        <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">ID</th>
                                                        <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Name</th>
                                                        <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Hire Date</th>
                                                        <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Education Level</th>
                                                        <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Employee Type</th>
                                                        <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Employee Status</th>
                                                        <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Job Title</th>
                                                        <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Salary</th>
                                                        <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Department ID</th>
                                                        <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Branch ID</th>
                                                        <th style="font-family: 'Oswald', sans-serif;text-align:center; color: white">Manager ID</th>
                                                    </tr>

                                                    <c:forEach items="${groupByCol.value}" var="employee" varStatus="loop">
                                                        <tr style="border-bottom: 2px solid #481e40">
                                                            <td>${employee.employee_id}</td>
                                                            <td>${employee.first_name} ${employee.last_name}</td>

                                                            <c:choose>
                                                                <c:when test="${employeeList.key == 'hire_date'}">
                                                                    <c:if test="${loop.first}">
                                                                        <td style="background-color:#7e3570;color:white; vertical-align: middle;text-size:18px" rowspan="${fn:length(groupByCol.value)}">${groupByCol.key}</td>
                                                                    </c:if>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td>${employee.hire_date}</td>
                                                                </c:otherwise>
                                                            </c:choose>

                                                            <c:choose>
                                                                <c:when test="${employeeList.key == 'education_level'}">
                                                                    <c:if test="${loop.first}">
                                                                        <td style="background-color:#7e3570;color:white; vertical-align: middle;text-size:18px" rowspan="${fn:length(groupByCol.value)}">${groupByCol.key}</td>
                                                                    </c:if>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td>${employee.education_level}</td>
                                                                </c:otherwise>
                                                            </c:choose>

                                                            <c:choose>
                                                                <c:when test="${employeeList.key == 'employee_type'}">
                                                                    <c:if test="${loop.first}">
                                                                        <td style="background-color:#7e3570;color:white; vertical-align: middle;text-size:18px" rowspan="${fn:length(groupByCol.value)}">${groupByCol.key}</td>
                                                                    </c:if>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td>${employee.employee_type}</td>
                                                                </c:otherwise>
                                                            </c:choose>

                                                            <c:choose>
                                                                <c:when test="${employeeList.key == 'employee_status'}">
                                                                    <c:if test="${loop.first}">
                                                                        <td style="background-color:#7e3570;color:white; vertical-align: middle;text-size:18px" rowspan="${fn:length(groupByCol.value)}">${groupByCol.key}</td>
                                                                    </c:if>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td>${employee.employee_status}</td>
                                                                </c:otherwise>
                                                            </c:choose>

                                                            <c:choose>
                                                                <c:when test="${employeeList.key == 'job_title'}">
                                                                    <c:if test="${loop.first}">
                                                                        <td style="background-color:#7e3570;color:white; vertical-align: middle;text-size:18px" rowspan="${fn:length(groupByCol.value)}">${groupByCol.key}</td>
                                                                    </c:if>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td>${employee.job_title}</td>
                                                                </c:otherwise>
                                                            </c:choose>

                                                            <c:choose>
                                                                <c:when test="${employeeList.key == 'salary'}">
                                                                    <c:if test="${loop.first}">
                                                                        <td style="background-color:#7e3570;color:white; vertical-align: middle;text-size:18px" rowspan="${fn:length(groupByCol.value)}">${groupByCol.key}</td>
                                                                    </c:if>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td>${employee.salary}</td>
                                                                </c:otherwise>
                                                            </c:choose>

                                                            <c:choose>
                                                                <c:when test="${employeeList.key == 'department_id'}">
                                                                    <c:if test="${loop.first}">
                                                                        <td style="background-color:#7e3570;color:white; vertical-align: middle;text-size:18px" rowspan="${fn:length(groupByCol.value)}">${groupByCol.key} <br>
                                                                        <c:if test="${departmentNames != null}">(${departmentNames[groupByCol.key]})</c:if>
                                                                        </td>
                                                                    </c:if>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td>${employee.department_id}</td>
                                                                </c:otherwise>
                                                            </c:choose>

                                                            <c:choose>
                                                                <c:when test="${employeeList.key == 'branch_id'}">
                                                                    <c:if test="${loop.first}">
                                                                        <td style="background-color:#7e3570;color:white; vertical-align: middle;text-size:18px" rowspan="${fn:length(groupByCol.value)}">${groupByCol.key} <br>
                                                                        <c:if test="${branchNames != null}">(${branchNames[groupByCol.key]})</c:if>
                                                                        </td>
                                                                    </c:if>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td>${employee.branch_id}</td>
                                                                </c:otherwise>
                                                            </c:choose>

                                                            <c:choose>
                                                                <c:when test="${employeeList.key == 'manager_id'}">
                                                                    <c:if test="${loop.first}">
                                                                        <td style="background-color:#7e3570;color:white; vertical-align: middle;text-size:18px" rowspan="${fn:length(groupByCol.value)}">${groupByCol.key} <br>
                                                                            <c:if test="${managerNames != null}">(${managerNames[groupByCol.key]})</c:if>
                                                                        </td>

                                                                    </c:if>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:choose>
                                                                        <c:when test="${employee.manager_id == null}">
                                                                            <td> - </td>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <td>${employee.manager_id}</td>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:otherwise>
                                                            </c:choose>

                                                        </tr>
                                                    </c:forEach>
                                                </table>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>

                                    </c:forEach>

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
                    console.log('inside search employee');
                    let name = input.value;
                    console.log(name);
                    for (let i = 0; i < rows.length; i++) {
                        let cells = rows[i].getElementsByTagName('td');
                        let matchFound = false;
                        for (let j = 0; j < cells.length; j++) {
                          let cell = cells[j];
                          if (cell.innerText.match(new RegExp('^' + name + '$', 'i'))) {
                            matchFound = true;
                            break;
                          }
                        }
                        if(matchFound) {
                            rows[i].classList.add('highlight');
                            let y = rows[i].offsetTop;
                            let scrollY = y - (window.innerHeight / 2) + (rows[i].offsetHeight / 2);
                            window.scrollTo(0, scrollY);
                        }
                        else {
                            const toast = new bootstrap.Toast(document.getElementById('toast-personal-search'));
                            document.getElementById('toast-msg-personal-search').innerHTML = 'Searched Personal Information not found';
                            toast.show();
                        }
                    }
            }

            function SearchEmployeeForWorkInfo() {
                    let input = document.getElementById('search-work');
                    let table = document.getElementById('work-info-table');
                    let rows = table.getElementsByTagName('tr');
                    for (let i = 0; i < rows.length; i++) {
                      rows[i].classList.remove('highlight');
                    }
                    console.log('inside search employee');
                    let name = input.value;
                    console.log(name);
                    for (let i = 0; i < rows.length; i++) {
                        let cells = rows[i].getElementsByTagName('td');
                        let matchFound = false;
                        for (let j = 0; j < cells.length; j++) {
                          let cell = cells[j];
                          if (cell.innerText.match(new RegExp('^' + name + '$', 'i'))) {
                            matchFound = true;
                            break;
                          }
                        }
                        if(matchFound) {
                            rows[i].classList.add('highlight');
                            let y = rows[i].offsetTop;
                            let scrollY = y - (window.innerHeight / 2) + (rows[i].offsetHeight / 2);
                            window.scrollTo(0, scrollY);
                        }
                        else {
                            const toast = new bootstrap.Toast(document.getElementById('toast-work-search'));
                            document.getElementById('toast-msg-work-search').innerHTML = 'Searched Work Information not found';
                            toast.show();
                        }
                    }
            }
</script>

</html>