package cn.easycode.yzmywx.utils;

import java.io.BufferedReader;
import java.io.IOException; 
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.security.MessageDigest; 

public class ShipUtil {
	
	//����ID
	private static String EBusinessID="1256365";	
	//���̼���˽Կ��������ṩ��ע�Ᵽ�ܣ���Ҫй©
	private static String AppKey="657ec4aa-8bb7-4ad4-b6d2-beb3f81da9c5";	
	//����url
	private static String ReqURL="http://api.kdniao.cc/Ebusiness/EbusinessOrderHandle.aspx";	
 
	/**
     * Json��ʽ ��ѯ���������켣
	 * @throws Exception 
     */
	public static String getOrderTracesByJson(String requestData) throws Exception{
		Map<String, String> params = new HashMap<String, String>();
		params.put("RequestData", urlEncoder(requestData, "UTF-8"));
		params.put("EBusinessID", EBusinessID);
		params.put("RequestType", "1002");
		String dataSign=encrypt(requestData, AppKey, "UTF-8");
		params.put("DataSign", urlEncoder(dataSign, "UTF-8"));
		params.put("DataType", "2");
		
		String result=sendPost(ReqURL, params);	
		
		//��ݹ�˾ҵ���?�ص���Ϣ......
		
		return result;
	}
	
	/**
     * XML��ʽ ��ѯ���������켣
	 * @throws Exception 
     */
	public static String getOrderTracesByXml() throws Exception{
		String requestData= "<?xml version=\"1.0\" encoding=\"utf-8\" ?>"+
							"<Content>"+
							"<OrderCode></OrderCode>"+
							"<ShipperCode>SF</ShipperCode>"+
							"<LogisticCode>589707398027</LogisticCode>"+
							"</Content>";
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("RequestData", urlEncoder(requestData, "UTF-8"));
		params.put("EBusinessID", EBusinessID);
		params.put("RequestType", "1002");
		String dataSign=encrypt(requestData, AppKey, "UTF-8");
		params.put("DataSign", urlEncoder(dataSign, "UTF-8"));
		params.put("DataType", "1");
		
		String result=sendPost(ReqURL, params);	
		
		//��ݹ�˾ҵ���?�ص���Ϣ......
		
		return result;
	}
 
	/**
     * MD5����
     * @param str ����       
     * @param charset ���뷽ʽ
	 * @throws Exception 
     */
	@SuppressWarnings("unused")
	private static String MD5(String str, String charset) throws Exception {
	    MessageDigest md = MessageDigest.getInstance("MD5");
	    md.update(str.getBytes(charset));
	    byte[] result = md.digest();
	    StringBuffer sb = new StringBuffer(32);
	    for (int i = 0; i < result.length; i++) {
	        int val = result[i] & 0xff;
	        if (val <= 0xf) {
	            sb.append("0");
	        }
	        sb.append(Integer.toHexString(val));
	    }
	    return sb.toString().toLowerCase();
	}
	
	/**
     * base64����
     * @param str ����       
     * @param charset ���뷽ʽ
	 * @throws UnsupportedEncodingException 
     */
	private static String base64(String str, String charset) throws UnsupportedEncodingException{
		String encoded = Base64.encode(str.getBytes(charset));
		return encoded;    
	}	
	
	@SuppressWarnings("unused")
	private static String urlEncoder(String str, String charset) throws UnsupportedEncodingException{
		String result = URLEncoder.encode(str, charset);
		return result;
	}
	
	/**
     * ����Signǩ�����
     * @param content ����   
     * @param keyValue Appkey  
     * @param charset ���뷽ʽ
	 * @throws UnsupportedEncodingException ,Exception
	 * @return DataSignǩ��
     */
	@SuppressWarnings("unused")
	private static String encrypt (String content, String keyValue, String charset) throws UnsupportedEncodingException, Exception
	{
		if (keyValue != null)
		{
			return base64(MD5(content + keyValue, charset), charset);
		}
		return base64(MD5(content, charset), charset);
	}
	
	 /**
     * ��ָ�� URL ����POST����������     
     * @param url ��������� URL    
     * @param params ����Ĳ����     
     * @return Զ����Դ����Ӧ���
     */
	@SuppressWarnings("unused")
	private static String sendPost(String url, Map<String, String> params) {
        OutputStreamWriter out = null;
        BufferedReader in = null;        
        StringBuilder result = new StringBuilder(); 
        try {
            URL realUrl = new URL(url);
            HttpURLConnection conn =(HttpURLConnection) realUrl.openConnection();
            // ����POST�������������������
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // POST����
            conn.setRequestMethod("POST");
            // ����ͨ�õ���������
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            conn.connect();
            // ��ȡURLConnection�����Ӧ�������
            out = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
            // �����������            
            if (params != null) {
		          StringBuilder param = new StringBuilder(); 
		          for (Map.Entry<String, String> entry : params.entrySet()) {
		        	  if(param.length()>0){
		        		  param.append("&");
		        	  }	        	  
		        	  param.append(entry.getKey());
		        	  param.append("=");
		        	  param.append(entry.getValue());		        	  
		        	  System.out.println(entry.getKey()+":"+entry.getValue());
		          }
		          System.out.println("param:"+param.toString());
		          out.write(param.toString());
            }
            // flush������Ļ���
            out.flush();
            // ����BufferedReader����������ȡURL����Ӧ
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String line;
            while ((line = in.readLine()) != null) {
                result.append(line);
            }
        } catch (Exception e) {            
            e.printStackTrace();
        }
        //ʹ��finally�����ر��������������
        finally{
            try{
                if(out!=null){
                    out.close();
                }
                if(in!=null){
                    in.close();
                }
            }
            catch(IOException ex){
                ex.printStackTrace();
            }
        }
        return result.toString();
    }
}
