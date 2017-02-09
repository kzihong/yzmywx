package cn.easycode.yzmywx.dao.wechat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import net.sf.json.JSONObject;
import cn.easycode.yzmywx.bean.eo.Accesstoken;
import cn.easycode.yzmywx.bean.eo.Button;
import cn.easycode.yzmywx.bean.eo.Buttontype;
import cn.easycode.yzmywx.bean.vo.wechat.Menuvo;
import cn.easycode.yzmywx.utils.ConfigUtil;
import cn.easycode.yzmywx.utils.WeixinUtil;


@Stateless
public class MenuDao {
	@PersistenceContext(unitName = "yzmywx")
	private EntityManager em;
	
		
	//获得accesstoken
	public String getAT() throws Exception{
		Accesstoken at = em.find(Accesstoken.class, "1");
		if(at != null){
			if(new Date().getTime() - at.getCreatetime().getTime() < 1000*3600){
				return at.getToken();
			}else{
				at.setCreatetime(new Date());
				at.setToken(WeixinUtil.getAccessToken(ConfigUtil.get("appid"),ConfigUtil.get("appsecret")));
				em.merge(at);
				return at.getToken();
			}
		}else{
			at = new Accesstoken();
			at.setCreatetime(new Date());
			at.setToken(WeixinUtil.getAccessToken(ConfigUtil.get("appid"),ConfigUtil.get("appsecret")));
			at.setId("1");
			em.persist(at);
			return at.getToken();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Button> getMlist() throws Exception{
		Query query = em.createQuery("select b from Button b ");
		List<Button> list = query.getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Button> getFMlist() throws Exception{
		Query query = em.createQuery("select b from Button b where b.pid = '0' ");
		List<Button> list = query.getResultList();
		return list;
	}

	public List<Buttontype> getTypelist() throws Exception{
		Query query = em.createQuery("select b from Buttontype b ");
		@SuppressWarnings("unchecked")
		List<Buttontype> list = query.getResultList();
		return list;
	}

	public Button getButtonByID(String buttonid) throws Exception{
		return em.find(Button.class, buttonid);
	}

	public boolean savaButton(Button button) throws Exception{
		button.setButtontype(em.find(Buttontype.class, button.getTypeid()));
		button.setId(UUID.randomUUID().toString());
		em.persist(button);
		return true;
	}
	
	public boolean updateButton(Button button) throws Exception{
		Button old = em.find(Button.class, button.getId());
		old.setBtkey(button.getBtkey());
		old.setButtontype(em.find(Buttontype.class, button.getTypeid()));
		old.setMediaid(button.getMediaid());
		old.setName(button.getName());
		old.setPid(button.getPid());
		old.setUrl(button.getUrl());
		return true;
	}

	public boolean removeButton(String button) throws Exception{
		em.remove(em.find(Button.class, button));
		return true;
	}

	@SuppressWarnings("unchecked")
	public String syncMtoW() throws Exception{
		String jpql = "select button from Button button where button.pid = '0'";
		Query query = em.createQuery(jpql);
		List<Button> list_eo = query.getResultList();
		cn.easycode.yzmywx.bean.vo.wechat.Button button_vo = null;
		cn.easycode.yzmywx.bean.vo.wechat.Button subbutton_vo = null;
		List<cn.easycode.yzmywx.bean.vo.wechat.Button> subbutton_list = new ArrayList<cn.easycode.yzmywx.bean.vo.wechat.Button>();
		List<cn.easycode.yzmywx.bean.vo.wechat.Button> button_vo_list = new ArrayList<cn.easycode.yzmywx.bean.vo.wechat.Button>();
		Menuvo menu = new Menuvo();
		if(list_eo.size() >0){
			for(int i = 0 ; i < list_eo.size() ; i++){
				button_vo = new cn.easycode.yzmywx.bean.vo.wechat.Button ();
				if(list_eo.get(i).getBtkey() != null && !list_eo.get(i).getBtkey().equals("")){
					button_vo.setKey(list_eo.get(i).getBtkey());
				}
				if(list_eo.get(i).getMediaid() != null && !list_eo.get(i).getMediaid().equals("")){
					button_vo.setMedia_id(list_eo.get(i).getMediaid());
				}
				if(list_eo.get(i).getName() != null && !list_eo.get(i).getName().equals("")){
					button_vo.setName(list_eo.get(i).getName());
				}
				if(list_eo.get(i).getButtontype().getTypename() != null && !list_eo.get(i).getButtontype().getTypename().equals("")){
					button_vo.setType(list_eo.get(i).getButtontype().getTypename());
				}
				if(list_eo.get(i).getUrl() != null && !list_eo.get(i).getUrl().equals("")){
					button_vo.setUrl(list_eo.get(i).getUrl());
				}
				String jpql_pid = "select button from Button button where button.pid = :pid";
				Query query_pid = em.createQuery(jpql_pid);
				query_pid.setParameter("pid", list_eo.get(i).getId());
				List<Button> sub_button_eo = query_pid.getResultList();
				if(sub_button_eo.size() > 0 ){
					for(int j = 0 ; j < sub_button_eo.size() ; j++){
						subbutton_vo = new cn.easycode.yzmywx.bean.vo.wechat.Button();
						if(sub_button_eo.get(j).getBtkey() != null && !sub_button_eo.get(j).getBtkey().equals("")){
							subbutton_vo.setKey(sub_button_eo.get(j).getBtkey());
						}
						if(sub_button_eo.get(j).getMediaid() != null && !sub_button_eo.get(j).getMediaid().equals("")){
							subbutton_vo.setMedia_id(sub_button_eo.get(j).getMediaid());
						}
						if(sub_button_eo.get(j).getName() != null && !sub_button_eo.get(j).getName().equals("")){
							subbutton_vo.setName(sub_button_eo.get(j).getName());
						}
						if(sub_button_eo.get(j).getButtontype().getTypename() != null && !sub_button_eo.get(j).getButtontype().getTypename().equals("")){
							subbutton_vo.setType(sub_button_eo.get(j).getButtontype().getTypename());
						}
						if(sub_button_eo.get(j).getUrl() != null && !sub_button_eo.get(j).getUrl().equals("")){
							subbutton_vo.setUrl(sub_button_eo.get(j).getUrl());
						}
							subbutton_list.add(subbutton_vo);
					}
					button_vo.setSub_button(subbutton_list);
					subbutton_list = new ArrayList<cn.easycode.yzmywx.bean.vo.wechat.Button>();
				}
				button_vo_list.add(button_vo);
			}
			menu.setButton(button_vo_list);
			String postStr = JSONObject.fromObject(menu).toString();
			System.out.println(postStr);
			String accesstoken = getAT();
			String url = ConfigUtil.get("creatmenuurl").replace("ACCESS_TOKEN",accesstoken) ;
			JSONObject jo = WeixinUtil.doPostStr(url, postStr);
			System.out.println(jo.toString());
			if(jo.toString().indexOf("ok") >= 0){
				return "0";
			}else{
				return jo.getString("errcode");
			}
		}else{
			return null;
		}
	}
	

}
