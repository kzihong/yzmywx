package cn.easycode.yzmywx.services.system;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.servlet.http.HttpServletRequest;
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

import cn.easycode.yzmywx.bean.eo.Resource;
import cn.easycode.yzmywx.bean.eo.Role;
import cn.easycode.yzmywx.bean.eo.User;
import cn.easycode.yzmywx.bean.eo.Workergroup;
import cn.easycode.yzmywx.bean.vo.Grid;
import cn.easycode.yzmywx.bean.vo.ReturnJson;
import cn.easycode.yzmywx.bean.vo.SessionInfo;
import cn.easycode.yzmywx.bean.vo.wechat.FansGroups;
import cn.easycode.yzmywx.dao.system.UserDao;
import cn.easycode.yzmywx.utils.ConfigUtil;
import cn.easycode.yzmywx.utils.IpUtil;

@Stateless
@Path("user")
public class UserRest {
	@EJB
	private UserDao userDao;

	/**
	 * 登录
	 */
	@SuppressWarnings("finally")
	@POST
	@Path("login")
	@Consumes("application/json")
	@Produces("application/json")
	public ReturnJson login(@Context HttpServletRequest request, User user) {
		ReturnJson returnjson = new ReturnJson();
		try{
			User loginuser = userDao.login(user.getLoginname(), user.getPwd());
			if(null != loginuser){
				if(loginuser.getActive().equals("0")){
					returnjson.setMsg("该用户账号为冻结状态!");
				}else{
					for (Role role : loginuser.getRoles()) {
						for(Resource resource : role.getResources()){resource.getId();}
					}
					loginuser.setIp(IpUtil.getIpAddr(request));
					SessionInfo sessionInfo = new SessionInfo();
					sessionInfo.setUser(loginuser);
					request.getSession().setAttribute(ConfigUtil.getSessionInfoName(), sessionInfo);
					returnjson.setSuccess(true);
				}
			}else{
				returnjson.setMsg("用户名或密码错误!");
			}
		}catch(Exception e){
			returnjson.setMsg(e.toString());
		}finally{
			return returnjson;
		}
	}
	
	/**
	 * 注销系统
	 */
	@POST
	@Path("logout")
	@Produces("application/json")
	public ReturnJson logout(@Context HttpServletRequest request) {
		if (request.getSession() != null) {
			request.getSession().invalidate();
		}
		ReturnJson returnjson = new ReturnJson();
		returnjson.setSuccess(true);
		return returnjson;
	}
	
	
	/**
	 * 添加用户
	 */
	@SuppressWarnings("finally")
	@POST
	@Path("save")
	@Consumes("application/json")
	@Produces("application/json")
	public ReturnJson save(User user) {
		ReturnJson returnjson = new ReturnJson();
		try{
			if (!StringUtils.isBlank(user.getLoginname()) && !StringUtils.isBlank(user.getName())) {
				userDao.save(user);
				
				returnjson.setSuccess(true);
				returnjson.setMsg("新建用户成功！默认密码：123456");
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
	 * 更新用户
	 */
	@SuppressWarnings("finally")
	@POST
	@Path("update")
	@Consumes("application/json")
	@Produces("application/json")
	public ReturnJson update(User user) {
		ReturnJson returnjson = new ReturnJson();
		try{
			if (!StringUtils.isBlank(user.getId())&&!StringUtils.isBlank(user.getLoginname()) && !StringUtils.isBlank(user.getName())) {
				userDao.merge(user);
				
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
	 * 修改用户密码
	 */
	@SuppressWarnings("finally")
	@POST
	@Path("changeCurrentPwd/{pwd}")
	@Produces("application/json")
	public ReturnJson changeCurrentPwd(@Context HttpServletRequest request,@PathParam("pwd") String pwd) {
		ReturnJson returnjson = new ReturnJson();
		try {
			Object object = request.getSession().getAttribute(ConfigUtil.getSessionInfoName());
			if(null != object){
				SessionInfo sessininfo = (SessionInfo)object;
				userDao.changeCurrentPwd(sessininfo.getUser().getId(),pwd);
				returnjson.setMsg("设置成功!");
				returnjson.setSuccess(true);
			}else{
				returnjson.setMsg("用户超时，请重新登录后在进行修改密码!");
			}
		} catch (Exception e) {
			returnjson.setMsg(e.toString());
		} finally {
			return returnjson;
		}
	}
	
	/**
	 * 设置用户账号状态
	 */
	@SuppressWarnings("finally")
	@POST
	@Path("active/{id}")
	@Produces("application/json")
	public ReturnJson changeActive(@PathParam("id") String id) {
		ReturnJson returnjson = new ReturnJson();
		try {
			userDao.changeActive(id);
			returnjson.setMsg("设置成功!");
			returnjson.setSuccess(true);
		} catch (Exception e) {
			returnjson.setMsg(e.toString());
		} finally {
			return returnjson;
		}
	}
	
	/**
	 * 对某个角色进行授权，即管理某个角色的资源
	 */
	@SuppressWarnings("finally")
	@POST
	@Path("grantRole")
	@Consumes("application/json")
	@Produces("application/json")
	public ReturnJson grantResource(User u) {
		ReturnJson returnjson = new ReturnJson();
		try{
			if (!StringUtils.isBlank(u.getId())) {
				userDao.grantResource(u);
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
	
	@SuppressWarnings("finally")
	@GET
	@Path("getById/{id}")
	@Produces("application/json")
	public String getById(@PathParam("id") String id) {
		User user = null;
		try {
			user = userDao.find(id);
		} catch (Exception e) {
			user = null;
		} finally {
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(user);} catch (Exception e) {return null;}
		}
	}
	
	
	/**
	 * 分页组合查询用户列表
	 */
	@SuppressWarnings("finally")
	@POST
	@Path("userList")
	@Consumes("application/x-www-form-urlencoded")
	@Produces("application/json")
	public String getUserList(@FormParam("page") Integer page, @FormParam("rows") Integer rows,
			@FormParam("loginname") String loginname, @FormParam("name") String name,
			@FormParam("sex") String sex, @FormParam("sort") String sort, @FormParam("order") String order) {
		Grid returnjson = new Grid();
		try{
			Long total = userDao.getUserListSize(loginname, name, sex);
			if(total > 0){
				returnjson.setTotal(total);
				returnjson.setRows(userDao.getUserList(page, rows, loginname, name, sex, sort, order));
			}
		}catch(Exception e){
			returnjson = new Grid();
		}finally{
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(returnjson);} catch (Exception e) {return "[]";}
		}
	}
	
	@SuppressWarnings("finally")
	@POST
	@Path("addWorker")
	@Consumes("application/json")
	@Produces("application/json")
	public ReturnJson addWorker(User user){
		ReturnJson returnjson = new ReturnJson();
		try{
			if (!StringUtils.isBlank(user.getLoginname()) && !StringUtils.isBlank(user.getName())) {
				userDao.saveWorker(user);
				returnjson.setSuccess(true);
				returnjson.setMsg("新建用户成功！默认密码为123456,请自行登录系统进行修改");
			}else{
				returnjson.setMsg("数据出错!");
			}
		}catch(Exception e){
			returnjson.setMsg(e.toString());
		}finally{
			return returnjson;
		}
	}
	
	@SuppressWarnings("finally")
	@POST
	@Path("updateWorker/{workerid}")
	@Consumes("application/json")
	@Produces("application/json")
	public ReturnJson updateWorker(User user,@PathParam("workerid") String workerid) {
		ReturnJson returnjson = new ReturnJson();
		try{
			if (!StringUtils.isBlank(workerid)&&!StringUtils.isBlank(user.getLoginname()) && !StringUtils.isBlank(user.getName())) {
				userDao.mergeWorker(user,workerid);
				
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
	
	@SuppressWarnings("finally")
	@POST
	@Path("getWorkergroup")
	@Produces("application/json")
	public List<Workergroup> getWorkergroup(){
		List<Workergroup> list = null;
		try {
			list = userDao.getWorkergroup();
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			return list;
		}
	}
	
	@SuppressWarnings("finally")
	@POST
	@Path("updateGroups")
	@Consumes("application/json")
	@Produces("application/json")
	public ReturnJson saveGroup(List<Workergroup> workergroups){
		ReturnJson returnJson = new ReturnJson();
		try {
			if(userDao.saveGroup(workergroups)){
				returnJson.setSuccess(true);
				returnJson.setMsg("修改分组成功");
			}
		} catch (Exception e) {
			// TODO: handle exception
			returnJson.setSuccess(false);
			returnJson.setMsg(e.toString());
		}finally{
			return returnJson;
		}
	}
	
	@SuppressWarnings("finally")
	@POST
	@Path("moveGroup/{workerid}/{groupid}")
	@Consumes("application/json")
	@Produces("application/json")
	public ReturnJson deleteGroup(@PathParam("workerid") String workerid,@PathParam("groupid") String groupid){
		ReturnJson returnJson = new ReturnJson();
		try {
			if(userDao.moveGroup(workerid,groupid)){
				returnJson.setSuccess(true);
				returnJson.setMsg("新增分组成功");
			}
		} catch (Exception e) {
			// TODO: handle exception
			returnJson.setSuccess(false);
			returnJson.setMsg(e.toString());
		}finally{
			return returnJson;
		}
	}
}
