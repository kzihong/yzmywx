package cn.easycode.yzmywx.services.news;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;

import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;

import cn.easycode.yzmywx.bean.eo.Companynew;
import cn.easycode.yzmywx.bean.vo.Grid;
import cn.easycode.yzmywx.bean.vo.Page;
import cn.easycode.yzmywx.bean.vo.ReturnJson;
import cn.easycode.yzmywx.dao.news.NewsDao;
import cn.easycode.yzmywx.utils.DateUtil;
import cn.easycode.yzmywx.utils.SecurityUtil;

@Stateless
@Path("news")
public class newsRest {
	@EJB
	private NewsDao newsDao;

	
	/**
	 * 添加新闻
	 */
	
	@POST
	@Path("save")
	@Consumes("application/json")
	@Produces("application/json")
	public ReturnJson save(Companynew companynew, @Context HttpServletRequest request) {
		ReturnJson returnjson = new ReturnJson();
		
		HttpSession session = request.getSession();
		SecurityUtil securityUtil = new SecurityUtil(session);
		//是否有权限
		if (securityUtil.havePermission("news.newsManager.add")) {
		
			if (!StringUtils.isBlank(companynew.getTitle())) {
				companynew.setId(UUID.randomUUID().toString());
				companynew.setCreatetime(System.currentTimeMillis());
				
				boolean result = newsDao.save(companynew);
				if (result) {
					returnjson.setMsg("保存成功！");
					returnjson.setSuccess(true);
				}else{
					returnjson.setMsg("保存失败！");
					returnjson.setSuccess(false);
				}
			}else{
				returnjson.setMsg("数据出错!");
			}
		}else {
			returnjson.setMsg("对不起，无权限！");
			returnjson.setSuccess(false);
		}
		return returnjson;
	}
	
	/**
	 * 更新新闻
	 */
	@POST
	@Path("update")
	@Consumes("application/json")
	@Produces("application/json")
	public ReturnJson update(Companynew companynew, @Context HttpServletRequest request) {
		ReturnJson returnjson = new ReturnJson();
		
		HttpSession session = request.getSession();
		SecurityUtil securityUtil = new SecurityUtil(session);
		//是否有权限
		if (securityUtil.havePermission("news.newsManager.update")) {
		
			if (!StringUtils.isBlank(companynew.getTitle())) {
				Companynew old = newsDao.getById(companynew.getId());
				old.setTitle(companynew.getTitle());
				old.setPhotoUrl(companynew.getPhotoUrl());
				old.setContent(companynew.getContent());
				old.setCreatetime(System.currentTimeMillis());
				boolean result = newsDao.merge(old);
				if (result) {
					returnjson.setMsg("更新成功！");
					returnjson.setSuccess(true);
				}else{
					returnjson.setMsg("更新失败！");
					returnjson.setSuccess(false);
				}
			}else{
				returnjson.setMsg("数据出错!");
			}
		}else {
			returnjson.setMsg("对不起，无权限！");
			returnjson.setSuccess(false);
		}
		return returnjson;
	}
	
	
	
	/**
	 * 删除新闻
	 */
	@POST
	@Path("delete/{id}")
	@Produces("application/json")
	public ReturnJson delete(@PathParam("id") String id, @Context HttpServletRequest request) {
		ReturnJson returnjson = new ReturnJson();
		
		HttpSession session = request.getSession();
		SecurityUtil securityUtil = new SecurityUtil(session);
		//是否有权限
		if (securityUtil.havePermission("news.newsManager.delete")) {
		
			boolean result = newsDao.delete(id);
			if (result) {
				returnjson.setMsg("删除成功！");
				returnjson.setSuccess(true);
			}else{
				returnjson.setMsg("删除失败！");
				returnjson.setSuccess(false);
			}
		}else{
			returnjson.setMsg("数据出错!");
		}
		return returnjson;
	}
	
	
	/**
	 * 按id查询新闻
	 */
	@GET
	@Path("getById/{id}")
	@Produces("application/json")
	public String getById(@PathParam("id") String id) {
		ReturnJson returnjson = new ReturnJson();
		
		Companynew companynew = newsDao.getById(id);
		returnjson.setObj(companynew);
		returnjson.setSuccess(true);
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(returnjson);
		} catch (Exception e) {
			return "[]";
		}
	}
	
	
	/**
	 * 分页组合查询新闻
	 */
	@POST
	@Path("get")
	@Consumes("application/x-www-form-urlencoded")
	@Produces("application/json")
	public String getList(@FormParam("page") Integer page,@FormParam("rows") Integer rows,
			@FormParam("title") String title, @FormParam("date") String dateString,
			@FormParam("sort") String sort, @FormParam("order") String order) {
		Grid returnjson = new Grid();
		
		Date date = DateUtil.stringToDate(dateString, "yyyy-MM-dd");
		
		Long total = newsDao.getSize(title,date);
		if(total > 0){//<(\S?)[^>]>.?</\1>|<.?/>
			returnjson.setTotal(total);
			List<Companynew> companynews = newsDao.getByCondition(page, rows, title, date, sort, order);
			
			//截取50个长度
			for (Companynew companynew : companynews) {
				String content = companynew.getContent();
				if (content != null) {
					String formatcontent = content + "";
					formatcontent = formatcontent.replaceAll("<[^>]+>", "");
					if (formatcontent.length() > 50) {
						formatcontent = formatcontent.substring(0, 50);
					}
					companynew.setFormatcontent(formatcontent);
				}
			}
			
			returnjson.setRows(companynews);
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(returnjson);
		} catch (Exception e) {
			return "[]";
		}
	}
	
	/**
	 * 前端获取新闻
	 */
	@POST
	@Path("getnews")
	@Consumes("application/json")
	@Produces("application/json")
	public String get(Page page) {
		Grid returnjson = new Grid();
		
		Long total  = newsDao.getSize(null,null);
		returnjson.setTotal(total);
		
		List<Companynew> companynews = newsDao.getByCondition(page.getPage(), page.getRows(), null, null, null, null);
		
		//截取15个长度
		for (Companynew companynew : companynews) {
			String content = companynew.getContent();
			if (content != null) {
				String formatcontent = content + "";
				formatcontent = formatcontent.replaceAll("<[^>]+>", "");
				if (formatcontent.length() > 30) {
					formatcontent = formatcontent.substring(0, 30);
				}
				companynew.setFormatcontent(formatcontent);
			}
		}
		
		returnjson.setRows(companynews);
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(returnjson);
		} catch (Exception e) {
			return "[]";
		}
	}
	/**
	 * 前端获取新闻
	 */
	/*@POST
	@Path("getnews")
	@Consumes("application/json")
	@Produces("application/json")
	public String get(Page page, @Context HttpServlet httpservlet) {
		Grid returnjson = new Grid();
		
		ServletContext servletContext = httpservlet.getServletContext();
		Long total = (Long) servletContext.getAttribute("newstotal");
		Long newstime = (Long) servletContext.getAttribute("newstime");
		
		//判断是否已超过1小时 
		if (newstime > System.currentTimeMillis()-1000*3600 || total == null) {
			total = newsDao.getSize(null,null);
			servletContext.setAttribute("newstotal",total);
			servletContext.setAttribute("newstime",System.currentTimeMillis());
		}
		returnjson.setTotal(total);
		
		List<Companynew> companynews = newsDao.getByCondition(page.getPage(), page.getRows(), null, null, null, null);
		
		//截取15个长度
		for (Companynew companynew : companynews) {
			String content = companynew.getContent();
			if (content != null) {
				String formatcontent = content + "";
				formatcontent = formatcontent.replaceAll("<[^>]+>", "");
				if (formatcontent.length() > 15) {
					formatcontent = formatcontent.substring(0, 15);
				}
				companynew.setFormatcontent(formatcontent);
			}
		}
		
		returnjson.setRows(companynews);
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(returnjson);
		} catch (Exception e) {
			return "[]";
		}
	}*/
}
