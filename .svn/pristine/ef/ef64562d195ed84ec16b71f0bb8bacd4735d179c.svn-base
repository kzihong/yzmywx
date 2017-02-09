package cn.easycode.yzmywx.utils;

import java.util.Date;
import java.util.UUID;

public class OrderUtil {

	public static String getUUID(){
		String uuid = UUID.randomUUID().toString();
		return uuid.substring(0, 8) + uuid.substring(9, 13) + uuid.substring(14, 18) + uuid.substring(19, 23) + uuid.substring(24);
	}
	
	public static String getSn(){
		int randomNumber = (int)(Math.random()*100);
		Long time = new Date().getTime()*100+randomNumber;
		return time+"";
	}
}
