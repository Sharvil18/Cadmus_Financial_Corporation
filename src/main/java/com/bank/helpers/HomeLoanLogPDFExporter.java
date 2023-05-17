package com.bank.helpers;

import com.bank.models.HomeLoanApplication;
import com.bank.models.LoanLog;
import com.lowagie.text.*;
import com.lowagie.text.Font;
import com.lowagie.text.pdf.PdfCell;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import jakarta.servlet.http.HttpServletResponse;

import java.awt.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

public class HomeLoanLogPDFExporter {

    private HomeLoanApplication homeLoanApplication;
    private LoanLog loanLog;

    public HomeLoanLogPDFExporter(HomeLoanApplication homeLoanApplication, LoanLog loanLog) {
        this.homeLoanApplication = homeLoanApplication;
        this.loanLog = loanLog;
    }

    public byte[] export() throws DocumentException, IOException {
        Document document = new Document(PageSize.A4);
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, outputStream);

        document.open();
        Font font = FontFactory.getFont(FontFactory.TIMES_BOLD);
        font.setSize(20);
        font.setColor(new Color(72, 30, 64));

        Paragraph p = new Paragraph("Home Loan Information", font);
        p.setAlignment(Paragraph.ALIGN_CENTER);

        document.add(p);
        addContent(document);
        document.close();

        return outputStream.toByteArray();
    }

    private void addContent(Document document) throws DocumentException {

        //Get client information
        String name = homeLoanApplication.getFirst_name() + " " + homeLoanApplication.getLast_name();
        String applicationNumber = homeLoanApplication.getApplication_number();
        String email = homeLoanApplication.getEmail();
        String contact = homeLoanApplication.getContact();
        String age = String.valueOf(homeLoanApplication.getAge());
        String birthDate = String.valueOf(homeLoanApplication.getBirth_date());
        String address = homeLoanApplication.getAddress_house() + ", " + homeLoanApplication.getAddress_complex() + ", \n" +
                homeLoanApplication.getAddress_street_line1() + ", " + homeLoanApplication.getAddress_street_line2() + ".";
        String city = homeLoanApplication.getAddress_city();
        String state = homeLoanApplication.getAddress_state();
        // Add client information
        Paragraph customerInfo = new Paragraph();
        customerInfo.add(new Phrase("Name: " + name + "\n"));
        customerInfo.add(new Phrase("Application Number: " + applicationNumber + "\n"));
        customerInfo.add(new Phrase("Email: " + email + "\n"));
        customerInfo.add(new Phrase("Contact: " + contact + "\n"));
        customerInfo.add(new Phrase("Age: " + age + "\n"));
        customerInfo.add(new Phrase("Birth Date: " + birthDate + "\n"));
        customerInfo.add(new Phrase("Address: " + address + "\n"));
        customerInfo.add(new Phrase("City: " + city + "\n"));
        customerInfo.add(new Phrase("State: " + state + "\n"));
        document.add(customerInfo);

        PdfPCell columTitle = new PdfPCell();
        columTitle.setBackgroundColor(new Color(72, 30, 64));
        columTitle.setPadding(5);
        columTitle.setVerticalAlignment(Paragraph.ALIGN_MIDDLE);
        columTitle.setHorizontalAlignment(Paragraph.ALIGN_CENTER);

        Font font = FontFactory.getFont(FontFactory.TIMES_BOLD, 14);
        font.setColor(Color.WHITE);

        PdfPCell valuesCell = new PdfPCell();
        valuesCell.setHorizontalAlignment(Element.ALIGN_LEFT);

        // Add loan log details
        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(100);
        table.setWidths(new float[]{75, 25});
        table.setSpacingBefore(15);

        // Add table headers
        columTitle.setPhrase(new Phrase("Particulars", font));
        table.addCell(columTitle);

        columTitle.setPhrase(new Phrase("Values", font));
        table.addCell(columTitle);

        // Add table rows
        table.addCell("Loan Amount (A)");
        valuesCell.setPhrase(new Phrase("Rs. " + loanLog.getFinal_loan_amount()));
        table.addCell(valuesCell);

        table.addCell("Interest Rate");
        valuesCell.setPhrase(new Phrase(loanLog.getFinal_interest_rate() + "%"));
        table.addCell(valuesCell);

        table.addCell("Tenure");
        valuesCell.setPhrase(new Phrase(loanLog.getFinal_tenure() + " months"));
        table.addCell(valuesCell);

        table.addCell("EMI");
        valuesCell.setPhrase(new Phrase("Rs. " + loanLog.getFinal_emi()));
        table.addCell(valuesCell);

        table.addCell("Interest Payable (B)");
        valuesCell.setPhrase(new Phrase("Rs. " + loanLog.getTotal_interest_payable()));
        table.addCell(valuesCell);

        table.addCell("Late Payment Penalty");
        valuesCell.setPhrase(new Phrase("Rs. " + loanLog.getLate_payment_penalty()));
        table.addCell(valuesCell);

        table.addCell("Pre Payment Penalty");
        valuesCell.setPhrase(new Phrase("Rs. " + loanLog.getPre_payment_penalty()));
        table.addCell(valuesCell);


        table.addCell("Amount Payable (C = A + B)");
        valuesCell.setPhrase(new Phrase("Rs. " + loanLog.getTotal_amount_payable()));
        table.addCell(valuesCell);

        table.addCell("Charges Payable (D)");
        valuesCell.setPhrase(new Phrase("Rs. " + loanLog.getCharges_payable()));
        table.addCell(valuesCell);

        PdfPCell yellowRowCell = new PdfPCell(new Phrase("Grand Total (E = C + D)", FontFactory.getFont(FontFactory.HELVETICA_BOLD)));
        yellowRowCell.setBackgroundColor(Color.YELLOW);
        table.addCell(yellowRowCell);

        double grantTotal = loanLog.getTotal_amount_payable() + loanLog.getCharges_payable();
        PdfPCell totalAmountCell = new PdfPCell(new Phrase("Rs. " + grantTotal, FontFactory.getFont(FontFactory.HELVETICA_BOLD)));
        totalAmountCell.setBackgroundColor(Color.YELLOW);
        table.addCell(totalAmountCell);


        document.add(table);
    }

}
