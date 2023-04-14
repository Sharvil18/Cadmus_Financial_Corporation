package com.bank.helpers;

import com.bank.models.PaymentHistory;
import com.bank.models.TransactionHistory;
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

public class TransactionHistoryPDFExporter {
    private List<TransactionHistory> transactionHistoryList;
    public TransactionHistoryPDFExporter(List<TransactionHistory> transactionHistoryList) {
        this.transactionHistoryList = transactionHistoryList;
    }

    private void writeTableHeader(PdfPTable table) {
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(new Color(65, 58, 146));
        cell.setPadding(5);
        cell.setVerticalAlignment(Paragraph.ALIGN_MIDDLE);
        cell.setHorizontalAlignment(Paragraph.ALIGN_CENTER);

        com.lowagie.text.Font font = FontFactory.getFont(FontFactory.TIMES_BOLD, 14);
        font.setColor(Color.WHITE);

        cell.setPhrase(new Phrase("Transaction ID", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Transaction Type", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Amount", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Source", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Status", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Reason Code", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Date", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Time", font));
        table.addCell(cell);
    }

    private void writeTableData(PdfPTable table) {

        PdfPCell cell = new PdfPCell();
        cell.setPadding(5);
        cell.setVerticalAlignment(Paragraph.ALIGN_MIDDLE);
        cell.setHorizontalAlignment(Paragraph.ALIGN_CENTER);
        com.lowagie.text.Font font = FontFactory.getFont(FontFactory.COURIER, 11);
        for(TransactionHistory transactionHistory : transactionHistoryList) {
            cell.setPhrase(new Phrase(String.valueOf(transactionHistory.getTransaction_id()), font));
            table.addCell(cell);

            cell.setPhrase(new Phrase(transactionHistory.getTransaction_type(), font));
            table.addCell(cell);

            cell.setPhrase(new Phrase(String.valueOf(transactionHistory.getAmount()), font));
            table.addCell(cell);

            cell.setPhrase(new Phrase(transactionHistory.getSource(), font));
            table.addCell(cell);

            cell.setPhrase(new Phrase(transactionHistory.getStatus(), font));
            table.addCell(cell);

            cell.setPhrase(new Phrase(transactionHistory.getReason_code(), font));
            table.addCell(cell);

            LocalDateTime localDateTime = transactionHistory.getCreated_at();

            cell.setPhrase(new Phrase(DateFormatter.getFormattedDate(localDateTime), font));
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

        Paragraph p = new Paragraph("Transaction History", font);
        p.setAlignment(Paragraph.ALIGN_CENTER);

        document.add(p);

        PdfPTable table = new PdfPTable(8);
        table.setWidthPercentage(100f);
        table.setWidths(new float[] {6.0f, 6.0f, 5.0f, 5.0f, 5.0f, 9.0f, 6.0f, 6.0f});
        table.setSpacingBefore(15);

        writeTableHeader(table);
        writeTableData(table);
        document.add(table);
        document.close();
    }
}
