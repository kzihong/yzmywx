package cn.easycode.yzmywx.utils;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import cn.easycode.yzmywx.bean.eo.Resource;
import cn.easycode.yzmywx.bean.eo.Role;
import cn.easycode.yzmywx.bean.eo.User;
import cn.easycode.yzmywx.bean.vo.SessionInfo;

/**
 * 用于前台页面判断是否有权限的工具类
 * 
 */
public class SecurityUtil {
	private EntityManager em;
	
	private HttpSession session;

	public SecurityUtil( ) {
		try {
			if(em == null){
				EntityManagerFactory emf = Persistence.createEntityManagerFactory("yzmywx"); 
				em = emf.createEntityManager();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public SecurityUtil(HttpSession session) {
		try {
			if(em == null){
				EntityManagerFactory emf = Persistence.createEntityManagerFactory("yzmywx"); 
				em = emf.createEntityManager();
			}
		} catch (Exception e) { }
		this.session = session;
		if(null != em){
			Object object = session.getAttribute(ConfigUtil.getSessionInfoName());
			if(null != object){
				SessionInfo sessionInfo = (SessionInfo)object;
				User user = em.find(User.class, sessionInfo.getUser().getId());
				if(null != user && !StringUtils.isBlank(user.getId())){
					sessionInfo.setUser(user);
					session.setAttribute(ConfigUtil.getSessionInfoName(),sessionInfo);
				}
			}
		}
	}

	public HttpSession getSession() {
		return session;
	}
	public void setSession(HttpSession session) {
		this.session = session;
	}
	/**
	 * 判断当前用户是否可以访问某资源
	 * 
	 * @param url
	 *            资源地址
	 * @return
	 */
	@SuppressWarnings("finally")
	public boolean havePermission(String url) {
		boolean result = false;
		try{
			Object object = session.getAttribute(ConfigUtil.getSessionInfoName());
			if(null != object){
				SessionInfo sessionInfo = (SessionInfo)object;
				User user = sessionInfo.getUser();
				if(null != user && !StringUtils.isBlank(user.getId())){
					List<Role> rolelist = user.getRoles();
					boolean flag = true;
					for(int i=0; i<rolelist.size() && flag; i++){
						for(Resource r : rolelist.get(i).getResources()){
							if(r.getResourcetype().getId().equals("1") && r.getUrl().equals(url)){
								result = true;
								flag = false;
								break;
							}
						}
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			result = false;
		}finally{
			return result;
		}
	}
}
