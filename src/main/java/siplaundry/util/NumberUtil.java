package siplaundry.util;

import java.util.Random;

public class NumberUtil {
    public static String formatDec(int val) {
        return String.format("%,d", val).replace(',', '.');
    }

    public static String generateCode() {
        return String.format("%06d", new Random().nextInt(999999));
    }

    public static String maskPhoneNumber(String phoneNumber) {
        if (phoneNumber.length() <= 4) {
            return phoneNumber;
        }

        String frontDigits = phoneNumber.substring(0, 2);
        String endDigits = phoneNumber.substring(phoneNumber.length() - 2);
        String middleStars = "*".repeat(phoneNumber.length() - 4);

        return frontDigits + middleStars + endDigits;
    }
}
