package com.bank.helpers;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;

public class DateFormatter {
    public static String formatLocalDateTime(LocalDateTime localDateTime, String pattern) {
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofLocalizedDate(FormatStyle.FULL);
        String formattedDateTime = localDateTime.format(dateTimeFormatter);
        return formattedDateTime;
    }

    public static String getFormattedDate(LocalDateTime localDateTime) {
        String pattern = "yyyy/MM/dd";
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern(pattern);
        String dateFormat = localDateTime.format(dateFormatter);
        return dateFormat;
    }

    public static String getFormattedTime(LocalDateTime localDateTime) {
        String pattern = "HH:mm:ss";
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern(pattern);
        String timeFormat = localDateTime.format(timeFormatter);
        return timeFormat;
    }
}
