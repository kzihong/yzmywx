package cn.easycode.yzmywx.services;


import org.codehaus.jackson.jaxrs.JacksonJsonProvider;
import org.glassfish.jersey.filter.LoggingFilter;
import org.glassfish.jersey.media.multipart.MultiPartFeature;
import org.glassfish.jersey.server.ResourceConfig;

public class RestApplication extends ResourceConfig {
	public RestApplication() {
		// 服务类所在的包路径
		packages("cn.easycode.yzmywx.services.system");
		packages("cn.easycode.yzmywx.services.wechat");
		packages("cn.easycode.yzmywx.services.repair");
		packages("cn.easycode.yzmywx.services.news");
		packages("cn.easycode.yzmywx.services.editor");
		packages("cn.easycode.yzmywx.services.shop");
		// 注册JSON转换器
		register(JacksonJsonProvider.class);
		register(MultiPartFeature.class);
		// 打印访问日志，便于跟踪调试，正式发布可清除
		register(LoggingFilter.class);
	}
}