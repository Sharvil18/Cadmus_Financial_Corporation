package com.bank.helpers;

import com.bank.models.PaymentHistory;
import com.bank.models.User;
import com.lowagie.text.*;
import com.lowagie.text.Font;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import jakarta.servlet.http.HttpServletResponse;

import java.awt.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

public class PaymentHistoryPDFExporter {
    private List<PaymentHistory> paymentHistoryList;
    public PaymentHistoryPDFExporter(List<PaymentHistory> paymentHistoryList) {
        this.paymentHistoryList = paymentHistoryList;
    }

    private void writeTableHeader(PdfPTable table) {
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(new Color(65, 58, 146));
        cell.setPadding(5);
        cell.setVerticalAlignment(Paragraph.ALIGN_MIDDLE);
        cell.setHorizontalAlignment(Paragraph.ALIGN_CENTER);

        Font font = FontFactory.getFont(FontFactory.TIMES_BOLD, 14);
        font.setColor(Color.WHITE);

        cell.setPhrase(new Phrase("Record No.", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Date", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Beneficiary", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Beneficiary Acc No.", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Amount", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Status", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Reference", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Reason Code", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Time", font));
        table.addCell(cell);
    }

    private void writeTableData(PdfPTable table) {

        PdfPCell cell = new PdfPCell();
        cell.setPadding(5);
        cell.setVerticalAlignment(Paragraph.ALIGN_MIDDLE);
        cell.setHorizontalAlignment(Paragraph.ALIGN_CENTER);
        Font font = FontFactory.getFont(FontFactory.COURIER, 11);
        for(PaymentHistory paymentHistory : paymentHistoryList) {
            LocalDateTime localDateTime = paymentHistory.getCreated_at();

            cell.setPhrase(new Phrase(String.valueOf(paymentHistory.getPayment_id()), font));
            table.addCell(cell);

            cell.setPhrase(new Phrase(DateFormatter.getFormattedDate(localDateTime), font));
            table.addCell(cell);

            cell.setPhrase(new Phrase(paymentHistory.getBeneficiary(), font));
            table.addCell(cell);

            cell.setPhrase(new Phrase(paymentHistory.getBeneficiary_acc_no(), font));
            table.addCell(cell);

            cell.setPhrase(new Phrase(String.valueOf(paymentHistory.getAmount()), font));
            table.addCell(cell);

            cell.setPhrase(new Phrase(paymentHistory.getStatus(), font));
            table.addCell(cell);

            cell.setPhrase(new Phrase(paymentHistory.getReference_no(), font));
            table.addCell(cell);

            cell.setPhrase(new Phrase(paymentHistory.getReason_code(), font));
            table.addCell(cell);

            cell.setPhrase(new Phrase(DateFormatter.getFormattedTime(localDateTime), font));
            table.addCell(cell);
        }

    }

    public void export(HttpServletResponse response) throws DocumentException, IOException {
        Document document = new Document(PageSize.A3);
        PdfWriter.getInstance(document, response.getOutputStream());

        document.open();
        Font font = FontFactory.getFont(FontFactory.TIMES_BOLD);
        font.setSize(20);
        font.setColor(new Color(41, 36, 91));

        Paragraph p = new Paragraph("Payment History", font);
        p.setAlignment(Paragraph.ALIGN_CENTER);

        document.add(p);

        PdfPTable table = new PdfPTable(9);
        table.setWidthPercentage(100f);
        table.setWidths(new float[] {4.5f, 6.0f, 6.0f, 7.0f, 4.5f, 4.5f, 7.0f, 9.0f, 6.0f});
        table.setSpacingBefore(15);

        writeTableHeader(table);
        writeTableData(table);
        document.add(table);
        document.close();
    }
}
