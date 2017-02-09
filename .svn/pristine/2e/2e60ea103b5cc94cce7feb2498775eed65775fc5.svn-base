package cn.easycode.yzmywx.services.wechat;

import java.util.Map;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;

import org.codehaus.jackson.map.ObjectMapper;

import cn.easycode.yzmywx.bean.vo.SearchData;
import cn.easycode.yzmywx.bean.vo.weixinorder.BaseResult;
import cn.easycode.yzmywx.bean.vo.weixinorder.PayResult;
import cn.easycode.yzmywx.dao.wechat.MessageDAO;
import cn.easycode.yzmywx.utils.CheckUtil;
import cn.easycode.yzmywx.utils.ConfigUtil;
import cn.easycode.yzmywx.utils.WeixinPay;
import cn.easycode.yzmywx.utils.WeixinUtil;



@Stateless
@Path("message")
public class MessageRest {
	@EJB
	MessageDAO messageDAO;
	
	@GET
	@Path("link")
	public String docheck(@Context HttpServletRequest req)
	{
		String signature = req.getParameter("signature");
		String timestamp = req.getParameter("timestamp");
		String nonce = req.getParameter("nonce");
		String echostr = req.getParameter("echostr");
		String token = ConfigUtil.get("token");
		if(CheckUtil.checkSignature(signature, timestamp, nonce,token)){
			return echostr;
		}
		else 
			return "";
	}
	
	@POST
	@SuppressWarnings("finally")
	@Path("link")
	public String acceptMsg(@Context HttpServletRequest req)
	{
		String message = null;
		try {
			Map<String, String> map = WeixinUtil.xmlToMap(req);
			message = messageDAO.handleMessage(map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			System.out.println(message);
			return message;
		}
	}
	
	@SuppressWarnings("finally")
	@Path("checkJSapi")
	@POST
	public String checkJsapi(SearchData searchData){
		ObjectMapper objectMapper = new ObjectMapper();
		String returnsString = null;
		try {
			String jsapi_ticket = messageDAO.getJSapi();
			String SignatureString = "jsapi_ticket="+jsapi_ticket;
			SignatureString +="&noncestr="+searchData.getNonceStr();
			SignatureString +="&timestamp="+searchData.getTimestap();
			SignatureString +="&url="+searchData.getUrl();
			System.out.println(SignatureString);
			searchData.setSignature(CheckUtil.getSha1(SignatureString));
			returnsString = objectMapper.writeValueAsString(searchData);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			return returnsString;
		}
	}
	
	@SuppressWarnings("finally")
	@POST
	@Path("getAddrSign")
	public String getAddrSign(SearchData searchData){
		ObjectMapper objectMapper = new ObjectMapper();
		String returnsString = null;
		try {
			String SignatureString = "accesstoken="+searchData.getAccess_token();
			SignatureString += "&appid="+searchData.getAppid();
			SignatureString +="&noncestr="+searchData.getNonceStr();
			SignatureString +="&timestamp="+searchData.getTimeStap();
			SignatureString +="&url="+searchData.getUrl();
			System.out.println(SignatureString);
			searchData.setAddrSign(CheckUtil.getSha1(SignatureString));
			returnsString = objectMapper.writeValueAsString(searchData);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			return returnsString;
		}
	}
}
