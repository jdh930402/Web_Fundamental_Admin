package kr.co.kic.dev1.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Utility {
	
	public static String getConvert(String msg) {
		return msg.replaceAll("\n", "<br>").replaceAll(">", "&gt;").replaceAll("<", "&lt;");
	}
	
	public static String getDate(Calendar calendar, String pattern) {
		return new SimpleDateFormat(pattern).format(calendar.getTime());
	}

}
