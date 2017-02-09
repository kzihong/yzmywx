package cn.easycode.yzmywx.dao.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * 
 * @author caimengyuan
 * 
 */
public class ReadWebCode {
	public static void main(String[] args) {
		try {
			//想要看的网页代码-------Url
			String http = "http://www.imooc.com/";
			URL url = new URL(http);
			//打开流
			InputStream is = url.openStream();
			//输入流
			InputStreamReader isr = new InputStreamReader(is, "utf-8");
			//字符读入流
			BufferedReader br = new BufferedReader(isr);
			String data = br.readLine();//读每行
			while (data != null) {//不为空就继续读取
				System.out.println(data);
				data = br.readLine();
			}
			br.close();
			isr.close();
			is.close();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
