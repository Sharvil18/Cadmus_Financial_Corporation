package com.bank.helpers;

public class HTML {
    public static String htmlEmailTemplate(String token, int code) {
        //Verify Account URL
        String url = "http://127.0.0.1:8070/verify?token=" + token + "&code=" + code;
        String emailTemplate = "<!DOCTYPE html>\n" +
                "<html lang='en'>\n" +
                "\n" +
                "<head>\n" +
                "    <meta charset='UTF-8'>\n" +
                "    <meta http-equiv='X-UA-Compatible' content='IE=edge'>\n" +
                "    <meta name='viewport' content='width=device-width, initial-scale=1.0'>\n" +
                "    <meta http-equiv=\"Content-Type\" content=\"text/html charset=UTF-8\" />\n" +
                "    <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n" +
                "    <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n" +
                "    <link href=\"https://fonts.googleapis.com/css2?family=Anonymous+Pro&family=BioRhyme:wght@400;700&family=Cormorant+SC:wght@300;400;500;600;700&family=Cormorant:ital,wght@0,300;0,400;0,600;0,700;1,400&family=Eczar:wght@400;600&family=Oswald:wght@200;300;500;700&family=Playfair+Display&family=Quicksand:wght@300;400;500;700&family=Roboto:wght@100;300;400;500;700&display=swap\" rel=\"stylesheet\">\n" +
                "    <title>Email Verification</title>\n" +
                "</head>\n" +
                "\n" +
                "<body style=\"font-family: 'Quicksand', sans-serif;height: 100vh;background-color: #d4d0ff;display: flex;align-items: center;justify-content: center;\">\n" +
                "    <!--Wrapper-->\n" +
                "    <div style=\"width: 650px;height: auto;padding: 15px;background-color: white;border-radius: 7px;margin: 0px auto;\">\n" +
                "        <!-- Email message header -->\n" +
                "        <h2 style=\"text-align: center;\">\n" +
                "            Welcome and Thank You for Choosing\n" +
                "        </h2>\n" +
                "        <!--End of Email message header -->\n" +
                "        <!-- Company name -->\n" +
                "        <div style=\"font-size: 37px;text-align: center;margin: 25px 0px;\">Cadmus Finance Corporation</div>\n" +
                "        <!--End of  Company name -->\n" +
                "        <hr color='black'>\n" +
                "        <!-- welcome-text -->\n" +
                "        <p style=\"text-align: center;font-size: 18px;margin: 15px 10px;\">\n" +
                "            Your account has been successfully registered; please click the link below to verify it.\n" +
                "        </p>\n" +
                "        <!--End of welcome-text -->\n" +
                "        <br>\n" +
                "        <br>\n" +
                "        <!-- Verify account button -->\n" +
                "        <center><a href='" + url +"' style=\"padding: 15px 25px;background-color: #3d34a7;text-decoration: none;color: white;border-radius: 5px;font-family: 'Roboto', sans-serif;\" role='button'>Verify Button</a></center>\n" +
                "        <!--End of Verify account button -->\n" +
                "\n" +
                "        <!-- Copyright wrapper -->\n" +
                "        <p style=\"padding: 15px;font-size: 14px;margin-top: 10px;margin-bottom: -15px;text-align: center;color: rgb(156, 156, 156);\">\n" +
                "            &copy; Copy Right 2021. All Rights Reserved.\n" +
                "        </p>\n" +
                "        <!--End of Copyright wrapper -->\n" +
                "\n" +
                "    </div>\n" +
                "    <!--End of Wrapper -->\n" +
                "</body>\n" +
                "\n" +
                "</html>";
        return emailTemplate;

    }

    public static String htmlHomeLoanApprovalTemplate(String loanType, String applicationNumber, String loanAmount, String interestRate, String tenure) {
        String url = "http://127.0.0.1:8070/confirm?loan_type=" + loanType + "&application_number=" + applicationNumber;
        String emailTemplate = "<!DOCTYPE html>\n" +
                "<html lang='en'>\n" +
                "\n" +
                "<head>\n" +
                "    <meta charset='UTF-8'>\n" +
                "    <meta http-equiv='X-UA-Compatible' content='IE=edge'>\n" +
                "    <meta name='viewport' content='width=device-width, initial-scale=1.0'>\n" +
                "    <meta http-equiv=\"Content-Type\" content=\"text/html charset=UTF-8\" />\n" +
                "    <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n" +
                "    <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n" +
                "    <link href=\"https://fonts.googleapis.com/css2?family=Anonymous+Pro&family=BioRhyme:wght@400;700&family=Cormorant+SC:wght@300;400;500;600;700&family=Cormorant:ital,wght@0,300;0,400;0,600;0,700;1,400&family=Eczar:wght@400;600&family=Oswald:wght@200;300;500;700&family=Playfair+Display&family=Quicksand:wght@300;400;500;700&family=Roboto:wght@100;300;400;500;700&display=swap\" rel=\"stylesheet\">\n" +
                "    <title>Email Verification</title>\n" +
                "</head>\n" +
                "\n" +
                "<bod style=\"font-family: 'Quicksand', sans-serif;height: 100vh;background-color: #e8cae2;display: flex;align-items: center;justify-content: center;\">\n" +
                "    <!--Wrapper-->\n" +
                "    <div style=\"width: 650px;height: auto;padding: 15px;background-color: white;border-radius: 7px;\">\n" +
                "        <!-- Email message header -->\n" +
                "        <h1 style=\"text-align: center;\">\n" +
                "            Cadmus Finance Corporation\n" +
                "        </h1>\n" +
                "        <!--End of Email message header -->\n" +
                "        <!-- Company name -->\n" +
                "        <h3 style=\"text-align: center;\">\n" +
                "            " + loanType + " Loan Application Approval \n" +
                "         </h3>\n" +
                "        <!--End of  Company name -->\n" +
                "        <hr color='black'>\n" +
                "        <!-- welcome-text -->\n" +
                "        <div style=\"text-align: center;font-size: 18px;margin: 15px 10px;\">\n" +
                "            We are delighted to inform you that your loan application " + applicationNumber + " has been approved. <br> <b> Congratulations! </b>\n" +
                "\n" +
                "            <div style=\"margin-top: 30px;\">\n" +
                "                <table style=\"border: 3px solid #481e40;margin: 0px auto;\" cellpadding=\"11\" border=\"4\">\n" +
                "                    <thead>\n" +
                "                        <tr>\n" +
                "                            <th style=\"background-color: #481e40;color: white;\">Loan Amount</th>\n" +
                "                            <th style=\"background-color: #481e40;color: white;\">Interest Rate</th>\n" +
                "                            <th style=\"background-color: #481e40;color: white;\">Tenure</th>\n" +
                "                        </tr>\n" +
                "                    </thead>\n" +
                "                        <tr style=\"background-color: white;\">\n" +
                "                            <td style=\"text-align: center;\">Rs. " + loanAmount + "</td>\n" +
                "                            <td style=\"text-align: center;\">" + interestRate + "% p.a.</td>\n" +
                "                            <td style=\"text-align: center;\">" + tenure + " years</td>\n" +
                "                        </tr>\n" +
                "                </table>\n" +
                "            </div>\n" +
                "        </div>\n" +
                "        <!--End of welcome-text -->\n" +
                "        <br>\n" +
                "        <br>\n" +
                "        <!-- Verify account button -->\n" +
                "        <div style=\"text-align: center;\">\n" +
                "            <a href='" + url + "' style=\"padding: 15px 25px;background-color: #6c2d60;text-decoration: none;color: white;border-radius: 5px;font-family: 'Roboto', sans-serif;\" role=\"button\">Confirm</a>\n" +
                "        </div>\n" +
                "        <!--End of Verify account button -->\n" +
                "\n" +
                "        <!-- Copyright wrapper -->\n" +
                "        <p style=\"padding: 15px;font-size: 14px;margin-top: 10px;margin-bottom: -15px;text-align: center;color: rgb(156, 156, 156);\">\n" +
                "            &copy; Copy Right 2021. All Rights Reserved.\n" +
                "        </p>\n" +
                "        <!--End of Copyright wrapper -->\n" +
                "\n" +
                "    </div>\n" +
                "    <!--End of Wrapper -->\n" +
                "</body>\n" +
                "\n" +
                "</html>";
        return emailTemplate;
    }

    public static String htmlPersonalLoanApprovalTemplate(String loanType, String applicationNumber, String loanAmount, String interestRate, String tenure) {
        String url = "http://127.0.0.1:8070/confirm?loan_type=" + loanType + "&application_number=" + applicationNumber;
        String emailTemplate = "<!DOCTYPE html>\n" +
                "<html lang='en'>\n" +
                "\n" +
                "<head>\n" +
                "    <meta charset='UTF-8'>\n" +
                "    <meta http-equiv='X-UA-Compatible' content='IE=edge'>\n" +
                "    <meta name='viewport' content='width=device-width, initial-scale=1.0'>\n" +
                "    <meta http-equiv=\"Content-Type\" content=\"text/html charset=UTF-8\" />\n" +
                "    <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n" +
                "    <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n" +
                "    <link href=\"https://fonts.googleapis.com/css2?family=Anonymous+Pro&family=BioRhyme:wght@400;700&family=Cormorant+SC:wght@300;400;500;600;700&family=Cormorant:ital,wght@0,300;0,400;0,600;0,700;1,400&family=Eczar:wght@400;600&family=Oswald:wght@200;300;500;700&family=Playfair+Display&family=Quicksand:wght@300;400;500;700&family=Roboto:wght@100;300;400;500;700&display=swap\" rel=\"stylesheet\">\n" +
                "    <title>Email Verification</title>\n" +
                "</head>\n" +
                "\n" +
                "<bod style=\"font-family: 'Quicksand', sans-serif;height: 100vh;background-color: #e8cae2;display: flex;align-items: center;justify-content: center;\">\n" +
                "    <!--Wrapper-->\n" +
                "    <div style=\"width: 650px;height: auto;padding: 15px;background-color: white;border-radius: 7px;\">\n" +
                "        <!-- Email message header -->\n" +
                "        <h1 style=\"text-align: center;\">\n" +
                "            Cadmus Finance Corporation\n" +
                "        </h1>\n" +
                "        <!--End of Email message header -->\n" +
                "        <!-- Company name -->\n" +
                "        <h3 style=\"text-align: center;\">\n" +
                "            " + loanType + " Loan Application Approval \n" +
                "         </h3>\n" +
                "        <!--End of  Company name -->\n" +
                "        <hr color='black'>\n" +
                "        <!-- welcome-text -->\n" +
                "        <div style=\"text-align: center;font-size: 18px;margin: 15px 10px;\">\n" +
                "            We are delighted to inform you that your loan application " + applicationNumber + " has been approved. <br> <b> Congratulations! </b>\n" +
                "\n" +
                "            <div style=\"margin-top: 30px;\">\n" +
                "                <table style=\"border: 3px solid #481e40;margin: 0px auto;\" cellpadding=\"11\" border=\"4\">\n" +
                "                    <thead>\n" +
                "                        <tr>\n" +
                "                            <th style=\"background-color: #481e40;color: white;\">Loan Amount</th>\n" +
                "                            <th style=\"background-color: #481e40;color: white;\">Interest Rate</th>\n" +
                "                            <th style=\"background-color: #481e40;color: white;\">Tenure</th>\n" +
                "                        </tr>\n" +
                "                    </thead>\n" +
                "                        <tr style=\"background-color: white;\">\n" +
                "                            <td style=\"text-align: center;\">Rs. " + loanAmount + "</td>\n" +
                "                            <td style=\"text-align: center;\">" + interestRate + "% p.a.</td>\n" +
                "                            <td style=\"text-align: center;\">" + tenure + " months</td>\n" +
                "                        </tr>\n" +
                "                </table>\n" +
                "            </div>\n" +
                "        </div>\n" +
                "        <!--End of welcome-text -->\n" +
                "        <br>\n" +
                "        <br>\n" +
                "        <!-- Verify account button -->\n" +
                "        <div style=\"text-align: center;\">\n" +
                "            <a href='" + url + "' style=\"padding: 15px 25px;background-color: #6c2d60;text-decoration: none;color: white;border-radius: 5px;font-family: 'Roboto', sans-serif;\" role=\"button\">Confirm</a>\n" +
                "        </div>\n" +
                "        <!--End of Verify account button -->\n" +
                "\n" +
                "        <!-- Copyright wrapper -->\n" +
                "        <p style=\"padding: 15px;font-size: 14px;margin-top: 10px;margin-bottom: -15px;text-align: center;color: rgb(156, 156, 156);\">\n" +
                "            &copy; Copy Right 2021. All Rights Reserved.\n" +
                "        </p>\n" +
                "        <!--End of Copyright wrapper -->\n" +
                "\n" +
                "    </div>\n" +
                "    <!--End of Wrapper -->\n" +
                "</body>\n" +
                "\n" +
                "</html>";
        return emailTemplate;
    }

    public static String htmlGoldLoanApprovalTemplate(String loanType, String applicationNumber, String goldWeight, String interestRate, double loanAmount) {
        String url = "http://127.0.0.1:8070/confirm?loan_type=" + loanType + "&application_number=" + applicationNumber;
        String emailTemplate = "<!DOCTYPE html>\n" +
                "<html lang='en'>\n" +
                "\n" +
                "<head>\n" +
                "    <meta charset='UTF-8'>\n" +
                "    <meta http-equiv='X-UA-Compatible' content='IE=edge'>\n" +
                "    <meta name='viewport' content='width=device-width, initial-scale=1.0'>\n" +
                "    <meta http-equiv=\"Content-Type\" content=\"text/html charset=UTF-8\" />\n" +
                "    <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n" +
                "    <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n" +
                "    <link href=\"https://fonts.googleapis.com/css2?family=Anonymous+Pro&family=BioRhyme:wght@400;700&family=Cormorant+SC:wght@300;400;500;600;700&family=Cormorant:ital,wght@0,300;0,400;0,600;0,700;1,400&family=Eczar:wght@400;600&family=Oswald:wght@200;300;500;700&family=Playfair+Display&family=Quicksand:wght@300;400;500;700&family=Roboto:wght@100;300;400;500;700&display=swap\" rel=\"stylesheet\">\n" +
                "    <title>Email Verification</title>\n" +
                "</head>\n" +
                "\n" +
                "<bod style=\"font-family: 'Quicksand', sans-serif;height: 100vh;background-color: #e8cae2;display: flex;align-items: center;justify-content: center;\">\n" +
                "    <!--Wrapper-->\n" +
                "    <div style=\"width: 650px;height: auto;padding: 15px;background-color: white;border-radius: 7px;\">\n" +
                "        <!-- Email message header -->\n" +
                "        <h1 style=\"text-align: center;\">\n" +
                "            Cadmus Finance Corporation\n" +
                "        </h1>\n" +
                "        <!--End of Email message header -->\n" +
                "        <!-- Company name -->\n" +
                "        <h3 style=\"text-align: center;\">\n" +
                "            " + loanType + " Loan Application Approval \n" +
                "         </h3>\n" +
                "        <!--End of  Company name -->\n" +
                "        <hr color='black'>\n" +
                "        <!-- welcome-text -->\n" +
                "        <div style=\"text-align: center;font-size: 18px;margin: 15px 10px;\">\n" +
                "            We are delighted to inform you that your loan application " + applicationNumber + " has been approved. <br> <b> Congratulations! </b>\n" +
                "\n" +
                "            <div style=\"margin-top: 30px;\">\n" +
                "                <table style=\"border: 3px solid #481e40;margin: 0px auto;\" cellpadding=\"11\" border=\"4\">\n" +
                "                    <thead>\n" +
                "                        <tr>\n" +
                "                            <th style=\"background-color: #481e40;color: white;\">Gold Weight</th>\n" +
                "                            <th style=\"background-color: #481e40;color: white;\">Loan Amount</th>\n" +
                "                            <th style=\"background-color: #481e40;color: white;\">Interest Rate</th>\n" +
                "                        </tr>\n" +
                "                    </thead>\n" +
                "                        <tr style=\"background-color: white;\">\n" +
                "                            <td style=\"text-align: center;\">" + goldWeight + " gram</td>\n" +
                "                            <td style=\"text-align: center;\">Rs. " + String.valueOf(loanAmount) + "</td>\n" +
                "                            <td style=\"text-align: center;\">" + interestRate + " % p.a.</td>\n" +
                "                        </tr>\n" +
                "                </table>\n" +
                "            </div>\n" +
                "        </div>\n" +
                "        <!--End of welcome-text -->\n" +
                "        <br>\n" +
                "        <br>\n" +
                "        <!-- Verify account button -->\n" +
                "        <div style=\"text-align: center;\">\n" +
                "            <a href='" + url + "' style=\"padding: 15px 25px;background-color: #6c2d60;text-decoration: none;color: white;border-radius: 5px;font-family: 'Roboto', sans-serif;\" role=\"button\">Confirm</a>\n" +
                "        </div>\n" +
                "        <!--End of Verify account button -->\n" +
                "\n" +
                "        <!-- Copyright wrapper -->\n" +
                "        <p style=\"padding: 15px;font-size: 14px;margin-top: 10px;margin-bottom: -15px;text-align: center;color: rgb(156, 156, 156);\">\n" +
                "            &copy; Copy Right 2021. All Rights Reserved.\n" +
                "        </p>\n" +
                "        <!--End of Copyright wrapper -->\n" +
                "\n" +
                "    </div>\n" +
                "    <!--End of Wrapper -->\n" +
                "</body>\n" +
                "\n" +
                "</html>";
        return emailTemplate;
    }

    public static String insufficientBalance(String name, String loanType, String applicationNumber, double penaltyAmount, double totalAmountPayable) {
        String emailTemplate = "<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n" +
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "    <title>Document</title>\n" +
                "</head>\n" +
                "<body style=\"font-family: 'Quicksand', sans-serif;\">\n" +
                "    <div style=\"text-align: center; width: 60%;margin: auto;\">\n" +
                "        <p style=\"text-align: left;\">Dear " + name + ",</p>\n" +
                "    <p>We hope this email finds you in good health.</p>  \n" +
                "    <p>We're writing to notify you of a recent loan payment attempt on your " + loanType + " with application number " + applicationNumber + " . \n" +
                "        Unfortunately, your account did not have enough funds to cover the scheduled Equated Monthly Installment (EMI).  As a result, a penalty has been applied to your \n" +
                "        outstanding loan amount.</p>\n" +
                "    <p>We understand that unforeseen circumstances can occur, leading to temporary financial difficulties. However, it is crucial to ensure that sufficient \n" +
                "        funds are available at the time of the next EMI to avoid further penalties and potential consequences.</p>\n" +
                "    <h4 style=\"text-align: left;\">Penalty Details:</h4>\n" +
                "    <ul type=\"disc\" style=\"text-align: left;\">\n" +
                "        <li>Loan Application Number: " + applicationNumber + "</li>\n" +
                "        <li>Penalty Amount: " + penaltyAmount + "</li>\n" +
                "        <li>New Total Amount Payable: " + totalAmountPayable + "</li>\n" +
                "    </ul>\n" +
                "    <br>\n" +
                "    <p>\n" +
                "        To rectify the situation, we kindly request that you make the necessary arrangements to ensure your account maintains sufficient funds before the next EMI payment date.\n" +
                "    </p>\n" +
                "    <br>\n" +
                "    <p style=\"text-align: left;\">Best Regards, <br> Cadmus Financial Corporation.</p>\n" +
                "    </div>\n" +
                "</body>\n" +
                "</html>";
        return emailTemplate;
    }
}
