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
                "    <title>Email Verification</title>\n" +
                "    <style>\n" +
                "        /* Font styles */\n" +
                "        @import url('https://fonts.googleapis.com/css2?family=Anonymous+Pro&family=BioRhyme:wght@400;700&family=Cormorant+SC:wght@300;400;500;600;700&family=Cormorant:ital,wght@0,300;0,400;0,600;0,700;1,400&family=Eczar:wght@400;600&family=Oswald:wght@200;300;500;700&family=Playfair+Display&family=Quicksand:wght@300;400;500;700&family=Roboto:wght@100;300;400;500;700&display=swap');\n" +
                "\n" +
                "        * {\n" +
                "            box-sizing: border-box;\n" +
                "            font-family: 'Quicksand', sans-serif;\n" +
                "        }\n" +
                "\n" +
                "        /* Main Body Styling */\n" +
                "        body {\n" +
                "            height: 100vh;\n" +
                "            background-color: #d4d0ff;\n" +
                "            display: flex;\n" +
                "            align-items: center;\n" +
                "            justify-content: center;\n" +
                "        }\n" +
                "\n" +
                "        /* Wrapper */\n" +
                "        .wrapper {\n" +
                "            width: 650px;\n" +
                "            height: auto;\n" +
                "            padding: 15px;\n" +
                "            background-color: white;\n" +
                "            border-radius: 7px;\n" +
                "        }\n" +
                "\n" +
                "        /* Email message header */\n" +
                "        .email-msg-header {\n" +
                "            text-align: center;\n" +
                "        }\n" +
                "\n" +
                "        /* Company name */\n" +
                "        .company-name {\n" +
                "            font-size: 37px;\n" +
                "            text-align: center;\n" +
                "            margin: 25px 0px;\n" +
                "        }\n" +
                "\n" +
                "        /* Welcome text */\n" +
                "        .welcome-text {\n" +
                "            text-align: center;\n" +
                "            font-size: 18px;\n" +
                "            margin: 15px 10px;\n" +
                "        }\n" +
                "\n" +
                "        /* Verify account button */\n" +
                "        .verify-account-btn {\n" +
                "            padding: 15px 25px;\n" +
                "            background-color: #3d34a7;\n" +
                "            text-decoration: none;\n" +
                "            color: white;\n" +
                "            border-radius: 5px;\n" +
                "            font-family: 'Roboto', sans-serif;\n" +
                "        }\n" +
                "\n" +
                "        /* Copyright wrapper */\n" +
                "        .copy-right {\n" +
                "            padding: 15px;\n" +
                "            font-size: 14px;\n" +
                "            margin-top: 10px;\n" +
                "            margin-bottom: -15px;\n" +
                "            display: flex;\n" +
                "            justify-content: center;\n" +
                "            color: rgb(156, 156, 156);\n" +
                "\n" +
                "        }\n" +
                "    </style>\n" +
                "</head>\n" +
                "\n" +
                "<body>\n" +
                "    <!--Wrapper-->\n" +
                "    <div class='wrapper'>\n" +
                "        <!-- Email message header -->\n" +
                "        <h2 class='email-msg-header'>\n" +
                "            Welcome and Thank You for Choosing\n" +
                "        </h2>\n" +
                "        <!--End of Email message header -->\n" +
                "        <!-- Company name -->\n" +
                "        <div class='company-name'>Cadmus Finance Corporation</div>\n" +
                "        <!--End of  Company name -->\n" +
                "        <hr color='black'>\n" +
                "        <!-- welcome-text -->\n" +
                "        <p class='welcome-text'>\n" +
                "            Your account has been successfully registered<br>Please click the link below to verify it.\n" +
                "        </p>\n" +
                "        <!--End of welcome-text -->\n" +
                "        <br>\n" +
                "        <br>\n" +
                "        <!-- Verify account button -->\n" +
                "        <center><a href='" + url + "' class='verify-account-btn' role='button'>Verify Account</a></center>\n" +
                "        <!--End of Verify account button -->\n" +
                "\n" +
                "        <!-- Copyright wrapper -->\n" +
                "        <div class='copy-right'>\n" +
                "            &copy; Copy Right 2021. All Rights Reserved.\n" +
                "        </div>\n" +
                "        <!--End of Copyright wrapper -->\n" +
                "\n" +
                "    </div>\n" +
                "    <!--End of Wrapper -->\n" +
                "</body>\n" +
                "\n" +
                "</html>";
        return emailTemplate;

    }
}
