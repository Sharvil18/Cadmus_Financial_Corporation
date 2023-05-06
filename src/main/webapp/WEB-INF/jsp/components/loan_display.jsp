<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://example.com/functions" prefix="f" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>


<div class="bg-image jumbotron container mt-4 shadow">
            <div class="justify-content-center d-flex">
                <button class="btn btn-grad mx-5" type="button" data-bs-toggle="collapse" data-bs-target="#home-loan" aria-expanded="false"
                aria-controls="home-loan">
                Home Loan
                        </button>
                        <button class="btn btn-grad mx-5" type="button" data-bs-toggle="collapse" data-bs-target="#personal-loan" aria-expanded="false"
                        aria-controls="personal-loan">
                        Personal Loan
                    </button>

                    <button class="btn btn-grad mx-5" type="button" data-bs-toggle="collapse" data-bs-target="#gold-loan" aria-expanded="false"
                aria-controls="gold-loan">
                Gold Loan
            </button>
            </div>
    </div>


        <!-- Container -->
        <div class="container py-5">
            <!-- Display Message -->
            <c:if test="${success != null}">
                <div class="alert alert-success text-center border border-success">
                    <b>${success}</b>
                </div>
            </c:if>
            <!-- End of Display Message -->

            <!-- Display Message -->
            <c:if test="${error != null}">
                <div class="alert alert-danger text-center border border-danger">
                    <b>${error}</b>
                </div>
            </c:if>
            <!-- End of Display Message -->
        </div>
        <!-- End of Container -->

    <div id="myGroup">

        <!-- Display home loan -->
        <c:import url="components/loan_panels/homeLoan.jsp"/>

        <!-- Display personal loan -->
        <c:import url="components/loan_panels/personalLoan.jsp"/>

        <!-- Display gold loan -->
        <c:import url="components/loan_panels/goldLoan.jsp"/>

    </div>

    <!-- Display home loan -->
    <c:import url="components/loan_panels/offcanvas/home_loan.jsp"/>

    <!-- Display personal loan -->
    <c:import url="components/loan_panels/offcanvas/personal_loan.jsp"/>

    <!-- Display gold loan -->
    <c:import url="components/loan_panels/offcanvas/gold_loan.jsp"/>


<script src="js/main.js"></script>

    <script>
        const gl_form = document.getElementById('GL-form');
        const gl_submitBtn = document.getElementById('GL-submit-btn');
        const gl_errorToastMsgPersonalInfo = document.getElementById('GL_error-toast-msg-personal-info');
        const gl_errorToastMsgAddress = document.getElementById('GL_error-toast-msg-address');
        const gl_errorToastMsgJobInfo = document.getElementById('GL_error-toast-msg-job-info');
        const gl_errorToastMsgFinanceInfo = document.getElementById('GL_error-toast-msg-finance-info');
        const gl_errorToastMsgGoldInfo = document.getElementById('GL_error-toast-msg-gold-info');


        let isPersonalInfoValid = 0;
        let isAddressValid = 0;
        let isJobInfoValid = 0;
        let isFinanceInfoValid = 0;
        let isGoldInfoValid = 0;

        gl_submitBtn.addEventListener('click', (event) => {
            event.preventDefault();

            const loanPurpose = gl_form.elements['GL_UserLoanPurpose'];
            const goldWeight = gl_form.elements['GLgoldWeightSlider'];
            const goldOrnament = gl_form.elements['GL_UserGoldOrnaments'];
            const goldOrnamentCount = gl_form.elements['GL_UserGoldOrnamentCount'];
            const loanAmountRegex = /^[0-9]+$/;
            let msg_gold = '';
            if(loanPurpose.value == '' || goldWeight.value == '' || goldOrnamentCount.value == '')
                msg_gold += 'All fields must be filled. <br>';

            else {
                if(loanPurpose.selectedIndex == 0)
                    msg_gold += "Please select an appropriate Purpose of Loan. <br>";
                if(!(goldOrnament[0].checked || goldOrnament[1].checked || goldOrnament[2].checked || goldOrnament[3].checked))
                    msg_gold += "Please select a Gold Ornament. <br>";
                if(!loanAmountRegex.test(goldOrnamentCount.value) || Number(goldOrnamentCount.value) < 0)
                    msg_gold += "Gold Ornament Count is invalid. <br>";
            }

            gl_errorToastMsgGoldInfo.innerHTML = msg_gold;

            if(msg_gold == '') {
                isGoldInfoValid = 1;
            }
            else {
                const toast = new bootstrap.Toast(document.getElementById('GL_error-toast-gold-info'));
                toast.show();
                window.location.hash = '#GL_UserGoldOrnamentCount';
            }



            const income = gl_form.elements['GL_UserIncome'];
            const investment = gl_form.elements['GL_UserInvestment'];
            const creditCardDebt = gl_form.elements['GL_UserCreditCardDebt'];
            const bankAccountStatement = gl_form.elements['GL_UserBankAccountStatement'];
            const incomeRegex = /^[0-9]+$/;
            const acceptedFileType = 'application/pdf';
            let msg_finance = '';
            if(income.value == '' || investment.value == '' || creditCardDebt.value == '' || bankAccountStatement.value == '')
                msg_finance += 'All fields must be filled. <br>';

            else {
                if(!incomeRegex.test(income.value) || Number(income.value) < 200)
                msg_finance += 'Income is invalid. Minimum Monthly Income expected to be Rs. 200. <br>';
                if(!incomeRegex.test(investment.value) || Number(investment.value) < 0)
                    msg_finance += 'Investment Amount is invalid. <br>';
                if(!incomeRegex.test(creditCardDebt.value) || Number(creditCardDebt.value) < 0)
                    msg_finance += 'Credit Card Debt is invalid. <br>';
                if(!bankAccountStatement.files.length==0 && bankAccountStatement.files[0].type !== acceptedFileType)
                        msg_finance += 'Please select PDf file only. <br>';
            }

            gl_errorToastMsgFinanceInfo.innerHTML = msg_finance;

            if(msg_finance == '') {
                isFinanceInfoValid = 1;
            }
            else {
                const toast = new bootstrap.Toast(document.getElementById('GL_error-toast-finance-info'));
                toast.show();
                window.location.hash = '#GL_UserBankAccountStatement';
            }


            const companyName = gl_form.elements['GL_UserCompanyName'];
            const jobTitle = gl_form.elements['GL_UserJobTitle'];
            const employmentStatus = gl_form.elements['GL_UserEmploymentStatus'];
            const employmentPeriod = document.getElementById('GLPeriodEmployed');
            const workMode = gl_form.elements['GL_UserWorkMode'];
            const dept = gl_form.elements['GL_UserDepartment'];
            const salary = gl_form.elements['GL_UserSalary'];
            const industry = gl_form.elements['GL_UserIndustry'];
            const salarySlip = gl_form.elements['GL_UserSalarySlip'];
            const jobTitleRegex = /^[a-zA-Z\s]{2,}$/;
            const salaryRegex = /^[0-9]+$/;
            let msg_job = '';
            if(companyName.value == '' || jobTitle.value == '' || employmentStatus.value == '' || employmentPeriod.value == '' || workMode.value == '' || dept.value == '' || salary.value == '' || industry.value == '' || salarySlip.value == '')
                msg_job += "All fields must be filled. <br>";

            else {
                if(companyName.value.length < 2)
                    msg_job += "Company name is invalid. <br>";
                if(!jobTitleRegex.test(jobTitle.value))
                    msg_job += "Job Title is invalid. <br>";
                if(employmentStatus.selectedIndex == 0)
                    msg_job += "Please select an appropriate Employment Status. <br>";
                if(!(workMode[0].checked || workMode[1].checked || workMode[2].checked))
                    msg_job += "Select a Work Mode. <br>";
                if(!jobTitleRegex.test(dept.value))
                    msg_job += "Department is invalid. <br>";
                if(!salaryRegex.test(salary.value) || Number(salary.value) < 2400)
                    msg_job += "Salary is invalid. Minimum Salary expected to be Rs. 2,400. <br>";
                if(!jobTitleRegex.test(industry.value))
                    msg_job += "Industry is invalid. <br>";
                if(!salarySlip.files.length==0 && salarySlip.files[0].type !== acceptedFileType)
                    msg_job += "Please select PDf file only. <br>";
            }

            gl_errorToastMsgJobInfo.innerHTML = msg_job;

            if(msg_job == '') {
                isJobInfoValid = 1;
            }
            else {
                const toast = new bootstrap.Toast(document.getElementById('GL_error-toast-job-info'));
                toast.show();
                window.location.hash = '#GL_UserSalarySlip';
            }


            const addressHouse = gl_form.elements['GL_UserAddressHouse'];
            const addressComplex = gl_form.elements['GL_UserAddressComplex'];
            const addressStreetLine1 = gl_form.elements['GL_UserAddressStreetLine1'];
            const addressStreetLine2 = gl_form.elements['GL_UserAddressStreetLine2'];
            const addressCity = gl_form.elements['GL_UserAddressCity'];
            const addressState = gl_form.elements['GL_userAddressState'];
            const addressPostalCode = gl_form.elements['GL_UserAddressPostalCode'];
            const addressProof = gl_form.elements['GL_UserAddressProof'];
            const addressRegex = /^[a-zA-Z0-9,/\s]{5,}$/;
            const cityRegex = /^[a-zA-Z0-9,/\s]{2,}$/;
            const postalCodeRegex = /^[0-9]{6}$/;
            let msg_adrress = '';
            if(addressHouse.value == '' || addressComplex.value == '' || addressStreetLine1.value == '' || addressStreetLine2.value == '' || addressCity.value == '' || addressState.value == '' || addressPostalCode.value == '' || addressProof.value == '')
                msg_adrress += "All fields must be filled. <br>";
            else {

                if(!addressRegex.test(addressHouse.value))
                    msg_adrress += "House address is invalid. <br>";
                if(!addressRegex.test(addressComplex.value))
                    msg_adrress += "Complex address is invalid. <br>";
                if(!addressRegex.test(addressStreetLine1.value))
                    msg_adrress += "Street Line 1 is invalid. <br>";
                if(!addressRegex.test(addressStreetLine2.value))
                    msg_adrress += "Street Line 2 is invalid. <br>";
                if(!cityRegex.test(addressCity.value))
                    msg_adrress += "City is invalid. <br>";
                if(addressState.selectedIndex == 0)
                    msg_adrress += "Please select an appropriate State. <br>";
                if(!postalCodeRegex.test(addressPostalCode.value))
                    msg_adrress += "Please enter a valid 6 digit postal code. <br>";
                if((!addressProof.files.length==0) && (addressProof.files[0].type !== acceptedFileType))
                    msg_adrress += "Please select PDf file only. <br>";
            }

            gl_errorToastMsgAddress.innerHTML = msg_adrress;

            if(msg_adrress == '') {
                isAddressValid = 1;
            }
            else {
                const toast = new bootstrap.Toast(document.getElementById('GL_error-toast-address'));
                toast.show();
                window.location.hash = '#GL_UserAddressProof';
            }


            const firstName = gl_form.elements['GL_UserFirstName'];
            const lastName = gl_form.elements['GL_UserLastName'];
            const email = gl_form.elements['GL_UserEmail'];
            const contact = gl_form.elements['GL_UserContact'];
            const religion = gl_form.elements['GL_UserReligion'];
            const age = gl_form.elements['GL_UserAge'];
            const birthDate = gl_form.elements['GL_UserBirthDate'];
            const maritalStatus = gl_form.elements['GL_UserMaritalStatus'];
            const proofOfIdentity = gl_form.elements['GL_UserProofIdentity'];
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const alphabetRegex = /^[a-zA-Z]{2,}$/;
            const contactRegex = /^[0-9]{10}$/;
            const religionRegex = /^[a-zA-Z]{4,}$/;
            const ageRegex = /^[0-9]+$/;
            let date = new Date(birthDate.value);
            let now = new Date();
            let currentYear = now.getFullYear();
            let birthYear = currentYear - Number(age.value);
            let msg = '';
            if (firstName.value == '' || lastName.value == '' || email.value == '' || contact.value == '' || religion.value == '' || maritalStatus == '' || birthDate.value == '' || age.value == '' || proofOfIdentity.value == '')
                msg += 'All fields must be filled.<br>';

            else {
                if(!alphabetRegex.test(firstName.value) || !alphabetRegex.test(lastName.value))
                msg += 'Name must be alphabets only and alteast 2 characters long. <br>';

                if(!emailRegex.test(email.value))
                    msg += "Email address is invalid. <br>";

                if(!contactRegex.test(contact.value))
                    msg += "Contact must be 10 characters long. <br>";

                if(!religionRegex.test(religion.value))
                    msg += "Religion is invalid. <br>";

                if(!(ageRegex.test(age.value)) || Number(age.value) < 23 || Number(age.value) > 62)
                    msg += "Age must be between 23 and 62. <br>";

                if(isNaN(date.getDate()))
                    msg += "Please enter a valid date. <br>";

                if(!(maritalStatus[0].checked || maritalStatus[1].checked || maritalStatus[2].checked || maritalStatus[3].checked))
                    msg += "Select a Maritial Status. <br>";

                if(proofOfIdentity.files.length == 0)
                    msg += "No File is chosen. <br>";

                if(!proofOfIdentity.files.length==0 && proofOfIdentity.files[0].type !== acceptedFileType)
                    msg += "Please select PDf file only. <br>";

                if(date.getFullYear() != birthYear) {
                    msg += "Please enter a valid date that matches your birth date. <br>";
                    let birth_date = new Date(birthDate.value);
                    let tempDate = new Date();
                    let now = new Date();
                    let currentYear = now.getFullYear();
                    let requiredYear = currentYear - Number(GLUserAgeSlider.value);
                    let day = now.getDate().toString().padStart(2, '0');
                    let month = (now.getMonth() + 1).toString().padStart(2, '0');
                    let formattedDate = requiredYear + '-' + '01' + '-' + '01';
                    birthDate.value = formattedDate;
                }
            }



            gl_errorToastMsgPersonalInfo.innerHTML = msg;
            if(msg == '') {
                isPersonalInfoValid = 1;
            }

            else {
                const toast = new bootstrap.Toast(document.getElementById('GL_error-toast-personal-info'));
                toast.show();
                window.location.hash = '#GL_UserProofIdentity';
            }


            if(isPersonalInfoValid == 1 && isAddressValid == 1 && isJobInfoValid == 1 && isFinanceInfoValid == 1 && isGoldInfoValid == 1) {
                gl_form.submit();
            }
        });
    </script>




<script>
        const pl_form = document.getElementById('PL-form');
        const pl_submitBtn = document.getElementById('PL-submit-btn');
        const pl_errorToastMsgPersonalInfo = document.getElementById('PL_error-toast-msg-personal-info');
        const pl_errorToastMsgAddress = document.getElementById('PL_error-toast-msg-address');
        const pl_errorToastMsgJobInfo = document.getElementById('PL_error-toast-msg-job-info');
        const pl_errorToastMsgFinanceInfo = document.getElementById('PL_error-toast-msg-finance-info');
        const pl_errorToastMsgLoanInfo = document.getElementById('PL_error-toast-msg-loan-info');

        let isLoanInfoValid = 0;

        pl_submitBtn.addEventListener('click', (event) => {
            event.preventDefault();

            const loanAmount = pl_form.elements['PL_UserLoanAmountRequested'];
            const loanPurpose = pl_form.elements['PL_UserLoanPurpose'];
            const loanTerm = pl_form.elements['PLloanTermSlider'];
            const loanAmountRegex = /^[0-9]+$/;
            let msg_loan = '';
            if(loanAmount.value == '' || loanPurpose.value == '' || loanTerm.value == '')
                msg_loan += 'All fields must be filled. <br>';

            else {
                if(!loanAmountRegex.test(loanAmount.value) || Number(loanAmount.value) < 5000)
                msg_loan += "Loan Amount is invalid. Minimum Loan Amount expected to be Rs. 50,000. <br>";
                if(loanPurpose.selectedIndex == 0)
                    msg_loan += "Please select an appropriate Purpose of Loan. <br>";
            }

            pl_errorToastMsgLoanInfo.innerHTML = msg_loan;

            if(msg_loan == '') {
                isLoanInfoValid = 1;
            }
            else {
                const toast = new bootstrap.Toast(document.getElementById('PL_error-toast-loan-info'));
                toast.show();
                window.location.hash = '#PLloanTermSlider';
            }


            const income = pl_form.elements['PL_UserIncome'];
            const investment = pl_form.elements['PL_UserInvestment'];
            const creditCardDebt = pl_form.elements['PL_UserCreditCardDebt'];
            const bankAccountStatement = pl_form.elements['PL_UserBankAccountStatement'];
            const incomeRegex = /^[0-9]+$/;
            const acceptedFileType = 'application/pdf';
            let msg_finance = '';
            if(income.value == '' || investment.value == '' || creditCardDebt.value == '' || bankAccountStatement.value == '')
                msg_finance += 'All fields must be filled. <br>';

            else {
                if(!incomeRegex.test(income.value) || Number(income.value) < 200)
                msg_finance += 'Income is invalid. Minimum Monthly Income expected to be Rs. 200. <br>';
                if(!incomeRegex.test(investment.value) || Number(investment.value) < 0)
                    msg_finance += 'Investment Amount is invalid. <br>';
                if(!incomeRegex.test(creditCardDebt.value) || Number(creditCardDebt.value) < 0)
                    msg_finance += 'Credit Card Debt is invalid. <br>';
                if(!bankAccountStatement.files.length==0 && bankAccountStatement.files[0].type !== acceptedFileType)
                        msg_finance += 'Please select PDf file only. <br>';
            }

            pl_errorToastMsgFinanceInfo.innerHTML = msg_finance;

            if(msg_finance == '') {
                isFinanceInfoValid = 1;
            }
            else {
                const toast = new bootstrap.Toast(document.getElementById('PL_error-toast-finance-info'));
                toast.show();
                window.location.hash = '#PL_UserBankAccountStatement';
            }


            const companyName = pl_form.elements['PL_UserCompanyName'];
            const jobTitle = pl_form.elements['PL_UserJobTitle'];
            const employmentStatus = pl_form.elements['PL_UserEmploymentStatus'];
            const employmentPeriod = document.getElementById('PLPeriodEmployed');
            const workMode = pl_form.elements['PL_UserWorkMode'];
            const dept = pl_form.elements['PL_UserDepartment'];
            const salary = pl_form.elements['PL_UserSalary'];
            const industry = pl_form.elements['PL_UserIndustry'];
            const salarySlip = pl_form.elements['PL_UserSalarySlip'];
            const jobTitleRegex = /^[a-zA-Z\s]{2,}$/;
            const salaryRegex = /^[0-9]+$/;
            let msg_job = '';
            if(companyName.value == '' || jobTitle.value == '' || employmentStatus.value == '' || employmentPeriod.value == '' || workMode.value == '' || dept.value == '' || salary.value == '' || industry.value == '' || salarySlip.value == '')
                msg_job += "All fields must be filled. <br>";

            else {
                if(companyName.value.length < 2)
                    msg_job += "Company name is invalid. <br>";
                if(!jobTitleRegex.test(jobTitle.value))
                    msg_job += "Job Title is invalid. <br>";
                if(employmentStatus.selectedIndex == 0)
                    msg_job += "Please select an appropriate Employment Status. <br>";
                if(!(workMode[0].checked || workMode[1].checked || workMode[2].checked))
                    msg_job += "Select a Work Mode. <br>";
                if(!jobTitleRegex.test(dept.value))
                    msg_job += "Department is invalid. <br>";
                if(!salaryRegex.test(salary.value) || Number(salary.value) < 2400)
                    msg_job += "Salary is invalid. Minimum Salary expected to be Rs. 2,400. <br>";
                if(!jobTitleRegex.test(industry.value))
                    msg_job += "Industry is invalid. <br>";
                if(!salarySlip.files.length==0 && salarySlip.files[0].type !== acceptedFileType)
                    msg_job += "Please select PDf file only. <br>";
            }

            pl_errorToastMsgJobInfo.innerHTML = msg_job;

            if(msg_job == '') {
                isJobInfoValid = 1;
            }
            else {
                const toast = new bootstrap.Toast(document.getElementById('PL_error-toast-job-info'));
                toast.show();
                window.location.hash = '#PL_UserSalarySlip';
            }


            const addressHouse = pl_form.elements['PL_UserAddressHouse'];
            const addressComplex = pl_form.elements['PL_UserAddressComplex'];
            const addressStreetLine1 = pl_form.elements['PL_UserAddressStreetLine1'];
            const addressStreetLine2 = pl_form.elements['PL_UserAddressStreetLine2'];
            const addressCity = pl_form.elements['PL_UserAddressCity'];
            const addressState = pl_form.elements['PL_userAddressState'];
            const addressPostalCode = pl_form.elements['PL_UserAddressPostalCode'];
            const addressProof = pl_form.elements['PL_UserAddressProof'];
            const addressRegex = /^[a-zA-Z0-9,/\s]{5,}$/;
            const cityRegex = /^[a-zA-Z0-9,/\s]{2,}$/;
            const postalCodeRegex = /^[0-9]{6}$/;
            let msg_adrress = '';
            if(addressHouse.value == '' || addressComplex.value == '' || addressStreetLine1.value == '' || addressStreetLine2.value == '' || addressCity.value == '' || addressState.value == '' || addressPostalCode.value == '' || addressProof.value == '')
                msg_adrress += "All fields must be filled. <br>";
            else {

                if(!addressRegex.test(addressHouse.value))
                    msg_adrress += "House address is invalid. <br>";
                if(!addressRegex.test(addressComplex.value))
                    msg_adrress += "Complex address is invalid. <br>";
                if(!addressRegex.test(addressStreetLine1.value))
                    msg_adrress += "Street Line 1 is invalid. <br>";
                if(!addressRegex.test(addressStreetLine2.value))
                    msg_adrress += "Street Line 2 is invalid. <br>";
                if(!cityRegex.test(addressCity.value))
                    msg_adrress += "City is invalid. <br>";
                if(addressState.selectedIndex == 0)
                    msg_adrress += "Please select an appropriate State. <br>";
                if(!postalCodeRegex.test(addressPostalCode.value))
                    msg_adrress += "Please enter a valid 6 digit postal code. <br>";
                if((!addressProof.files.length==0) && (addressProof.files[0].type !== acceptedFileType))
                    msg_adrress += "Please select PDf file only. <br>";
            }

            pl_errorToastMsgAddress.innerHTML = msg_adrress;

            if(msg_adrress == '') {
                isAddressValid = 1;
            }
            else {
                const toast = new bootstrap.Toast(document.getElementById('PL_error-toast-address'));
                toast.show();
                window.location.hash = '#PL_UserAddressProof';
            }



            const firstName = pl_form.elements['PL_UserFirstName'];
            const lastName = pl_form.elements['PL_UserLastName'];
            const email = pl_form.elements['PL_UserEmail'];
            const contact = pl_form.elements['PL_UserContact'];
            const religion = pl_form.elements['PL_UserReligion'];
            const age = pl_form.elements['PL_UserAge'];
            const birthDate = pl_form.elements['PL_UserBirthDate'];
            const maritalStatus = pl_form.elements['PL_UserMaritalStatus'];
            const proofOfIdentity = pl_form.elements['PL_UserProofIdentity'];
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const alphabetRegex = /^[a-zA-Z]{2,}$/;
            const contactRegex = /^[0-9]{10}$/;
            const religionRegex = /^[a-zA-Z]{4,}$/;
            const ageRegex = /^[0-9]+$/;
            let date = new Date(birthDate.value);
            let now = new Date();
            let currentYear = now.getFullYear();
            let birthYear = currentYear - Number(age.value);
            let msg = '';
            if (firstName.value == '' || lastName.value == '' || email.value == '' || contact.value == '' || religion.value == '' || maritalStatus == '' || birthDate.value == '' || age.value == '' || proofOfIdentity.value == '')
                msg += 'All fields must be filled.<br>';

            else {
                if(!alphabetRegex.test(firstName.value) || !alphabetRegex.test(lastName.value))
                msg += 'Name must be alphabets only and alteast 2 characters long. <br>';

                if(!emailRegex.test(email.value))
                    msg += "Email address is invalid. <br>";

                if(!contactRegex.test(contact.value))
                    msg += "Contact must be 10 characters long. <br>";

                if(!religionRegex.test(religion.value))
                    msg += "Religion is invalid. <br>";

                if(!(ageRegex.test(age.value)) || Number(age.value) < 23 || Number(age.value) > 62)
                    msg += "Age must be between 23 and 62. <br>";

                if(isNaN(date.getDate()))
                    msg += "Please enter a valid date. <br>";

                if(!(maritalStatus[0].checked || maritalStatus[1].checked || maritalStatus[2].checked || maritalStatus[3].checked))
                    msg += "Select a Maritial Status. <br>";

                if(proofOfIdentity.files.length == 0)
                    msg += "No File is chosen. <br>";

                if(!proofOfIdentity.files.length==0 && proofOfIdentity.files[0].type !== acceptedFileType)
                    msg += "Please select PDf file only. <br>";

                if(date.getFullYear() != birthYear) {
                    msg += "Please enter a valid date that matches your birth date. <br>";
                    let birth_date = new Date(birthDate.value);
                    let tempDate = new Date();
                    let now = new Date();
                    let currentYear = now.getFullYear();
                    let requiredYear = currentYear - Number(PLUserAgeSlider.value);
                    let day = now.getDate().toString().padStart(2, '0');
                    let month = (now.getMonth() + 1).toString().padStart(2, '0');
                    let formattedDate = requiredYear + '-' + '01' + '-' + '01';
                    birthDate.value = formattedDate;
                }
            }



                pl_errorToastMsgPersonalInfo.innerHTML = msg;
            if(msg == '') {
                isPersonalInfoValid = 1;
            }

            else {
                const toast = new bootstrap.Toast(document.getElementById('PL_error-toast-personal-info'));
                toast.show();
                window.location.hash = '#PL_UserProofIdentity';
            }


            if(isPersonalInfoValid == 1 && isAddressValid == 1 && isJobInfoValid == 1 && isFinanceInfoValid == 1 && isLoanInfoValid == 1) {
                pl_form.submit();
            }
        });
</script>



<script>
    const hl_form = document.getElementById('HL-form');
    const hl_submitBtn = document.getElementById('HL-submit-btn');
    const hl_errorToastMsgPersonalInfo = document.getElementById('HL_error-toast-msg-personal-info');
    const hl_errorToastMsgAddress = document.getElementById('HL_error-toast-msg-address');
    const hl_errorToastMsgJobInfo = document.getElementById('HL_error-toast-msg-job-info');
    const hl_errorToastMsgFinanceInfo = document.getElementById('HL_error-toast-msg-finance-info');
    const hl_errorToastMsgPropertyInfo = document.getElementById('HL_error-toast-msg-property-info');

    let isPropertyInfoValid = 0;

    hl_submitBtn.addEventListener('click', (event) => {
        event.preventDefault();

        const purchasePrice = hl_form.elements['HL_UserPurchasePrice'];
        const loanAmount = hl_form.elements['HL_UserLoanAmountRequested'];
        const currentHome = hl_form.elements['HL_UserCurrentHome'];
        const sellCurrent = hl_form.elements['HL_UserSellCurrent'];
        const mottoPurchase = hl_form.elements['HL_UserMottoPurchase'];
        const loanAmountRegex = /^[0-9]+$/;
        let msg_loan = '';

        if(purchasePrice.value == '' || loanAmount.value == '' || currentHome.value == '' || sellCurrent.value == '' || mottoPurchase.value == '')
            msg_loan += 'All fields must be filled. <br>';

        else {
            if(!loanAmountRegex.test(purchasePrice.value) || Number(purchasePrice.value) < 1000000)
                msg_loan += "Purchase Price is invalid. Minimum Purchase Price expected to be Rs. 10,00,000. <br>";
            if(!loanAmountRegex.test(loanAmount.value) || Number(loanAmount.value) < 100000 || Number(loanAmount.value) >= Number(purchasePrice.value))
            msg_loan += "Loan Amount is invalid. Minimum Loan Amount expected to be Rs. 1,00,000. <br>";
            if(!(currentHome[0].checked || currentHome[1].checked))
                msg_job += "Select an appropriate current living condition. <br>";
            if(!(sellCurrent[0].checked || sellCurrent[1].checked))
                msg_job += "Select an appropriate current house selling option. <br>";
            if(mottoPurchase.selectedIndex == 0)
                msg_loan += "Please select an appropriate Motto of Purchase. <br>";
        }

        hl_errorToastMsgPropertyInfo.innerHTML = msg_loan;

        if(msg_loan == '') {
            isPropertyInfoValid = 1;
        }
        else {
            const toast = new bootstrap.Toast(document.getElementById('HL_error-toast-property-info'));
            toast.show();
            window.location.hash = '#HL_UserMottoPurchase';
        }


        const income = hl_form.elements['HL_UserIncome'];
        const investment = hl_form.elements['HL_UserInvestment'];
        const creditCardDebt = hl_form.elements['HL_UserCreditCardDebt'];
        const bankAccountStatement = hl_form.elements['HL_UserBankAccountStatement'];
        const incomeRegex = /^[0-9]+$/;
        const acceptedFileType = 'application/pdf';
        let msg_finance = '';
        if(income.value == '' || investment.value == '' || creditCardDebt.value == '' || bankAccountStatement.value == '')
            msg_finance += 'All fields must be filled. <br>';

        else {
            if(!incomeRegex.test(income.value) || Number(income.value) < 200)
            msg_finance += 'Income is invalid. Minimum Monthly Income expected to be Rs. 200. <br>';
            if(!incomeRegex.test(investment.value) || Number(investment.value) < 0)
                msg_finance += 'Investment Amount is invalid. <br>';
            if(!incomeRegex.test(creditCardDebt.value) || Number(creditCardDebt.value) < 0)
                msg_finance += 'Credit Card Debt is invalid. <br>';
            if(!bankAccountStatement.files.length==0 && bankAccountStatement.files[0].type !== acceptedFileType)
                    msg_finance += 'Please select PDf file only. <br>';
        }

        hl_errorToastMsgFinanceInfo.innerHTML = msg_finance;

        if(msg_finance == '') {
            isFinanceInfoValid = 1;
        }
        else {
            const toast = new bootstrap.Toast(document.getElementById('HL_error-toast-finance-info'));
            toast.show();
            window.location.hash = '#HL_UserBankAccountStatement';
        }


        const companyName = hl_form.elements['HL_UserCompanyName'];
        const jobTitle = hl_form.elements['HL_UserJobTitle'];
        const employmentStatus = hl_form.elements['HL_UserEmploymentStatus'];
        const employmentPeriod = document.getElementById('PLPeriodEmployed');
        const workMode = hl_form.elements['HL_UserWorkMode'];
        const dept = hl_form.elements['HL_UserDepartment'];
        const salary = hl_form.elements['HL_UserSalary'];
        const industry = hl_form.elements['HL_UserIndustry'];
        const salarySlip = hl_form.elements['HL_UserSalarySlip'];
        const jobTitleRegex = /^[a-zA-Z\s]{2,}$/;
        const salaryRegex = /^[0-9]+$/;
        let msg_job = '';
        if(companyName.value == '' || jobTitle.value == '' || employmentStatus.value == '' || employmentPeriod.value == '' || workMode.value == '' || dept.value == '' || salary.value == '' || industry.value == '' || salarySlip.value == '')
            msg_job += "All fields must be filled. <br>";

        else {
            if(companyName.value.length < 2)
                msg_job += "Company name is invalid. <br>";
            if(!jobTitleRegex.test(jobTitle.value))
                msg_job += "Job Title is invalid. <br>";
            if(employmentStatus.selectedIndex == 0)
                msg_job += "Please select an appropriate Employment Status. <br>";
            if(!(workMode[0].checked || workMode[1].checked || workMode[2].checked))
                msg_job += "Select a Work Mode. <br>";
            if(!jobTitleRegex.test(dept.value))
                msg_job += "Department is invalid. <br>";
            if(!salaryRegex.test(salary.value) || Number(salary.value) < 2400)
                msg_job += "Salary is invalid. Minimum Salary expected to be Rs. 2,400. <br>";
            if(!jobTitleRegex.test(industry.value))
                msg_job += "Industry is invalid. <br>";
            if(!salarySlip.files.length==0 && salarySlip.files[0].type !== acceptedFileType)
                msg_job += "Please select PDf file only. <br>";
        }

        hl_errorToastMsgJobInfo.innerHTML = msg_job;

        if(msg_job == '') {
            isJobInfoValid = 1;
        }
        else {
            const toast = new bootstrap.Toast(document.getElementById('HL_error-toast-job-info'));
            toast.show();
            window.location.hash = '#HL_UserSalarySlip';
        }


        const addressHouse = hl_form.elements['HL_UserAddressHouse'];
        const addressComplex = hl_form.elements['HL_UserAddressComplex'];
        const addressStreetLine1 = hl_form.elements['HL_UserAddressStreetLine1'];
        const addressStreetLine2 = hl_form.elements['HL_UserAddressStreetLine2'];
        const addressCity = hl_form.elements['HL_UserAddressCity'];
        const addressState = hl_form.elements['HL_userAddressState'];
        const addressPostalCode = hl_form.elements['HL_UserAddressPostalCode'];
        const addressProof = hl_form.elements['HL_UserAddressProof'];
        const addressRegex = /^[a-zA-Z0-9,/\s]{5,}$/;
        const cityRegex = /^[a-zA-Z0-9,/\s]{2,}$/;
        const postalCodeRegex = /^[0-9]{6}$/;
        let msg_adrress = '';
        if(addressHouse.value == '' || addressComplex.value == '' || addressStreetLine1.value == '' || addressStreetLine2.value == '' || addressCity.value == '' || addressState.value == '' || addressPostalCode.value == '' || addressProof.value == '')
            msg_adrress += "All fields must be filled. <br>";
        else {

            if(!addressRegex.test(addressHouse.value))
                msg_adrress += "House address is invalid. <br>";
            if(!addressRegex.test(addressComplex.value))
                msg_adrress += "Complex address is invalid. <br>";
            if(!addressRegex.test(addressStreetLine1.value))
                msg_adrress += "Street Line 1 is invalid. <br>";
            if(!addressRegex.test(addressStreetLine2.value))
                msg_adrress += "Street Line 2 is invalid. <br>";
            if(!cityRegex.test(addressCity.value))
                msg_adrress += "City is invalid. <br>";
            if(addressState.selectedIndex == 0)
                msg_adrress += "Please select an appropriate State. <br>";
            if(!postalCodeRegex.test(addressPostalCode.value))
                msg_adrress += "Please enter a valid 6 digit postal code. <br>";
            if((!addressProof.files.length==0) && (addressProof.files[0].type !== acceptedFileType))
                msg_adrress += "Please select PDf file only. <br>";
        }

        hl_errorToastMsgAddress.innerHTML = msg_adrress;

        if(msg_adrress == '') {
            isAddressValid = 1;
        }
        else {
            const toast = new bootstrap.Toast(document.getElementById('HL_error-toast-address'));
            toast.show();
            window.location.hash = '#HL_UserAddressProof';
        }



        const firstName = hl_form.elements['HL_UserFirstName'];
        const lastName = hl_form.elements['HL_UserLastName'];
        const email = hl_form.elements['HL_UserEmail'];
        const contact = hl_form.elements['HL_UserContact'];
        const religion = hl_form.elements['HL_UserReligion'];
        const age = hl_form.elements['HL_UserAge'];
        const birthDate = hl_form.elements['HL_UserBirthDate'];
        const maritalStatus = hl_form.elements['HL_UserMaritalStatus'];
        const proofOfIdentity = hl_form.elements['HL_UserProofIdentity'];
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        const alphabetRegex = /^[a-zA-Z]{2,}$/;
        const contactRegex = /^[0-9]{10}$/;
        const religionRegex = /^[a-zA-Z]{4,}$/;
        const ageRegex = /^[0-9]+$/;
        let date = new Date(birthDate.value);
        let now = new Date();
        let currentYear = now.getFullYear();
        let birthYear = currentYear - Number(age.value);
        let msg = '';
        if (firstName.value == '' || lastName.value == '' || email.value == '' || contact.value == '' || religion.value == '' || maritalStatus == '' || birthDate.value == '' || age.value == '' || proofOfIdentity.value == '')
            msg += 'All fields must be filled.<br>';

        else {
            if(!alphabetRegex.test(firstName.value) || !alphabetRegex.test(lastName.value))
            msg += 'Name must be alphabets only and alteast 2 characters long. <br>';

            if(!emailRegex.test(email.value))
                msg += "Email address is invalid. <br>";

            if(!contactRegex.test(contact.value))
                msg += "Contact must be 10 characters long. <br>";

            if(!religionRegex.test(religion.value))
                msg += "Religion is invalid. <br>";

            if(!(ageRegex.test(age.value)) || Number(age.value) < 23 || Number(age.value) > 62)
                msg += "Age must be between 23 and 62. <br>";

            if(isNaN(date.getDate()))
                msg += "Please enter a valid date. <br>";

            if(!(maritalStatus[0].checked || maritalStatus[1].checked || maritalStatus[2].checked || maritalStatus[3].checked))
                msg += "Select a Maritial Status. <br>";

            if(proofOfIdentity.files.length == 0)
                msg += "No File is chosen. <br>";

            if(!proofOfIdentity.files.length==0 && proofOfIdentity.files[0].type !== acceptedFileType)
                msg += "Please select PDf file only. <br>";

            if(date.getFullYear() != birthYear) {
                    msg += "Please enter a valid date that matches your birth date. <br>";
                    let birth_date = new Date(birthDate.value);
                    let tempDate = new Date();
                    let now = new Date();
                    let currentYear = now.getFullYear();
                    let requiredYear = currentYear - Number(HLUserAgeSlider.value);
                    let day = now.getDate().toString().padStart(2, '0');
                    let month = (now.getMonth() + 1).toString().padStart(2, '0');
                    let formattedDate = requiredYear + '-' + '01' + '-' + '01';
                    birthDate.value = formattedDate;
            }

        }

            hl_errorToastMsgPersonalInfo.innerHTML = msg;
        if(msg == '') {
            isPersonalInfoValid = 1;
        }

        else {
            const toast = new bootstrap.Toast(document.getElementById('HL_error-toast-personal-info'));
            toast.show();
            window.location.hash = '#HL_UserProofIdentity';
        }

        hl_form.elements['HL_UserDownPaymentAmount_hidden'].value = document.getElementById('HL_UserDownPaymentAmount').innerHTML;
        console.log(hl_form.elements['HL_UserDownPaymentAmount_hidden'].value);

        if(isPersonalInfoValid == 1 && isAddressValid == 1 && isJobInfoValid == 1 && isFinanceInfoValid == 1 && isPropertyInfoValid == 1) {
            hl_form.submit();
        }
    });
</script>



<script>
    document.getElementById('HL_UserPurchasePrice').oninput = function() {
        let property_price = Number(document.getElementById('HL_UserPurchasePrice').value);
        let loan_amount = Number(document.getElementById('HL_UserLoanAmountRequested').value);
        let down_payment = property_price - loan_amount;
        document.getElementById('HL_UserDownPaymentAmount').innerHTML = down_payment;
        document.getElementById('HL_UserDownPaymentAmount_hidden').value = down_payment;
    }

    document.getElementById('HL_UserLoanAmountRequested').oninput = function() {
        let property_price = Number(document.getElementById('HL_UserPurchasePrice').value);
        let loan_amount = Number(document.getElementById('HL_UserLoanAmountRequested').value);
        let down_payment = property_price - loan_amount;
        document.getElementById('HL_UserDownPaymentAmount').innerHTML = down_payment;
        document.getElementById('HL_UserDownPaymentAmount_hidden').value = down_payment;
    }
</script>


<script>
    const GLemploymentPeriodSlider = document.getElementById("GLEmploymentPeriod");
    const GLemployedPeriod = document.getElementById("GLPeriodEmployed");
    const GLGoldWeight = document.getElementById("GLgoldWeight");
    const GLUserAgeSlider = document.getElementById('GL_UserAge');
    const GLAge = document.getElementById('GLAge');
    const GLbirthDate = gl_form.elements['GL_UserBirthDate'];
    window.onload = GLDefaultJob();
    GLemploymentPeriodSlider.oninput = function() {
        GLemployedPeriod.innerHTML = this.value;
    }

    GLUserAgeSlider.oninput = function() {
        GLAge.innerHTML = this.value;
        if(GLbirthDate.value != '') {
            let birth_date = new Date(GLbirthDate.value);
            let tempDate = new Date();
            let now = new Date();
            let currentYear = now.getFullYear();
            let requiredYear = currentYear - Number(GLUserAgeSlider.value);
            let day = now.getDate().toString().padStart(2, '0');
            let month = (now.getMonth() + 1).toString().padStart(2, '0');
            let formattedDate = requiredYear + '-' + '01' + '-' + '01';
            GLbirthDate.value = formattedDate;
        }
    }

    function GLDefaultJob() {
        GLemployedPeriod.innerHTML = 1;
        GLemploymentPeriodSlider.value= 1;
        GLGoldWeight.innerHTML = 1;
        GLUserAgeSlider.value = 23;
        GLAge.innerHTML = 23;
    }
</script>

<script>
    const GL_goldWeightSlider = document.getElementById("GLgoldWeightSlider");
    const GL_goldWeight = document.getElementById("GLgoldWeight");

    GL_goldWeightSlider.oninput = function() {
        GL_goldWeight.innerHTML = this.value;
    }

    function GLupdateLoanApplicationGoldWeight(amt) {
        GL_goldWeightSlider.value = amt;
        GL_goldWeight.innerHTML = amt;
    }
</script>

    <script>
        const PL_LoanTermSlider = document.getElementById("PLloanTermSlider");
        const PL_LoanTerm = document.getElementById("PLloanTerm");
        window.onload = PLDefaultJob();
        PL_LoanTermSlider.oninput = function() {
            PL_LoanTerm.innerHTML = this.value;
        }

        function PLDefaultJob() {
            PL_LoanTerm.innerHTML = 12;
            PL_LoanTermSlider.value= 12;
        }

        function PLupdateApplicationLoanTerm(amt) {
            PL_LoanTermSlider.value = amt;
            PL_LoanTerm.innerHTML = amt;
        }
    </script>

    <script>
        const PLemploymentPeriodSlider = document.getElementById("PLEmploymentPeriod");
        const PLemployedPeriod = document.getElementById("PLPeriodEmployed");
        const PLUserAgeSlider = document.getElementById('PL_UserAge');
        const PLAge = document.getElementById('PLAge');
        const PLbirthDate = pl_form.elements['PL_UserBirthDate'];
        window.onload = PLDefaultJob();
        PLemploymentPeriodSlider.oninput = function() {
            PLemployedPeriod.innerHTML = this.value;
        }

        PLUserAgeSlider.oninput = function() {
            PLAge.innerHTML = this.value;
            if(PLbirthDate.value != '') {
            let birth_date = new Date(PLbirthDate.value);
            let tempDate = new Date();
            let now = new Date();
            let currentYear = now.getFullYear();
            let requiredYear = currentYear - Number(PLUserAgeSlider.value);
            let day = now.getDate().toString().padStart(2, '0');
            let month = (now.getMonth() + 1).toString().padStart(2, '0');
            let formattedDate = requiredYear + '-' + '01' + '-' + '01';
            PLbirthDate.value = formattedDate;
        }
        }


        function PLDefaultJob() {
            PLemployedPeriod.innerHTML = 1;
            PLemploymentPeriodSlider.value= 1;
            PLUserAgeSlider.value = 23;
            PLAge.innerHTML = 23;
        }
    </script>

    <script>
        const HLemploymentPeriodSlider = document.getElementById("HLEmploymentPeriod");
        const HLemployedPeriod = document.getElementById("HLPeriodEmployed");
        const HLUserAgeSlider = document.getElementById('HL_UserAge');
        const HLAge = document.getElementById('HLAge');
        const HLdownPayment = document.getElementById('HL_UserDownPaymentAmount');
        const HLbirthDate = hl_form.elements['HL_UserBirthDate'];
        window.onload = HLDefaultJob();
        HLemploymentPeriodSlider.oninput = function() {
            HLemployedPeriod.innerHTML = this.value;
        }

        HLUserAgeSlider.oninput = function() {
            HLAge.innerHTML = this.value;
            if(HLbirthDate.value != '') {
                let birth_date = new Date(HLbirthDate.value);
                let tempDate = new Date();
                let now = new Date();
                let currentYear = now.getFullYear();
                let requiredYear = currentYear - Number(HLUserAgeSlider.value);
                let day = now.getDate().toString().padStart(2, '0');
                let month = (now.getMonth() + 1).toString().padStart(2, '0');
                let formattedDate = requiredYear + '-' + '01' + '-' + '01';
                HLbirthDate.value = formattedDate;
            }
        }

        function HLDefaultJob() {
            HLemployedPeriod.innerHTML = 1;
            HLemploymentPeriodSlider.value= 1;
            HLUserAgeSlider.value = 23;
            HLAge.innerHTML = 23;
            HLdownPayment.innerHTML = '-';
        }
    </script>


<script>
    const PLprincipalSlider= document.getElementById("PLprincipal");
    const PLinterestSlider = document.getElementById("PLinterest");
    const PLtenureSlider = document.getElementById("PLtenure");
    const PLprincipalAmt = document.getElementById("PLprincipalAmt");
    const PLinterestRate = document.getElementById("PLinterestRate");
    const PLtenureAmt = document.getElementById("PLtenureAmt");
    const PLemiAmt = document.getElementById("PLemi");
    const PLfinalInterest = document.getElementById("PLfinalInterest");
    const PLtotal_pay = document.getElementById("PLtotalPay");

    window.onload = PLdefaultAction();

    PLprincipalSlider.oninput = function() {
        PLprincipalAmt.innerHTML = this.value;
        PLemi_calculator();
    }

    PLinterestSlider.oninput = function() {
        PLinterestRate.innerHTML = this.value;
        PLemi_calculator();
    }

    PLtenureSlider.oninput = function() {
        PLtenureAmt.innerHTML = this.value;
        PLemi_calculator();
    }

    function PLupdateLoan(amt) {
        PLprincipalSlider.value = amt;
        PLprincipalAmt.innerHTML = amt;
        PLemi_calculator();
    }

    function PLupdateInterest(rate) {
        PLinterestSlider.value = rate;
        PLinterestRate.innerHTML = rate;
        PLemi_calculator();
    }

    function PLupdateTenure(amt) {
        PLtenureSlider.value = amt;
        PLtenureAmt.innerHTML = amt;
        PLemi_calculator();
    }

    function PLdefaultAction() {
        PLprincipalAmt.innerHTML = 100000;
        PLinterestRate.innerHTML = 11;
        PLtenureAmt.innerHTML = 12;
        PLemi_calculator();

    }


    function PLemi_calculator() {
        let emi;
        let i;
        let totalPay;
        let p = PLprincipalSlider.value;
        let r = PLinterestSlider.value;
        let t = PLtenureSlider.value;

        r = r / (12 * 100);
        emi = (p * r * Math.pow(1 + r, t)) / (Math.pow(1 + r, t) - 1);
        emi = Math.round(emi);

        totalPay = emi * t;
        i = totalPay - p;

        emi = emi.toLocaleString('en-IN');
        totalPay = totalPay.toLocaleString('en-IN');
        i = i.toLocaleString('en-IN');
        PLemiAmt.innerHTML = emi;
        PLfinalInterest.innerHTML = i;
        PLtotal_pay.innerHTML = totalPay;
    }

    </script>


<script>
    const GLprincipalSlider= document.getElementById("GLprincipal");
    const GLinterestSlider = document.getElementById("GLinterest");
    const GLprincipalAmt = document.getElementById("GLprincipalAmt");
    const GLinterestRate = document.getElementById("GLinterestRate");
    const GLemiAmt = document.getElementById("GLemi");
    const GLloanAmount = document.getElementById("GLloanAmount");
    const GLfinalInterest = document.getElementById("GLfinalInterest");
    const GLtotal_pay = document.getElementById("GLtotalPay");

    window.onload = GLdefaultAction();

    GLprincipalSlider.oninput = function() {
        GLprincipalAmt.innerHTML = this.value;
        GLemi_calculator();
    }

    GLinterestSlider.oninput = function() {
        GLinterestRate.innerHTML = this.value;
        GLemi_calculator();
    }

    function GLupdateLoan(amt) {
        GLprincipalSlider.value = amt;
        GLprincipalAmt.innerHTML = amt;
        GLemi_calculator();
    }

    function GLupdateInterest(rate) {
        GLinterestSlider.value = rate;
        GLinterestRate.innerHTML = rate;
        GLemi_calculator();
    }

    function GLdefaultAction() {
        GLprincipalAmt.innerHTML = 1;
        GLinterestRate.innerHTML = 11;
        GLemi_calculator();

    }


    function GLemi_calculator() {
        let emi;
        let i;
        let totalPay;
        let goldAmount = GLprincipalSlider.value;
        let r = GLinterestSlider.value;
        let t = 12;
        const rate = 4092;
        let p = goldAmount * rate;

        r = r / (12 * 100);
        emi = (p * r * Math.pow(1 + r, t)) / (Math.pow(1 + r, t) - 1);
        emi = Math.round(emi);

        totalPay = emi * t;
        i = totalPay - p;

        emi = emi.toLocaleString('en-IN');
        totalPay = totalPay.toLocaleString('en-IN');
        i = i.toLocaleString('en-IN');
        p = p.toLocaleString('en-IN')
        GLemiAmt.innerHTML = emi;
        GLfinalInterest.innerHTML = i;
        GLtotal_pay.innerHTML = totalPay;
        GLloanAmount.innerHTML = p;
    }

    </script>

    <script>
    const HLprincipalSlider= document.getElementById("HLprincipal");
    const HLinterestSlider = document.getElementById("HLinterest");
    const HLtenureSlider = document.getElementById("HLtenure");
    const HLprincipalAmt = document.getElementById("HLprincipalAmt");
    const HLinterestRate = document.getElementById("HLinterestRate");
    const HLtenureAmt = document.getElementById("HLtenureAmt");
    const HLemiAmt = document.getElementById("HLemi");
    const HLfinalInterest = document.getElementById("HLfinalInterest");
    const HLtotal_pay = document.getElementById("HLtotalPay");

    window.onload = HLdefaultAction();

    HLprincipalSlider.oninput = function() {
        HLprincipalAmt.innerHTML = this.value;
        HLemi_calculator();
    }

    HLinterestSlider.oninput = function() {
        HLinterestRate.innerHTML = this.value;
        HLemi_calculator();
    }

    HLtenureSlider.oninput = function() {
        HLtenureAmt.innerHTML = this.value;
        HLemi_calculator();
    }

    function HLupdateLoan(amt) {
        HLprincipalSlider.value = amt;
        HLprincipalAmt.innerHTML = amt;
        HLemi_calculator();
    }

    function HLupdateInterest(rate) {
        HLinterestSlider.value = rate;
        HLinterestRate.innerHTML = rate;
        HLemi_calculator();
    }

    function HLupdateTenure(amt) {
        HLtenureSlider.value = amt;
        HLtenureAmt.innerHTML = amt;
        HLemi_calculator();
    }

    function HLdefaultAction() {
        HLprincipalAmt.innerHTML = 100000;
        HLinterestRate.innerHTML = 1;
        HLtenureAmt.innerHTML = 1;
        HLemi_calculator();
    }


    function HLemi_calculator() {
        let emi;
        let i;
        let totalPay;
        let p = HLprincipalSlider.value;
        let r = HLinterestSlider.value;
        let t = HLtenureSlider.value;
        t = t * 12;
        r = r / (12 * 100);
        emi = (p * r * Math.pow(1 + r, t)) / (Math.pow(1 + r, t) - 1);
        emi = Math.round(emi);

        totalPay = emi * t;
        i = totalPay - p;

        emi = emi.toLocaleString('en-IN');
        i = i.toLocaleString('en-IN');
        totalPay = totalPay.toLocaleString('en-IN');

        HLemiAmt.innerHTML = emi;
        HLfinalInterest.innerHTML = i;
        HLtotal_pay.innerHTML = totalPay;
    }
    </script>
