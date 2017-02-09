package cn.easycode.yzmywx.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
public class CharsetEncodingServlet implements Filter {
	//定义成员变量.  
    private String encoding;  
    public CharsetEncodingServlet() { }
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//设置字符集.  
    	request.setCharacterEncoding(encoding); // 设置请求的编码
		response.setContentType("text/html; charset=" + encoding);// 设置应答对象的内容类型（包括编码格式）  
		
		chain.doFilter(request, response);
	}
	public void init(FilterConfig fConfig) throws ServletException {
		this.encoding = fConfig.getInitParameter("encoding");  
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}
}
