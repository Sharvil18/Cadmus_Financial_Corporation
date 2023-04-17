package com.bank.helpers;

import java.math.BigInteger;
import java.util.Random;
import java.util.UUID;

public class GenerateAccountNumber {
    public static String generateAccountNumber() {
        String UUIDNum = String.format("%010d", new BigInteger(UUID.randomUUID().toString().replace("-",""), 16));
        String accNum = UUIDNum.substring( UUIDNum.length() - 10);
        return accNum;
    }
}
