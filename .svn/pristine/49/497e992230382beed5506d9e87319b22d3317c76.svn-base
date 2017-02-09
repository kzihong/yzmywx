package cn.easycode.yzmywx.utils;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.codehaus.jackson.map.ObjectMapper;

/**
 * 
 * 文件上传 具体步骤： 1）获得磁盘文件条目工厂 DiskFileItemFactory 要导包 
   2） 利用 request 获取 真实路径
 * ，供临时文件存储，和 最终文件存储 ，这两个存储位置可不同，也可相同 
   3）对 DiskFileItemFactory 对象设置一些 属性
 * 4）高水平的API文件上传处理 ServletFileUpload upload = new ServletFileUpload(factory);
 * 目的是调用 parseRequest（request）方法 获得 FileItem 集合list ，
 * 
 * 5）在 FileItem 对象中 获取信息， 遍历， 判断 表单提交过来的信息 是否是 普通文本信息 另做处理
   6） 第一种. 用第三方 提供的
 * item.write( new File(path,filename) ); 直接写到磁盘上 第二种. 手动处理
 * 
 */
@WebServlet("/upload")
public class UploadProcessorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 存放临时文件的目录
	private static String TEMP_FOLDER = "/temp";

	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
	
		try {
			// 获得磁盘文件条目工厂
			DiskFileItemFactory factory = new DiskFileItemFactory();
			
			//保存图片的地址
			String path  = ConfigUtil.get("newsPhotoPath");
			String datefolder = "/" + DateUtil.dateToString(new Date(), "yyyy") + "/" + DateUtil.dateToString(new Date(), "MM") + "/" + DateUtil.dateToString(new Date(), "dd");// 日期命名的文件夹
			String realpath = path + datefolder;
			ObjectMapper mapper = new ObjectMapper();
			if (request.getSession() == null || request.getSession().getAttribute(ConfigUtil.getSessionInfoName()) == null) {// 如果用户没有登录，则不允许上传
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("status", false);
				response.getWriter().write(mapper.writeValueAsString(m));
			}else{
			
			// 如果没以下两行设置的话，上传大的 文件 会占用 很多内存，
			// 设置暂时存放的 存储室 , 这个存储室，可以和 最终存储文件 的目录不同
			/**
			 * 原理 它是先存到 暂时存储室，然后在真正写到 对应目录的硬盘上， 按理来说 当上传一个文件时，其实是上传了两份，第一个是以 .tmp
			 * 格式的 然后再将其真正写到 对应目录的硬盘上
			 */
			factory.setRepository(new File(TEMP_FOLDER));
			// 设置 缓存的大小，当上传文件的容量超过该缓存时，直接放到 暂时存储室
			factory.setSizeThreshold(5 * 1024 * 1024);

			// 高水平的API文件上传处理
			ServletFileUpload upload = new ServletFileUpload(factory);
			// 提交上来的信息都在这个list里面
			// 这意味着可以上传多个文件
			// 请自行组织代码
			
			List<FileItem> list = upload.parseRequest(request);
			// 获取上传的文件
			FileItem item = getUploadFileItem(list);
			// 获取文件名
			String filename = getUploadFileName(item);
			//以防目录不存在
			File file = new File(realpath);
			if (!file.exists()) {
				file.mkdirs();
			}
			
			filename = UUID.randomUUID().toString().replace("-", "").concat(".").concat(FilenameUtils.getExtension(filename));
			// 真正写到磁盘上
			item.write(new File(realpath, filename)); // 第三方提供的
			
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("status", true);
			m.put("fileUrl", datefolder + "/" +filename);
			response.getWriter().write(mapper.writeValueAsString(m));
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	private FileItem getUploadFileItem(List<FileItem> list) {
		for (FileItem fileItem : list) {
			if(!fileItem.isFormField()) {
				return fileItem;
			}
		}
		return null;
	}
	
	private String getUploadFileName(FileItem item) {
		// 获取路径名
		String value = item.getName();
		// 索引到最后一个反斜杠
		int start = value.lastIndexOf("/");
		// 截取 上传文件的 字符串名字，加1是 去掉反斜杠，
		String filename = value.substring(start + 1);
		
		return filename;
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
