package cn.easycode.yzmywx.utils;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.multipart.FilePart;
import org.apache.commons.httpclient.methods.multipart.MultipartRequestEntity;
import org.apache.commons.httpclient.methods.multipart.Part;
import org.apache.commons.httpclient.methods.multipart.StringPart;
import org.apache.commons.httpclient.protocol.Protocol;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.ParseException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import cn.easycode.yzmywx.bean.vo.wechat.AccessToken;

import com.thoughtworks.xstream.XStream;

public class WeixinUtil {
	public static Map<String, String> xmlToMap(HttpServletRequest request) throws IOException, DocumentException{
		Map<String, String> map = new HashMap<String, String>();
		SAXReader reader = new SAXReader();
		
		InputStream ins = request.getInputStream();
		Document doc = reader.read(ins);
		
		Element root = doc.getRootElement();
		
		@SuppressWarnings("unchecked")
		List<Element> list = root.elements();
		
		for(Element e : list){
			map.put(e.getName(), e.getText());
		}
		ins.close();
		return map;
	}
	
	public static com.alibaba.fastjson.JSONObject xmlToJson(HttpServletRequest request) throws IOException, DocumentException{
		com.alibaba.fastjson.JSONObject jsonObject = new com.alibaba.fastjson.JSONObject();
		SAXReader reader = new SAXReader();
		
		InputStream ins = request.getInputStream();
		Document doc = reader.read(ins);
		
		Element root = doc.getRootElement();
		
		@SuppressWarnings("unchecked")
		List<Element> list = root.elements();
		
		for(Element e : list){
			jsonObject.put(e.getName(), e.getText());
		}
		ins.close();
		return jsonObject;
	}
	
	public static String generalToXml(Object textMessage){
		XStream xstream = new XStream();
		xstream.alias("xml", textMessage.getClass());
		return xstream.toXML(textMessage);
	}
	
	/*public static String newsMessageToXml(NewsMessage nm){
		XStream xstream = new XStream();
		xstream.alias("xml", nm.getClass());
		xstream.alias("item", new News().getClass());
		return xstream.toXML(nm);
	}*/
	
	 public static File httpRequestToFile(String filePath ,String fileName,String path, String method, String body) {
	        if(fileName==null||path==null||method==null){
	            return null;
	        }

	        File file = null;
	        HttpURLConnection conn = null;
	        InputStream inputStream = null;
	        FileOutputStream fileOut = null;
	        try {
	            URL url = new URL(path);
	            conn = (HttpURLConnection) url.openConnection();
	            conn.setDoOutput(true);
	            conn.setDoInput(true);
	            conn.setUseCaches(false);
	            conn.setRequestMethod(method);
	            if (null != body) {
	                OutputStream outputStream = conn.getOutputStream();
	                outputStream.write(body.getBytes("UTF-8"));
	                outputStream.close();
	            }

	            inputStream = conn.getInputStream();
	            if(inputStream!=null){
	            	File filePathFile = new File(filePath);
	    			if (!filePathFile.exists()) {
	    				filePathFile.mkdirs();
	    			}
	                file = new File(filePath+fileName);
	            }else{
	                return file;
	            }

	            //写入到文件
	            fileOut = new FileOutputStream(file);
	            if(fileOut!=null){
	                int c = inputStream.read();
	                while(c!=-1){
	                    fileOut.write(c);
	                    c = inputStream.read();
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	            if(conn!=null){
	                conn.disconnect();
	            }

	            /*
	             * 必须关闭文件流
	             * 否则JDK运行时，文件被占用其他进程无法访问
	             */
	            try {
	                inputStream.close();
	                fileOut.close();
	            } catch (IOException execption) {
	            	execption.printStackTrace();
	            }
	        }
	        return file;
	 }
	 
	 public static String getJsApi(String at) throws Exception{
		 JSONObject jsonObject = null;
		 String geturlString = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi".replace("ACCESS_TOKEN", at);
		 jsonObject = doGetStr(geturlString);
		 return jsonObject.getString("ticket");
	 }
	 
	 public static JSONObject uploadMedia(File file, String token, String type) {
	        if(file==null||token==null||type==null){
	            return null;
	        }

	        if(!file.exists()){
	            System.out.println("上传文件不存在,请检查!");
	            return null;
	        }

	        String url = "http://file.api.weixin.qq.com/cgi-bin/media/upload?access_token=ACCESS_TOKEN&type=TYPE";
	        JSONObject jsonObject = null;
	        PostMethod post = new PostMethod(url);
	        post.setRequestHeader("Connection", "Keep-Alive");
	        post.setRequestHeader("Cache-Control", "no-cache");
	        FilePart media = null;
	        HttpClient httpClient = new HttpClient();
	        //信任任何类型的证书
	        Protocol myhttps = new Protocol("https", new MySSLProtocolSocketFactory(), 443); 
	        Protocol.registerProtocol("https", myhttps);

	        try {
	            media = new FilePart("media", file);
	            Part[] parts = new Part[] { new StringPart("access_token", token),
	                    new StringPart("type", type), media };
	            MultipartRequestEntity entity = new MultipartRequestEntity(parts,
	                    post.getParams());
	            post.setRequestEntity(entity);
	            int status = httpClient.executeMethod(post);
	            if (status == HttpStatus.SC_OK) {
	                String text = post.getResponseBodyAsString();
	                jsonObject = JSONObject.fromObject(text);
	            } else {
	            	System.out.println("upload Media failure status is:" + status);
	            }
	        } catch (Exception execption) {
	        	execption.printStackTrace();
	        }
	           
	        return jsonObject;
	    }
	 
	 public static File downloadMedia(String filePath ,String fileName, String token,
	            String mediaId) {
	        String url = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=ACCESS_TOKEN&media_id=MEDIA_ID".replace("ACCESS_TOKEN", token).replace("MEDIA_ID", mediaId);
	        return httpRequestToFile(filePath,fileName, url, "GET", null);
	    }
	 
	 public static String getAccessToken(String appid,String appsecret) throws ParseException, IOException
	 {
		 AccessToken at = new AccessToken();
		 String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET".replace("APPID", appid).replace("APPSECRET", appsecret);
		 JSONObject jsonObject = doGetStr(url);
			if(jsonObject!=null){
				at.setAccess_token(jsonObject.getString("access_token"));
				at.setExpires_in(jsonObject.getInt("expires_in"));
			}
		 return at.getAccess_token();
	 }
	 
	 public static JSONObject doGetStr(String url) throws ParseException, IOException{
			DefaultHttpClient client = new DefaultHttpClient();
			HttpGet httpGet = new HttpGet(url);
			JSONObject jsonObject = null;
			HttpResponse httpResponse = client.execute(httpGet);
			HttpEntity entity = httpResponse.getEntity();
			if(entity != null){
				String result = EntityUtils.toString(entity,"UTF-8");
				jsonObject = JSONObject.fromObject(result);
			}
			return jsonObject;
		}
	 
	 public static JSONObject doPostStr(String url,String outStr) throws ParseException, IOException{
			DefaultHttpClient client = new DefaultHttpClient();
			HttpPost httpost = new HttpPost(url);
			JSONObject jsonObject = null;
			httpost.setEntity(new StringEntity(outStr,"UTF-8"));
			HttpResponse response = client.execute(httpost);
			String result = EntityUtils.toString(response.getEntity(),"UTF-8");
			jsonObject = JSONObject.fromObject(result);
			return jsonObject;
		}
	 
	/* public static void changeToMp3(String sourcePath, String targetPath) {  
	        File source = new File(sourcePath);  
	        File target = new File(targetPath);  
	        AudioAttributes audio = new AudioAttributes();  
	        Encoder encoder = new Encoder();  
	  
	        audio.setCodec("libmp3lame");  
	        EncodingAttributes attrs = new EncodingAttributes();  
	        attrs.setFormat("mp3");  
	        attrs.setAudioAttributes(audio);  
	  
	        try {  
	            encoder.encode(source, target, attrs);  
	        } catch (IllegalArgumentException e) {  
	        } catch (InputFormatException e) {  
	        } catch (EncoderException e) {  
	        }  
	    }  */
}
