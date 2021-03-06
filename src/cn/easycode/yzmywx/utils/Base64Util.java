package cn.easycode.yzmywx.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;



import sun.misc.BASE64Decoder;

public class Base64Util {
	public static boolean string2Image(String imgStr, String imgFilePath ,String fileName) {
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
			File file = new File(imgFilePath);
			if (!file.exists()) {
				file.mkdirs();
			}
			// 生成Jpeg图片
			OutputStream out = new FileOutputStream(imgFilePath+fileName);
			out.write(b);//把file文件写入硬盘
			out.flush();
			out.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
