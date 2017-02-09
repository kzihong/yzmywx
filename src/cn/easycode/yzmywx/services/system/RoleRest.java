package cn.easycode.yzmywx.services.system;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;

import cn.easycode.yzmywx.bean.eo.Role;
import cn.easycode.yzmywx.bean.vo.Grid;
import cn.easycode.yzmywx.bean.vo.ReturnJson;
import cn.easycode.yzmywx.bean.vo.Tree;
import cn.easycode.yzmywx.dao.system.RoleDao;

@Stateless
@Path("role")
public class RoleRest {
	@EJB
	private RoleDao roleDao;

	
	/**
	 * 添加角色
	 */
	@SuppressWarnings("finally")
	@POST
	@Path("save")
	@Consumes("application/json")
	@Produces("application/json")
	public ReturnJson save(Role role) {
		ReturnJson returnjson = new ReturnJson();
		try{
			if (!StringUtils.isBlank(role.getName())) {
				roleDao.save(role);
				returnjson.setSuccess(true);
				returnjson.setMsg("新建角色成功！");
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
	 * 更新角色
	 */
	@SuppressWarnings("finally")
	@POST
	@Path("update")
	@Consumes("application/json")
	@Produces("application/json")
	public ReturnJson update(Role role) {
		ReturnJson returnjson = new ReturnJson();
		try{
			if (!StringUtils.isBlank(role.getId())&&!StringUtils.isBlank(role.getName())) {
				roleDao.update(role);
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
	 * 删除角色
	 */
	@SuppressWarnings("finally")
	@POST
	@Path("delete/{id}")
	@Produces("application/json")
	public ReturnJson delete(@PathParam("id") String id) {
		ReturnJson returnjson = new ReturnJson();
		try{
			roleDao.delete(id);
			returnjson.setMsg("删除成功!");
			returnjson.setSuccess(true);
		}catch(Exception e){
			returnjson.setMsg(e.toString());
		}finally{
			return returnjson;
		}
	}
	
	/**
	 * 对某个角色进行授权，即管理某个角色的资源
	 */
	@SuppressWarnings("finally")
	@POST
	@Path("grantResource")
	@Consumes("application/json")
	@Produces("application/json")
	public ReturnJson grantResource(Role r) {
		ReturnJson returnjson = new ReturnJson();
		try{
			if (!StringUtils.isBlank(r.getId())) {
				roleDao.grantResource(r);
				returnjson.setMsg("设置成功!");
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
	 * 按id查询角色
	 */
	@SuppressWarnings("finally")
	@GET
	@Path("getById/{id}")
	@Produces("application/json")
	public String getById(@PathParam("id") String id) {
		Role role = null;
		try {
			role = roleDao.find(id);
		} catch (Exception e) {
			role = null;
		} finally {
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(role);} catch (Exception e) {return null;}
		}
	}
	
	/**
	 * 获得该用户的角色列表
	 */	
	@SuppressWarnings("finally")
	@GET
	@Path("userRoles/{userid}")
	@Produces("application/json")
	public String getUserRoles(@PathParam("userid") String userid) {
		List<Tree> returnlist = new ArrayList<Tree>();
		try {
			returnlist = roleDao.getUserRoles(userid);
		} catch (Exception e) {
			returnlist = new ArrayList<Tree>();
		} finally {
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(returnlist);} catch (Exception e) { return "[]"; }
		}
	}
	
	/**
	 * 获得整个资源列表
	 */	
	@SuppressWarnings("finally")
	@POST
	@Path("rolesTree")
	@Produces("application/json")
	public String getRolesTree() {
		List<Tree> returnlist = new ArrayList<Tree>();
		try {
			returnlist = roleDao.getRolesTree();
		} catch (Exception e) {
			returnlist = new ArrayList<Tree>();
		} finally {
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(returnlist);} catch (Exception e) { return "[]"; }
		}
	}
	
	
	/**
	 * 分页组合查询角色列表
	 */
	@SuppressWarnings("finally")
	@POST
	@Path("roleList")
	@Consumes("application/x-www-form-urlencoded")
	@Produces("application/json")
	public String getRoleList(@FormParam("page") Integer page,@FormParam("rows") Integer rows,
			@FormParam("name") String name,@FormParam("sort") String sort, @FormParam("order") String order) {
		Grid returnjson = new Grid();
		try{
			Long total = roleDao.getRoleListSize(name);
			if(total > 0){
				returnjson.setTotal(total);
				returnjson.setRows(roleDao.getRoleList(page, rows, name, sort, order));
			}
		}catch(Exception e){
			returnjson = new Grid();
		}finally{
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(returnjson);} catch (Exception e) {return "[]";}
		}
	}
	
	@POST
	@Path("getWorkerlist")
	@Produces("application/json")
	public String getWorkerList(){
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(roleDao.getWokerlist());
			} catch (Exception e) {
				e.printStackTrace();
				return "[]";
			}
	}
	
	/**
	 * 分页组合查询维修工人列表
	 */
	@SuppressWarnings("finally")
	@POST
	@Path("workerList")
	@Consumes("application/x-www-form-urlencoded")
	@Produces("application/json")
	public String getWorkerList(@FormParam("page") Integer page, @FormParam("rows") Integer rows,
			@FormParam("loginname") String loginname, @FormParam("name") String name,
			@FormParam("groupid") String groupid, @FormParam("sort") String sort, @FormParam("order") String order) {
		Grid returnjson = new Grid();
		try{
			Long total = roleDao.getWorkerListSize(loginname, name, groupid);
			if(total > 0){
				returnjson.setTotal(total);
				returnjson.setRows(roleDao.getWorkerList(page, rows, loginname, name, groupid, sort, order));
			}
		}catch(Exception e){
			returnjson = new Grid();
		}finally{
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(returnjson);} catch (Exception e) {return "[]";}
		}
	}
	
	

	/**
	 * 分页组合查询商城管理员
	 */
	@SuppressWarnings("finally")
	@POST
	@Path("shopManagerList")
	@Consumes("application/x-www-form-urlencoded")
	@Produces("application/json")
	public String getShopManagers(@FormParam("page") Integer page, @FormParam("rows") Integer rows,
			@FormParam("loginname") String loginname, @FormParam("name") String name,
			@FormParam("sort") String sort, @FormParam("order") String order) {
		Grid returnjson = new Grid();
		try{
			Long total = roleDao.shopManagerSize(loginname, name);
			if(total > 0){
				returnjson.setTotal(total);
				returnjson.setRows(roleDao.shopManagers(page, rows, loginname, name, sort, order));
			}
		}catch(Exception e){
			returnjson = new Grid();
		}finally{
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(returnjson);} catch (Exception e) {return "[]";}
		}
	}
	
	
} 
