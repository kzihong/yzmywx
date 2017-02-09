package cn.easycode.yzmywx.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {


	public static String dateToString(Date date, String pattern) {
		if (date != null) {
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			return sdf.format(date);
		}
		return "";
	}

	public static String dateToString(Date date) {
		return dateToString(date, "yyyy-MM-dd HH:mm:ss");
	}

	public static Date stringToDate(String dateString, String pattern) {
		if (dateString != null) {
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			try {
				return sdf.parse(dateString);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public static Date stringToDate(String dateString){
		return stringToDate(dateString, "yyyy-MM-dd HH:mm");
	}
	
	public static String millisToDateTime(Long millis){
		String result = "";
		long date = millis / (3600 * 12 * 1000);
		if(millis > 0){
			result += date + "天";
			
			millis = millis - date * (3600 * 12 * 1000);
		}
		long hour =  millis / (3600 * 1000);
		if(hour > 0){
			result += hour + "小时";
			
			millis = millis - hour * (3600 * 1000);
		}
		long minute =  millis / (60  * 1000);
		if(minute > 0){
			result += minute + "分";
			
			millis = millis - minute * (60  * 1000);
		}
		long second =  millis / (1  * 1000);
		if(second > 0){
			result += second + "秒";
		}
		return result;
	}
	
	public static String millisToDateTime(int milli){
		long millis = milli*1000L;
		Date d = new Date(millis);
		return dateToString(d, "yyyy-MM-dd HH:mm:ss");
	}
	
	public static String LongmillisToDateTime(Long milli){
		Date d = new Date();
		return dateToString(d, "yyyy-MM-dd HH:mm");
	}
}
