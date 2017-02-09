package cn.easycode.yzmywx.services.shop;

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

import org.codehaus.jackson.map.ObjectMapper;

import cn.easycode.yzmywx.bean.eo.shop.Cartitem;
import cn.easycode.yzmywx.bean.vo.ReturnData;
import cn.easycode.yzmywx.dao.shop.CartItemDao;

@Stateless
@Path("cart")
public class CartItemRest {
	@EJB
	CartItemDao cartItemDao;
	
	@SuppressWarnings("finally")
	@POST
	@Path("addInto")
	@Consumes("application/json")
	@Produces("application/json")
	public ReturnData addIntoCart(Cartitem cartitem,@Context HttpServletRequest request){
		ReturnData returnData = new ReturnData();
		try {
			if(cartItemDao.addIntoCart(cartitem,request)){
				returnData.setErrmsg("添加成功");
				returnData.setSuccess(true);
			}else{
				returnData.setErrmsg("没有库存了...");
				returnData.setSuccess(false);
			}
		} catch (Exception e) {
			returnData.setErrmsg(e.toString());
			returnData.setSuccess(false);
		}finally{
			return returnData;
		}
	}
	
	@SuppressWarnings("finally")
	@Path("remove/{productid}")
	@POST
	@Produces("application/json")
	public ReturnData removeCartitem(@PathParam("productid") String productid){
		ReturnData returnData = new ReturnData();
		try {
			if(cartItemDao.removeCartItem(productid)){
				returnData.setErrmsg("删除成功");
				returnData.setSuccess(true);
			}else{
				returnData.setErrmsg("数据出错");
				returnData.setSuccess(false);
			}
		} catch (Exception e) {
			returnData.setErrmsg(e.toString());
			returnData.setSuccess(false);
		}finally{
			return returnData;
		}
	}
	
	@SuppressWarnings("finally")
	@Path("updateQuantity")
	@Consumes("application/json")
	@POST
	@Produces("application/json")
	public ReturnData updateQuantity(Cartitem cartitem,@Context HttpServletRequest request){
		ReturnData returnData = new ReturnData();
		try {
			if(cartItemDao.updateQuantity(cartitem.getCategoryid(), cartitem.getQuantity(),request)){
				returnData.setErrmsg("更新成功");
				returnData.setSuccess(true);
			}else{
				returnData.setErrmsg("没有库存了...");
				returnData.setSuccess(false);
			}
		} catch (Exception e) {
			returnData.setErrmsg(e.toString());
			returnData.setSuccess(false);
		}finally{
			return returnData;
		}
	}
	
	@SuppressWarnings("finally")
	@Path("getCartitems")
	@Consumes("application/json")
	@GET
	@Produces("application/json")
	public String getCartItems(@Context HttpServletRequest request){
		ObjectMapper mapper = new ObjectMapper();
		String returnString = "";
		try {
			List<Cartitem> list = cartItemDao.getCartitems(request);
			returnString =  mapper.writeValueAsString(list);
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			return returnString;
		}
	}
}
