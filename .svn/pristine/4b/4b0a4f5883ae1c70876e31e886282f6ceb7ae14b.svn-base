package cn.easycode.yzmywx.services.system;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;

import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;

import cn.easycode.yzmywx.bean.eo.Resource;
import cn.easycode.yzmywx.bean.eo.Resourcetype;
import cn.easycode.yzmywx.bean.vo.ResourceTreeGrid;
import cn.easycode.yzmywx.bean.vo.ReturnJson;
import cn.easycode.yzmywx.bean.vo.SessionInfo;
import cn.easycode.yzmywx.bean.vo.Tree;
import cn.easycode.yzmywx.dao.system.ResourceDao;
import cn.easycode.yzmywx.utils.ConfigUtil;

@Stateless
@Path("resource")
public class ResourceRest {
	@EJB
	private ResourceDao resourceDao;
	
	/**
	 * 添加资源
	 */
	@SuppressWarnings("finally")
	@POST
	@Path("save")
	@Consumes("application/json")
	@Produces("application/json")
	public ReturnJson save(Resource resource) {
		ReturnJson returnjson = new ReturnJson();
		try{
			if (!StringUtils.isBlank(resource.getId()) && !StringUtils.isBlank(resource.getName())) {
				resourceDao.save(resource);
				
				returnjson.setSuccess(true);
				returnjson.setMsg("新建资源成功！");
			}else{
				returnjson.setMsg("数据出错!");
			}
		}catch(Exception e){
			returnjson.setMsg(e.toString());
		}finally{
			return returnjson;
		}
	}
	
	/**
	 * 更新资源
	 */
	@SuppressWarnings("finally")
	@POST
	@Path("update")
	@Consumes("application/json")
	@Produces("application/json")
	public ReturnJson update(Resource resource) {
		ReturnJson returnjson = new ReturnJson();
		try{
			if (!StringUtils.isBlank(resource.getId())&&!StringUtils.isBlank(resource.getName())) {
				resourceDao.update(resource);
				returnjson.setMsg("更新成功！");
				returnjson.setSuccess(true);
			}else{
				returnjson.setMsg("数据出错!");
			}
		}catch(Exception e){
			returnjson.setMsg(e.toString());
		}finally{
			return returnjson;
		}
	}

	/**
	 * 获得资源类型列表
	 */
	@SuppressWarnings("finally")
	@POST
	@Path("resourcetype")
	@Produces("application/json")
	public List<Resourcetype> getResourcetype() {
		List<Resourcetype> resourcetypelist = new ArrayList<Resourcetype>();
		try {
			resourcetypelist = resourceDao.getResourcetype();
		} catch (Exception e) {
			resourcetypelist = new ArrayList<Resourcetype>();
		} finally {
			return resourcetypelist;
		}
	}
	
	/**
	 * 按id查询资源
	 */
	@SuppressWarnings("finally")
	@GET
	@Path("getById/{id}")
	@Produces("application/json")
	public String getById(@PathParam("id") String id) {
		Resource resource = null;
		try {
			resource = resourceDao.find(id);
		} catch (Exception e) {
			resource = null;
		} finally {
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(resource);} catch (Exception e) {return null;}
		}
	}

	
	/**
	 * 获得该角色的资源列表
	 */	
	@SuppressWarnings("finally")
	@GET
	@Path("roleResources/{roleid}")
	@Produces("application/json")
	public String getRoleResources(@PathParam("roleid") String roleid) {
		List<Tree> returnlist = new ArrayList<Tree>();
		try {
			returnlist = resourceDao.getRoleResources(roleid);
		} catch (Exception e) {
			returnlist = new ArrayList<Tree>();
		} finally {
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(returnlist);} catch (Exception e) { return "[]"; }
		}
	}
	
	/**
	 * 获得整个资源列表树形数据
	 */	
	@SuppressWarnings("finally")
	@POST
	@Path("resourcesTree")
	@Produces("application/json")
	public List<Tree> getResourcesTree() {
		List<Tree> returnlist = new ArrayList<Tree>();
		try {
			returnlist = resourceDao.getResourcesTree();
		} catch (Exception e) {
			returnlist = new ArrayList<Tree>();
		} finally {
			 return returnlist;
		}
	}
	
	/**
	 * 获得整个菜单资源列表
	 */	
	@SuppressWarnings("finally")
	@POST
	@Path("mainMenuList")
	@Produces("application/json")
	public List<Tree> getMenulist() {
		List<Tree> returnlist = new ArrayList<Tree>();
		try {
			returnlist = resourceDao.getMenulist();
		} catch (Exception e) {
			returnlist = new ArrayList<Tree>();
		} finally {
			 return returnlist;
		}
	}
	
	/**
	 * 获得整个菜单资源列表
	 */	
	@SuppressWarnings("finally")
	@POST
	@Path("personelMainMenuList")
	@Produces("application/json")
	public List<Tree> getPersonelMenulist(@Context HttpServletRequest request) {
		List<Tree> returnlist = new ArrayList<Tree>();
		try {
			Object object = request.getSession().getAttribute(ConfigUtil.getSessionInfoName());
			if(null != object){
				SessionInfo sessininfo = (SessionInfo)object;
				returnlist = resourceDao.getPersonelMenulist(sessininfo.getUser().getId());
			}
		} catch (Exception e) {
			returnlist = new ArrayList<Tree>();
		} finally {
			 return returnlist;
		}
	}
	
	
	/**
	 * 获得整个资源列表的treegrid数据
	 */	
	@SuppressWarnings("finally")
	@POST
	@Path("treeGrid")
	@Produces("application/json")
	public String getTreeGrid() {
		List<ResourceTreeGrid> resourceTreelist = new ArrayList<ResourceTreeGrid>();
		try {
			resourceTreelist = resourceDao.getResourceTreeByFatherResourceId("0");
		} catch (Exception e) {
			resourceTreelist = new ArrayList<ResourceTreeGrid>();
		} finally {
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(resourceTreelist);} catch (Exception e) { return "[]"; }
		}
	}
	
}
