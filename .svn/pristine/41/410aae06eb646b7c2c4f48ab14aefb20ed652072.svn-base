package cn.easycode.yzmywx.utils;



import java.io.BufferedReader;

import javax.servlet.http.HttpServletRequest;

public class GetJsonStringFromRequest {
	/**
	 * 
	 * @param request
	 * @return String 从request得到json数据
	 * @throws Exception
	 */
	public static String getJsonString(HttpServletRequest request) throws Exception{
		String acceptjson = "";
		BufferedReader br = request.getReader();
		StringBuffer sb = new StringBuffer("");
		String temp;
		while ((temp = br.readLine()) != null) {
			sb.append(temp);
		}
		br.close();
		acceptjson = sb.toString();
		
		return acceptjson;
	}
}
