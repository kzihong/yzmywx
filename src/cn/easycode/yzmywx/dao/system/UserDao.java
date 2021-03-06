package cn.easycode.yzmywx.dao.system;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.commons.lang3.StringUtils;

import cn.easycode.yzmywx.bean.eo.Resource;
import cn.easycode.yzmywx.bean.eo.Role;
import cn.easycode.yzmywx.bean.eo.User;
import cn.easycode.yzmywx.bean.eo.Workergroup;
import cn.easycode.yzmywx.utils.MD5Util;
import cn.easycode.yzmywx.utils.OrderUtil;


@Stateless
public class UserDao {
	@PersistenceContext(unitName = "yzmywx")
	private EntityManager em;
	
	public UserDao(){}
	
	@SuppressWarnings("unchecked")
	public User login(String loginname, String password) throws Exception{
		User user = null;
		Query query = em.createQuery("select user from User user where user.loginname=:loginname and user.pwd=:pwd");
		query.setParameter("loginname", loginname);
		query.setParameter("pwd", MD5Util.md5(password));
		List<User> userlist = query.getResultList();
		if(userlist.size() == 1){
			user = userlist.get(0);
			for (Role role : user.getRoles()) {
				for(Resource resource : role.getResources()){resource.getId();}
			}
		}
		return user;
	}
	
	public void changeCurrentPwd(String userid, String pwd) throws Exception{
		User user = em.find(User.class, userid);
		if(null != user && !StringUtils.isBlank(pwd)){
			user.setPwd(MD5Util.md5(pwd));
			em.merge(user);
		}else{
			throw new Exception("设置失败，用户信息出错!");
		}
	}
	
	public void changeActive(String userid) throws Exception{
		User user = em.find(User.class, userid);
		if(null != user){
			if(user.getActive().equals("0")){
				user.setActive("1");
			}else{
				user.setActive("0");
			}
		}else{
			throw new Exception("设置失败，用户信息出错!");
		}
	}
	
	@SuppressWarnings("unchecked")
	public boolean isHasloginname(String id, String loginname) throws Exception{
		boolean result = true;
		String sql = "select user from User user where user.loginname=:loginname";
		if(null != id){
			sql += " and user.id!=:id";
		}
		Query query = em.createQuery(sql);
		if(null != id){
			query.setParameter("id", id);
		}
		query.setParameter("loginname", loginname);
		List<User> list= query.getResultList();
		if(list.size() == 0) result = false;
		return result;
	}
	
	public User find(String userid) throws Exception{
		return em.find(User.class, userid);
	}
	
	public void grantResource(User u) throws Exception{
		User user = em.find(User.class, u.getId());
		if(null != user){
			user.setRoles(new ArrayList<Role>());
			if(null != u.getRoles()){
				for(int i=0; i<u.getRoles().size() && !StringUtils.isBlank(u.getRoles().get(i).getId()); i++){
					user.getRoles().add(em.getReference(Role.class, u.getRoles().get(i).getId()));
				}
			}
		}else{
			throw new Exception("数据出错!");
		}
	}
	
	public void save(User user) throws Exception{
		if(!isHasloginname(null, user.getLoginname())){
			user.setPwd(MD5Util.md5("123456"));
			user.setId(user.getId());
			em.persist(user);
			
		}else{
			throw new Exception("新建用户的登录名 " + user.getLoginname() + " 已经存在！");
		}
	}
	
	public void merge(User user) throws Exception{
		if(!isHasloginname(user.getId(), user.getLoginname())){
			User olduser = em.find(User.class, user.getId());
			olduser.setLoginname(user.getLoginname());
			olduser.setName(user.getName());
			olduser.setSex(user.getSex());
			olduser.setPhoto(user.getPhoto());
			em.merge(user);
		}else{
			throw new Exception("更新用户失败，登录用户名已存在！");
		}
	}
	
	public void remove(User user) throws Exception{
		em.remove(user);
	}
	
	public Long getUserListSize(String loginname, String name, String sex){
		Long total = 0l;
		
		String count_sql = "select count(user) from User user where 1=1 ";
		String where_sql = "";
		if(null != loginname){
			where_sql += " and user.loginname like :loginname ";
		}
		if(null != name){
			where_sql += " and user.name like :name ";
		}
		if(null != sex){
			where_sql += " and user.sex=:sex ";
		}
		
		Query query = em.createQuery(count_sql + where_sql);
		
		if(null != loginname){
			query.setParameter("loginname", loginname + "%");
		}
		if(null != name){
			query.setParameter("name", name + "%");
		}
		if(null != sex){
			query.setParameter("sex", sex);
		}
		Object object = query.getSingleResult();
		if(null != object){
			total = (Long)object;
		}
		return total;
	}
	
	@SuppressWarnings("unchecked")
	public List<User> getUserList(Integer page, Integer rows, String loginname, String name, String sex, String sort, String order){
		String query_sql = "select user from User user where 1=1 ";
		String where_sql = "";
		if(null != loginname){
			where_sql += " and user.loginname like :loginname ";
		}
		if(null != name){
			where_sql += " and user.name like :name ";
		}
		if(null != sex){
			where_sql += " and user.sex=:sex ";
		}
		
		String order_sql = " order by user.loginname";
		if(null != sort && !"".equals(sort)){
			if("department".equals(sort)){
				order_sql = " order by user.department.id";
			}else if("job".equals(sort)){
				order_sql = " order by user.job.id";
			}else {
				order_sql = " order by user." + sort;
			}
			if(null != order && !"".equals(order)){
				order_sql += " " + order;
			}
		}
		
		Query query = em.createQuery(query_sql + where_sql + order_sql);
		
		if(null != loginname){
			query.setParameter("loginname", loginname + "%");
		}
		if(null != name){
			query.setParameter("name", name + "%");
		}
		if(null != sex){
			query.setParameter("sex", sex);
		}
		
		if(null == rows) rows = 10;
		if(null == page) page = 1;
		
		query.setMaxResults(rows);
		query.setFirstResult((page - 1) * rows);
		
		List<User> userlist = query.getResultList();
		return userlist;
	}
	
	public void saveWorker(User user) throws Exception{
		if(!isHasloginname(null, user.getLoginname())){
			user.setPwd(MD5Util.md5("123456"));
			user.setId(user.getId());
			user.setWorkergroup(em.find(Workergroup.class, user.getGroupid()));
			/*Role role = em.find(Role.class, "cda54e35-5f8c-4b30-a51e-d4d6efc90438");
			List<Role> roles = new ArrayList<>();
			roles.add(role);
			user.setRoles(roles);*/
			//user.getRoles().add(em.find(Role.class, "cda54e35-5f8c-4b30-a51e-d4d6efc90438"));
			Role role = em.find(Role.class, "cda54e35-5f8c-4b30-a51e-d4d6efc90438");
			role.getUsers().add(user);
			List<Role> roles = new ArrayList<Role>();
			roles.add(role);
			user.setRoles(roles);
			em.persist(user);
			em.flush();
		}else{
			throw new Exception("新建用户的登录名 " + user.getLoginname() + " 已经存在！");
		}
	}

	@SuppressWarnings("unchecked")
	public List<Workergroup> getWorkergroup() {
		return em.createQuery("select bean from Workergroup bean ").getResultList();
	}

	public boolean saveGroup(List<Workergroup> workergroups) {
		for (Workergroup workergroup : workergroups) {
			if(workergroup.getId().equals("")){
				workergroup.setId(OrderUtil.getUUID());
				em.persist(workergroup);
			}else {
				em.find(Workergroup.class, workergroup.getId()).setGroupname(workergroup.getGroupname());
			}
		}
		return true;
	}

	public boolean updateGroup(Workergroup workergroup) {
		em.find(Workergroup.class, workergroup.getId()).setGroupname(workergroup.getGroupname());
		return true;
	}


	public void mergeWorker(User user, String workerid) throws Exception {
		if(!isHasloginname(workerid, user.getLoginname())){
			User olduser = em.find(User.class,workerid);
			olduser.setLoginname(user.getLoginname());
			olduser.setName(user.getName());
			olduser.setSex(user.getSex());
			olduser.setPhoto(user.getPhoto());
			olduser.setWorkergroup(em.find(Workergroup.class, user.getGroupid()));
		}else{
			throw new Exception("更新用户失败，登录用户名已存在！");
		}
		
	}

	public boolean moveGroup(String workerid, String groupid) {
		User user = em.find(User.class, workerid);
		user.setWorkergroup(em.find(Workergroup.class, groupid));
		return true;
	}
}
