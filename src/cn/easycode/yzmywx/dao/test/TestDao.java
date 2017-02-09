package cn.easycode.yzmywx.dao.test;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

import sun.misc.BASE64Decoder;
import net.sf.json.JSONObject;
import cn.easycode.yzmywx.bean.eo.shop.Product;
import cn.easycode.yzmywx.bean.vo.SearchData;
import cn.easycode.yzmywx.bean.vo.ship.ShipRequestData;
import cn.easycode.yzmywx.utils.CheckUtil;
import cn.easycode.yzmywx.utils.ConfigUtil;
import cn.easycode.yzmywx.utils.OrderUtil;
import cn.easycode.yzmywx.utils.ShipUtil;



public class TestDao {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		/*Product product = new Product();
		Product product1 = new Product();
		Product product2 = new Product();
		System.out.println("第一次");
		System.out.println(product.toString());
		System.out.println(product1.toString());
		System.out.println(product2.toString());
		product1 = product;
		product2 = null;
		System.out.println("第二次");
		System.out.println(product.toString());
		System.out.println(product1.toString());
		System.out.println(product2);*/
		//f0bc792b2377dfae46e03d46bd4732a5fcf72073
		SearchData searchData= new SearchData();
		searchData.setAccess_token("a");
		searchData.setAppid("b");
		searchData.setNonceStr("c");
		searchData.setTimestap(110);
		searchData.setTimeStap("110");
		searchData.setUrl("d");
		String SignatureString = "accesstoken="+searchData.getAccess_token();
		SignatureString += "&appid="+searchData.getAppid();
		SignatureString +="&noncestr="+searchData.getNonceStr();
		SignatureString +="&timestamp="+searchData.getTimestap();
		SignatureString +="&url="+searchData.getUrl();
		System.out.println(SignatureString);
		System.out.println(CheckUtil.getSha1(SignatureString));
		
	}
	
	public static boolean string2Image(String imgStr, String imgFilePath) {  
	    // 对字节数组字符串进行Base64解码并生成图片  
	    if (imgStr == null)  
	        return false;  
	    try {  
	        // Base64解码  
	        byte[] b = new BASE64Decoder().decodeBuffer(imgStr);  
	        for (int i = 0; i < b.length; ++i) {  
	            if (b[i] < 0) {  
	                // 调整异常数据  
	                b[i] += 256;  
	            }  
	        }  
	        // 生成Jpeg图片  
	        OutputStream out = new FileOutputStream(imgFilePath);  
	        out.write(b);  
	        out.flush();  
	        out.close();  
	        return true;  
	    } catch (Exception e) {  
	        return false;  
	    }  
	}  

}
