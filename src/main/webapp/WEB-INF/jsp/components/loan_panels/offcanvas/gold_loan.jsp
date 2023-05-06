<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://example.com/functions" prefix="f" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
 <div class="offcanvas offcanvas-top col-5 mx-auto" onload="GLDefaultJob()" tabindex="-1" id="offcanvasGL" aria-labelledby="offcanvasGL" style="height: 87vh;">

        <div class="offcanvas-header">
            <h2 class="offcanvas-title" id="offcanvasGL">Gold Loan Application</h2>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>

        <div class="offcanvas-body">
            <br>

            <div class="container pe-5">

                <div style="position: fixed;right: 590px;bottom: 140px;">
                    <a href="#GL-submit-btn"><i class="fa-solid fa-angles-down fa-3x text-dark"></i></a>
                </div>

                    <form action="/apply/gold_loan" method="POST" id="GL-form" enctype="multipart/form-data">
                        <div class="card bg-transparent">
                            <div class="card-title mt-3 text-center">
                                <h3><i class="fa-solid fa-id-card me-3"></i>Personal Information</h3>
                            </div>
                            <div class="card-body">
                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">First Name:</label>
                                    <input type="text" name="GL_UserFirstName" class="form-control" placeholder="Enter First Name">
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Last Name:</label>
                                    <input type="text" name="GL_UserLastName" class="form-control" placeholder="Enter Last Name">
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Email ID:</label>
                                    <input type="text"  name="GL_UserEmail" class="form-control" placeholder="Enter Email Address">
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Contact Number:</label>
                                    <input type="text" name="GL_UserContact" class="form-control" placeholder="Enter Contact Number">
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Age:</label>
                                    <div style="width: 100px;text-align: center;"><h5 class="bg-light border border-dark mt-2" id="GLAge"></h5> </div>
                                    <input type="range" min="23" max="62" value="23" class="slider" name="GL_UserAge" id="GL_UserAge">
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Birth Date:</label>
                                    <input type="date" id="GL_UserBirthDate" name="GL_UserBirthDate" class="form-control" placeholder="Enter Birth Date">
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Religion:</label>
                                    <input type="text" name="GL_UserReligion" class="form-control" placeholder="Enter Religion">
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Marital Status:</label>
                                    <div class="form-check my-1">
                                        <input type="radio" name="GL_UserMaritalStatus" value="married" class="form-check-input" id="GL_MaritalStatus_radio1">
                                        <label class="form-check-label" for="GL_MaritalStatus_radio1">Married</label>
                                    </div>
                                    <div class="form-check my-1">
                                        <input type="radio" name="GL_UserMaritalStatus" value="single" class="form-check-input" id="GL_MaritalStatus_radio2">
                                        <label class="form-check-label" for="GL_MaritalStatus_radio2">Single</label>
                                    </div>
                                    <div class="form-check my-1">
                                        <input type="radio" name="GL_UserMaritalStatus" value="divorced" class="form-check-input" id="GL_MaritalStatus_radio3">
                                        <label class="form-check-label" for="GL_MaritalStatus_radio3">Divorced</label>
                                    </div>

                                    <div class="form-check my-1">
                                        <input type="radio" name="GL_UserMaritalStatus" value="widowed" class="form-check-input" id="GL_MaritalStatus_radio4">
                                        <label class="form-check-label" for="GL_MaritalStatus_radio4">Widowed</label>
                                    </div>
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1 mb-2" for="">Proof of Identity (PDF):</label>
                                    <input type="file" id="GL_UserProofIdentity" name="GL_UserProofIdentity" class="form-control" accept="application/pdf">
                                </div>
                            </div>
                            <div class="toast mx-auto mb-5" id="GL_error-toast-personal-info" data-bs-delay="10000" role="alert" aria-live="assertive" aria-atomic="true">
                                <div class="toast-header">

                                <h5 class="me-auto text-danger"><i class="fa-solid fa-triangle-exclamation me-3"></i>Error</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                </div>
                                <div class="toast-body text-white bg-danger text-center" style="font-size: 17px" id="GL_error-toast-msg-personal-info">
                                    Toast message
                                </div>
                            </div>
                        </div>

                        <div class="card bg-transparent mt-4">
                            <div class="card-title mt-3 text-center">
                                <h3><i class="fa-solid fa-map-location-dot me-3"></i>Address</h3>
                            </div>
                            <div class="card-body">
                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">House / Flat / Plot No. / Floor No.:</label>
                                    <input type="text" name="GL_UserAddressHouse" class="form-control" placeholder="Enter House Details">
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Complex / Society Name:</label>
                                    <input type="text" name="GL_UserAddressComplex" class="form-control" placeholder="Enter Complex Name">
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Street Address Line 1:</label>
                                    <input type="text" name="GL_UserAddressStreetLine1" class="form-control" placeholder="Enter Street Address">
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Street Address Line 2:</label>
                                    <input type="text" name="GL_UserAddressStreetLine2" class="form-control" placeholder="Enter Street Address">
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">City:</label>
                                    <input type="text" name="GL_UserAddressCity" class="form-control" placeholder="Enter City">
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">State:</label>
                                    <select name="GL_userAddressState" class="form-control" id="">
                                        <option value="">-- Select State --</option>
                                        <option value="Andhra Pradesh">Andhra Pradesh</option>
                                        <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                                        <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                                        <option value="Assam">Assam</option>
                                        <option value="Bihar">Bihar</option>
                                        <option value="Chandigarh">Chandigarh</option>
                                        <option value="Chhattisgarh">Chhattisgarh</option>
                                        <option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
                                        <option value="Daman and Diu">Daman and Diu</option>
                                        <option value="Delhi">Delhi</option>
                                        <option value="Lakshadweep">Lakshadweep</option>
                                        <option value="Puducherry">Puducherry</option>
                                        <option value="Goa">Goa</option>
                                        <option value="Gujarat">Gujarat</option>
                                        <option value="Haryana">Haryana</option>
                                        <option value="Himachal Pradesh">Himachal Pradesh</option>
                                        <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                                        <option value="Jharkhand">Jharkhand</option>
                                        <option value="Karnataka">Karnataka</option>
                                        <option value="Kerala">Kerala</option>
                                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                                        <option value="Maharashtra">Maharashtra</option>
                                        <option value="Manipur">Manipur</option>
                                        <option value="Meghalaya">Meghalaya</option>
                                        <option value="Mizoram">Mizoram</option>
                                        <option value="Nagaland">Nagaland</option>
                                        <option value="Odisha">Odisha</option>
                                        <option value="Punjab">Punjab</option>
                                        <option value="Rajasthan">Rajasthan</option>
                                        <option value="Sikkim">Sikkim</option>
                                        <option value="Tamil Nadu">Tamil Nadu</option>
                                        <option value="Telangana">Telangana</option>
                                        <option value="Tripura">Tripura</option>
                                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                                        <option value="Uttarakhand">Uttarakhand</option>
                                        <option value="West Bengal">West Bengal</option>
                                        </select>
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Postal Code:</label>
                                    <input type="text" name="GL_UserAddressPostalCode" class="form-control" placeholder="Enter Postal Code">
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1 mb-2" for="">Address Proof [Electricity Bill, Water Bill, Gas Bill, Rent Agreement, Property Tax Receipt, etc.] (PDF):</label>
                                    <input type="file" id="GL_UserAddressProof" name="GL_UserAddressProof" class="form-control" accept="application/pdf">
                                </div>

                                <div class="toast mx-auto mb-5" id="GL_error-toast-address" data-bs-delay="10000" role="alert" aria-live="assertive" aria-atomic="true">
                                    <div class="toast-header">

                                    <h5 class="me-auto text-danger"><i class="fa-solid fa-triangle-exclamation me-3"></i>Error</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                    </div>
                                    <div class="toast-body text-white bg-danger text-center" style="font-size: 17px" id="GL_error-toast-msg-address">
                                        Toast message
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="card bg-transparent mt-4">
                            <div class="card-title mt-3 text-center">
                                <h3><i class="fa-solid fa-briefcase me-3"></i>Job Information</h3>
                            </div>
                            <div class="card-body">
                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Company Name:</label>
                                    <input type="text" name="GL_UserCompanyName" class="form-control" placeholder="Enter Company Name">
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Job Title:</label>
                                    <input type="text" name="GL_UserJobTitle" class="form-control" placeholder="Enter Job Title">
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Employment Status:</label>
                                    <select name="GL_UserEmploymentStatus" class="form-control" id="">
                                        <option value="">-- Select Employment Status --</option>
                                        <option value="Full-time">Full-time</option>
                                        <option value="Part-time">Part-time</option>
                                        <option value="Contract">Contract</option>
                                        <option value="Temporary">Temporary </option>
                                        <option value="Seasonal">Seasonal</option>
                                        <option value="Self-employment">Self-employment</option>
                                    </select>
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Period of Employment (in Years):</label>
                                    <div style="width: 100px;text-align: center;"><h5 class="bg-light border border-dark mt-2" id="GLPeriodEmployed"></h5> </div>
                                    <input type="range" min="1" max="30" value="1" class="slider" name="GLEmploymentPeriod" id="GLEmploymentPeriod">
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Work Mode:</label>
                                    <div class="form-check my-1">
                                        <input type="radio" name="GL_UserWorkMode" value="WFH" class="form-check-input" id="GL_workMode_radio1">
                                        <label class="form-check-label" for="GL_workMode_radio1">Work From Home (WFH)</label>
                                    </div>
                                    <div class="form-check my-1">
                                        <input type="radio" name="GL_UserWorkMode" value="onSite" class="form-check-input" id="GL_workMode_radio2">
                                        <label class="form-check-label" for="GL_workMode_radio2">On-Site Work</label>
                                    </div>
                                    <div class="form-check my-1">
                                        <input type="radio" name="GL_UserWorkMode" value="hybrid" class="form-check-input" id="GL_workMode_radio3">
                                        <label class="form-check-label" for="GL_workMode_radio3">Hybrid</label>
                                    </div>
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Department:</label>
                                    <input type="text" name="GL_UserDepartment" class="form-control" placeholder="Enter Department">
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Annual Salary:</label>
                                    <input type="text" name="GL_UserSalary" class="form-control" placeholder="Enter Salary">
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Industry:</label>
                                    <input type="text" name="GL_UserIndustry" class="form-control" placeholder="Enter Industry">
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1 mb-2" for="">Salary Slip (PDF):</label>
                                    <input type="file" id="GL_UserSalarySlip" name="GL_UserSalarySlip" class="form-control" accept="application/pdf">
                                </div>

                                <div class="toast mx-auto mb-5" id="GL_error-toast-job-info" data-bs-delay="10000" role="alert" aria-live="assertive" aria-atomic="true">
                                    <div class="toast-header">

                                    <h5 class="me-auto text-danger"><i class="fa-solid fa-triangle-exclamation me-3"></i>Error</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                    </div>
                                    <div class="toast-body text-white bg-danger text-center" style="font-size: 17px" id="GL_error-toast-msg-job-info">
                                        Toast message
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="card bg-transparent mt-4">
                            <div class="card-title mt-3 text-center">
                                <h3><i class="fa-solid fa-money-check-dollar me-3"></i>Financial Information</h3>
                            </div>
                            <div class="card-body">
                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Monthly Income:</label>
                                    <input type="text" name="GL_UserIncome" class="form-control" placeholder="Enter Monthly Income">
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Investment Amount:</label>
                                    <input type="text" name="GL_UserInvestment" class="form-control" placeholder="Enter Investment Amount">
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Credit Card Debt:</label>
                                    <input type="text" name="GL_UserCreditCardDebt" class="form-control" placeholder="Enter Credit Card Debt">
                                </div>

                                <div class="form-group mb-3">
                                    <label for="">Select Account</label>
                                    <select name="GL_UserAccount" class="form-control my-3" id="">
                                        <option value="">-- Select Account --</option>
                                        <c:if test="${userAccounts != null}">
                                            <c:forEach items="${userAccounts}" var="selectAccount">
                                                <option value="${selectAccount.account_id}">${selectAccount.account_name}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1 mb-2" for="">Bank Account Statement (PDF):</label>
                                    <input type="file" id="GL_UserBankAccountStatement" name="GL_UserBankAccountStatement" class="form-control" accept="application/pdf">
                                </div>

                                <div class="toast mx-auto mb-5" id="GL_error-toast-finance-info" data-bs-delay="10000" role="alert" aria-live="assertive" aria-atomic="true">
                                    <div class="toast-header">

                                    <h5 class="me-auto text-danger"><i class="fa-solid fa-triangle-exclamation me-3"></i>Error</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                    </div>
                                    <div class="toast-body text-white bg-danger text-center" style="font-size: 17px" id="GL_error-toast-msg-finance-info">
                                        Toast message
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card bg-transparent mt-4">
                            <div class="card-title mt-3 text-center">
                                <h3><i class="fa-solid fa-coins me-3"></i>Gold Information</h3>
                            </div>
                            <div class="card-body">

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Purpose of Gold Loan:</label>
                                    <select name="GL_UserLoanPurpose" class="form-control" id="">
                                        <option value="">-- Select Purpose of Loan --</option>
                                        <option value="debt-consolidation">Debt Consolidation</option>
                                        <option value="home-improvements">Home Improvements</option>
                                        <option value="education">Education</option>
                                        <option value="purchases">Major Purchases</option>
                                        <option value="travel">Travel</option>
                                        <option value="medical">Medical</option>
                                        <option value="wedding">Wedding</option>
                                        <option value="business">Business</option>
                                    </select>
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Gold Weight:</label>
                                    <div style="width: 100px;text-align: center;"><h5 class="bg-light border border-dark mt-2" id="GLgoldWeight"></h5> </div>
                                    <input type="range" min="1" max="5000" value="1" class="slider" name="GLgoldWeightSlider" id="GLgoldWeightSlider">
                                    <div class="d-flex">
                                         <span onclick="GLupdateLoanApplicationGoldWeight(1)" style="margin-right: 125px;cursor: pointer;">1</span>
                                         <span onclick="GLupdateLoanApplicationGoldWeight(1000)" style="margin-right: 110px;cursor: pointer;">1 K</span>
                                         <span onclick="GLupdateLoanApplicationGoldWeight(2000)" style="margin-right: 105px;cursor: pointer;">2 K</span>
                                         <span onclick="GLupdateLoanApplicationGoldWeight(3000)" style="margin-right: 108px;cursor: pointer;">3 K</span>
                                         <span style="cursor: pointer;" onclick="GLupdateLoanApplicationGoldWeight(4000)">4 K</span>
                                         <span onclick="GLupdateLoanApplicationGoldWeight(5000)" style="position: absolute;right: 16px;cursor: pointer;">5 K</span>
                                     </div>
                                </div>

                                <div class="form-group mb-3">
                                  <label class="ms-1" for="">Gold Ornaments:</label>
                                  <div class="form-check my-1">
                                    <input type="checkbox" name="GL_UserGoldOrnaments" value="chain" class="form-check-input" id="GL_goldOrnament_checkbox1">
                                    <label class="form-check-label" for="GL_goldOrnament_checkbox1">Chain</label>
                                  </div>
                                  <div class="form-check my-1">
                                    <input type="checkbox" name="GL_UserGoldOrnaments" value="bangles" class="form-check-input" id="GL_goldOrnament_checkbox2">
                                    <label class="form-check-label" for="GL_goldOrnament_checkbox2">Bangles</label>
                                  </div>
                                  <div class="form-check my-1">
                                    <input type="checkbox" name="GL_UserGoldOrnaments" value="rings" class="form-check-input" id="GL_goldOrnament_checkbox3">
                                    <label class="form-check-label" for="GL_goldOrnament_checkbox3">Rings</label>
                                  </div>
                                  <div class="form-check my-1">
                                    <input type="checkbox" name="GL_UserGoldOrnaments" value="earring" class="form-check-input" id="GL_goldOrnament_checkbox4">
                                    <label class="form-check-label" for="GL_goldOrnament_checkbox4">Earrings</label>
                                  </div>
                                </div>

                                <div class="form-group mb-3">
                                    <label class="ms-1" for="">Total Ornament Count:</label>
                                    <input type="text" id="GL_UserGoldOrnamentCount" name="GL_UserGoldOrnamentCount" class="form-control" placeholder="Enter Number of Ornaments">
                                </div>

                                <div class="toast mx-auto mb-5" id="GL_error-toast-gold-info" data-bs-delay="10000" role="alert" aria-live="assertive" aria-atomic="true">
                                    <div class="toast-header">

                                    <h5 class="me-auto text-danger"><i class="fa-solid fa-triangle-exclamation me-3"></i>Error</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                    </div>
                                    <div class="toast-body text-white bg-danger text-center" style="font-size: 17px" id="GL_error-toast-msg-gold-info">
                                        Toast message
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group my-4">
                            <button class="btn btn-lg loan-submit-btn" id="GL-submit-btn" type="submit">Submit</button>
                        </div>


                    </form>
            </div>

        </div>



    </div>