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
                "<bod style=\"font-family: 'Quicksand', sans-serif;height: 100vh;background-color: #d4d0ff;display: flex;align-items: center;justify-content: center;\">\n" +
                "    <!--Wrapper-->\n" +
                "    <div style=\"width: 650px;height: auto;padding: 15px;background-color: white;border-radius: 7px;\">\n" +
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
}
