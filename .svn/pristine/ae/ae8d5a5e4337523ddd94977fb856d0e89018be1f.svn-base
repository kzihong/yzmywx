package cn.easycode.yzmywx.services.wechat;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import org.codehaus.jackson.map.ObjectMapper;

import cn.easycode.yzmywx.bean.eo.Button;
import cn.easycode.yzmywx.bean.eo.Buttontype;
import cn.easycode.yzmywx.bean.vo.ReturnData;
import cn.easycode.yzmywx.dao.wechat.MenuDao;


@Stateless
@Path("menu")
public class MenuRest {
	@EJB
	MenuDao menudao;
	
	
	@SuppressWarnings("finally")
	@POST
	@Path("get")
	@Produces("application/json")
	public String getMenuList(){
		List<cn.easycode.yzmywx.bean.eo.Button> btlist = null;
		try{
			btlist = menudao.getMlist();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(btlist);} catch (Exception e) {return null;}
		}
	}
	
	@SuppressWarnings("finally")
	@POST
	@Path("getFM")
	@Produces("application/json")
	public String getFirstMenuList(){
		List<cn.easycode.yzmywx.bean.eo.Button> btlist = null;
		try{
			btlist = menudao.getFMlist();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(btlist);} catch (Exception e) {return null;}
		}
	}
	
	@SuppressWarnings("finally")
	@POST
	@Path("getBttype")
	@Produces("application/json")
	public String getTypeList(){
		List<Buttontype> btlist = null;
		try{
			btlist = menudao.getTypelist();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(btlist);} catch (Exception e) {return null;}
		}
	}
	
	@SuppressWarnings("finally")
	@GET
	@Path("getById/{buttonid}")
	@Produces("application/json")
	public String getTypeList(@PathParam("buttonid") String buttonid){
		Button b = null;
		try{
			b = menudao.getButtonByID(buttonid);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(b);} catch (Exception e) {return null;}
		}
	}
	
	@SuppressWarnings("finally")
	@POST
	@Path("save")
	@Consumes("application/json")
	@Produces("application/json")
	public ReturnData savaButton(Button button){
		ReturnData rd = new ReturnData();
		try{
			if(menudao.savaButton(button)){
				rd.setErrcode("0");
				rd.setErrmsg("保存成功");
				rd.setSuccess(true);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			return rd;
		}
	}
	
	@SuppressWarnings("finally")
	@POST
	@Path("update")
	@Consumes("application/json")
	@Produces("application/json")
	public ReturnData updateButton(Button button){
		ReturnData rd = new ReturnData();
		try{
			if(menudao.updateButton(button)){
				rd.setErrcode("0");
				rd.setErrmsg("修改成功");
				rd.setSuccess(true);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			return rd;
		}
	}
	
	@SuppressWarnings("finally")
	@POST
	@Path("delete/{buttonid}")
	@Produces("application/json")
	public ReturnData removeButton(@PathParam("buttonid") String button){
		ReturnData rd = new ReturnData();
		try{
			if(menudao.removeButton(button)){
				rd.setErrcode("0");
				rd.setErrmsg("删除成功");
				rd.setSuccess(true);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			return rd;
		}
	}
	
	@SuppressWarnings("finally")
	@POST
	@Path("sync")
	@Produces("application/json")
	public ReturnData syncMtoW(){
		ReturnData rd = new ReturnData();
		try{
			String errcode = menudao.syncMtoW();
			if(errcode.equals("0")){
				rd.setErrcode("0");
				rd.setErrmsg("同步成功");
				rd.setSuccess(true);
			}else{
				rd.setErrcode(errcode);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			return rd;
		}
	}
}
