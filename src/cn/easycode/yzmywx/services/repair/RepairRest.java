package cn.easycode.yzmywx.services.repair;

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

import org.codehaus.jackson.map.ObjectMapper;

import cn.easycode.yzmywx.bean.eo.Customer;
import cn.easycode.yzmywx.bean.eo.Evaluation;
import cn.easycode.yzmywx.bean.eo.Repairorder;
import cn.easycode.yzmywx.bean.vo.Grid;
import cn.easycode.yzmywx.bean.vo.ReturnData;
import cn.easycode.yzmywx.bean.vo.order.Orders;
import cn.easycode.yzmywx.dao.repair.RepairDao;
import cn.easycode.yzmywx.utils.ConfigUtil;

@Stateless
@Path("repair")
public class RepairRest {
	@EJB
	RepairDao repairDao;
	
	
	/**
	 * 保存订单
	 * @param repairorder
	 * @return
	 */
	@SuppressWarnings("finally")
	@Path("savaRepairOrder")
	@POST
	@Produces("application/json")
	@Consumes("application/json")
	public ReturnData savaOrder(Repairorder repairorder,@Context HttpServletRequest request){
		ReturnData returnData = new ReturnData();
		try {
			if(repairorder != null){
				String result = repairDao.savaOrder(repairorder,request);
				if(!result.equals("false")){
					returnData.setSuccess(true);
					returnData.setErrmsg(result);
				}else{
					returnData.setSuccess(false);
					returnData.setErrmsg("保存失败");
				}
			}else{
				returnData.setSuccess(false);
				returnData.setErrmsg("传入数据失败");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			returnData.setSuccess(false);
			returnData.setErrmsg(e.toString());
		}finally{
			return returnData;
		}
	}
	
	/**
	 * 消费者取消订单
	 * 
	 */
	@SuppressWarnings("finally")
	@Path("cancelRepairOrder/{orderid}")
	@POST
	@Produces("application/json")
	public ReturnData cancelOrder(@PathParam("orderid") String orderid,@Context HttpServletRequest request){
		ReturnData returnData = new ReturnData();
		try {
			if(orderid == null && "".equals(orderid)){
				returnData.setSuccess(false);
				returnData.setErrmsg("路径出错");
			}else{
				if(repairDao.cancelOrder(orderid)){
					returnData.setSuccess(true);
					returnData.setErrmsg("取消订单成功");
				}else{
					returnData.setSuccess(false);
					returnData.setErrmsg("取消订单失败，订单已是取消状态！");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			returnData.setSuccess(false);
			returnData.setErrmsg(e.toString());
		}finally{
			return returnData;
		}
	}
	
	
	/**
	 * 后台管理系统中，管理员给维修工人分配修理订单
	 * @param List<RepairO>
	 * @return
	 */
	@SuppressWarnings("finally")
	@Path("assignRepairOrder")
	@POST
	@Produces("application/json")
	@Consumes("application/json")
	public ReturnData assignOrder(Orders orders,@Context HttpServletRequest request){
		ReturnData returnData = new ReturnData();
		try {
			if(orders.getOrders().size() > 0 ){
				if(repairDao.assignOrder(orders.getOrders(),orders.getUserid())){
					returnData.setSuccess(true);
					returnData.setErrmsg("派单成功");
				}else{
					returnData.setSuccess(false);
					returnData.setErrmsg("失败");
				}
			}else{
				returnData.setSuccess(false);
				returnData.setErrmsg("失败");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			returnData.setSuccess(false);
			returnData.setErrmsg(e.toString());
		}finally{
			return returnData;
		}
	}
	
	
	@SuppressWarnings("finally")
	@Path("setFinish/{orderid}")
	@POST
	@Produces("application/json")
	public ReturnData setFinish(@PathParam("orderid") String orderid){
		ReturnData returnData = new ReturnData();
		try {
			if(orderid == null){
				returnData.setSuccess(false);
				returnData.setErrmsg("路径出错");
			}else{
				if(repairDao.setFinish(orderid)){
					returnData.setSuccess(true);
					returnData.setErrmsg("修改成功");
				}else{
					returnData.setSuccess(false);
					returnData.setErrmsg("修改失败");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			returnData.setSuccess(false);
			returnData.setErrmsg(e.toString());
		}finally{
			return returnData;
		}
	}
	
	
	/**
	 * 对订单进行评价
	 * @param repairorder
	 * @return
	 */
	@SuppressWarnings("finally")
	@Path("setEvaluation")
	@POST
	@Produces("application/json")
	@Consumes("application/json")
	public ReturnData savaEvaluation(Evaluation evaluation,@Context HttpServletRequest request){
		ReturnData returnData = new ReturnData();
		try {
			if(evaluation == null){
				returnData.setSuccess(false);
				returnData.setErrmsg("传入数据为空");
			}else{
				if(repairDao.saveEvaluation(evaluation,request)){
					returnData.setSuccess(true);
					returnData.setErrmsg("保存成功");
				}else{
					returnData.setSuccess(false);
					returnData.setErrmsg("传入数据为空");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			returnData.setSuccess(false);
			returnData.setErrmsg(e.toString());
		}finally{
			return returnData;
		}
	}
	
	/**
	 * 查询不同状态的订单
	 * @param repairorder
	 * @return
	 */
	@SuppressWarnings("finally")
	@Path("queryOrder/{orderStatus}")
	@GET
	@Produces("application/json")
	public String queryOrder(@PathParam("orderStatus") String orderStatus){
		ReturnData returnData = new ReturnData();
		try {
			if("all".equals(orderStatus)){
				orderStatus = "";
			}else if(orderStatus.equals("cancel")){
				orderStatus = ConfigUtil.get("cancel");
			}else if(orderStatus.equals("finish")){
				orderStatus = ConfigUtil.get("finish");
			}else if(orderStatus.equals("nonEvaluation")){
				orderStatus = ConfigUtil.get("nonEvaluation");
			}else if(orderStatus.equals("Handled")){
				orderStatus = ConfigUtil.get("Handled");
			}else if(orderStatus.equals("nonHandled")){
				orderStatus = ConfigUtil.get("nonHandled");
			}else if(orderStatus.equals("Handling")){
				orderStatus = ConfigUtil.get("Handling");
			}else{
				returnData.setSuccess(false);
				returnData.setErrmsg("非法查询");
				ObjectMapper mapper = new ObjectMapper();
				try {return mapper.writeValueAsString(returnData);} catch (Exception e) {return e.toString();}
			}
			returnData.setList(repairDao.queryOrders(orderStatus));
			returnData.setSuccess(true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			returnData.setSuccess(false);
			returnData.setErrmsg(e.toString());
		}finally{
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(returnData);} catch (Exception e) {e.printStackTrace();return e.toString();}
		}
	}
	
	@SuppressWarnings("finally")
	@Path("queryOrderBC/{orderStatus}")
	@GET
	@Produces("application/json")
	public String queryOrderByCustomer(@PathParam("orderStatus") String orderStatus,
			@Context HttpServletRequest request){
		request.getSession().setAttribute("customer", "oQ1HdvgOqUiH8rdMPgSrleM5l8tc");
		ReturnData returnData = new ReturnData();
		try {
			if("all".equals(orderStatus)){
				orderStatus = "";
			}else if(orderStatus.equals("cancel")){
				orderStatus = ConfigUtil.get("cancel");
			}else if(orderStatus.equals("finish")){
				orderStatus = ConfigUtil.get("finish");
			}else if(orderStatus.equals("nonEvaluation")){
				orderStatus = ConfigUtil.get("nonEvaluation");
			}else if(orderStatus.equals("Handled")){
				orderStatus = ConfigUtil.get("Handled");
			}else if(orderStatus.equals("nonHandled")){
				orderStatus = ConfigUtil.get("nonHandled");
			}else if(orderStatus.equals("Handling")){
				orderStatus = ConfigUtil.get("Handling");
			}else{
				returnData.setSuccess(false);
				returnData.setErrmsg("非法查询");
				ObjectMapper mapper = new ObjectMapper();
				try {return mapper.writeValueAsString(returnData);} catch (Exception e) {e.printStackTrace();return e.toString();}
			}
			returnData.setList(repairDao.queryOrdersBC(orderStatus,request));
			returnData.setSuccess(true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			returnData.setSuccess(false);
			returnData.setErrmsg(e.toString());
		}finally{
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(returnData);} catch (Exception e) {e.printStackTrace();return e.toString();}
		}
	}
	
	@SuppressWarnings("finally")
	@Path("queryOrderBU/{userid}/{orderStatus}")
	@GET
	@Produces("application/json")
	public String queryOrderByUser(@PathParam("userid") String userid,@PathParam("orderStatus") String orderStatus){
		ReturnData returnData = new ReturnData();
		try {
			if("all".equals(orderStatus)){
				orderStatus = "";
			}else if(orderStatus.equals("nonEvaluation")){
				orderStatus = ConfigUtil.get("nonEvaluation");
				//修完了么么哒
			}else if(orderStatus.equals("Handled")){
				orderStatus = ConfigUtil.get("Handled");
				//未修理订单
			}else{
				returnData.setSuccess(false);
				returnData.setErrmsg("非法查询");
				ObjectMapper mapper = new ObjectMapper();
				try {return mapper.writeValueAsString(returnData);} catch (Exception e) {e.printStackTrace();return e.toString();}
			}
			returnData.setList(repairDao.queryOrdersBU(userid,orderStatus));
			returnData.setSuccess(true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			returnData.setSuccess(false);
			returnData.setErrmsg(e.toString());
		}finally{
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(returnData);} catch (Exception e) {e.printStackTrace();return e.toString();}
		}
	}
	
	/**
	 * 查询不同等级的评价
	 * @param repairorder
	 * @return
	 */
	@SuppressWarnings("finally")
	@Path("queryEvaluation/{level}")
	@GET
	@Produces("application/json")
	public String queryEvaluation(@PathParam("level") String level){
		ReturnData returnData = new ReturnData();
		try {
			if("all".equals(level)){
				level = "";
			}else if(level.equals("OneStar")){
				level = ConfigUtil.get("OneStar");
			}else if(level.equals("TwoStar")){
				level = ConfigUtil.get("TwoStar");
			}else if(level.equals("ThreeStar")){
				level = ConfigUtil.get("ThreeStar");
			}else if(level.equals("FourStar")){
				level = ConfigUtil.get("FourStar");
			}else if(level.equals("FiveStar")){
				level = ConfigUtil.get("FiveStar");
			}else{
				returnData.setSuccess(false);
				returnData.setErrmsg("非法查询");
				ObjectMapper mapper = new ObjectMapper();
				try {return mapper.writeValueAsString(returnData);} catch (Exception e) {return null;}
			}
			returnData.setList(repairDao.queryEvaluation(level));
			returnData.setSuccess(true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			returnData.setSuccess(false);
			returnData.setErrmsg(e.toString());
		}finally{
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(returnData);} catch (Exception e) {return null;}
		}
	}
	
	/**
	 * 查询不同工人的评价
	 * @param repairorder
	 * @return
	 */
	@SuppressWarnings("finally")
	@Path("queryEvaluationByUserid/{userid}")
	@GET
	@Produces("application/json")
	public String queryEvaluationBU(@PathParam("userid") String userid){
		ReturnData returnData = new ReturnData();
		try {
			if(userid == null){
				returnData.setSuccess(false);
				returnData.setErrmsg("传入为空");
			}else{
				List<Evaluation> list = repairDao.queryEvaluationBU(userid);
				if(list ==null){
					returnData.setSuccess(false);
					returnData.setErrmsg("非法查询");
				}else{
					returnData.setList(list);
					returnData.setSuccess(true);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			returnData.setSuccess(false);
			returnData.setErrmsg(e.toString());
		}finally{
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(returnData);} catch (Exception e) {return null;}
		}
	}
	
	@SuppressWarnings("finally")
	@POST
	@Path("getLocation")
	@Produces("application/json")
	public Customer getLocation(@Context HttpServletRequest request){
		Customer customer = null;
		try {
			String openidString = (String)request.getSession().getAttribute("customer");
			customer = repairDao.getLocation(openidString);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			return customer;
		}
	}
		
	@SuppressWarnings("finally")
	@POST
	@Path("orderList")
	@Consumes("application/x-www-form-urlencoded")
	@Produces("application/json")
	public String getUserList(@FormParam("page") Integer page, @FormParam("rows") Integer rows,
			@FormParam("orderStatus") Short orderStatus,
			@FormParam("username") String username, @FormParam("customername") String customername,
			@FormParam("orderSn") Long orderSn) {
		Grid returnjson = new Grid();
		try{
			Long total = repairDao.getListTotal(orderStatus,username,customername,orderSn);
			if(total > 0){
				returnjson.setTotal(total);
				returnjson.setRows(repairDao.getOrderList(page,rows,orderStatus,orderSn,username,customername));
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
	@Path("evaluationList")
	@Consumes("application/x-www-form-urlencoded")
	@Produces("application/json")
	public String getEvaluationList(@FormParam("page") Integer page, @FormParam("rows") Integer rows,
			@FormParam("level") Short level,
			@FormParam("username") String username, @FormParam("customername") String customername){
		Grid returnjson = new Grid();
		try{
			Long total = repairDao.getEvaluationListTotal(username,customername,level);
			if(total > 0){
				returnjson.setTotal(total);
				returnjson.setRows(repairDao.getEvaluationList(page,rows,username,customername,level));
			}
		}catch(Exception e){
			returnjson = new Grid();
		}finally{
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(returnjson);} catch (Exception e) {return "[]";}
		}
	}
	
	@SuppressWarnings("finally")
	@Path("queryPersonalOrder")
	@GET
	@Produces("application/json")
	public String gerPersonalOrder(@Context HttpServletRequest request){
		List<Repairorder> repairorders = null;
		try {
			repairorders = repairDao.getPersonOrder(request);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(repairorders);} catch (Exception e) {return "[]";}
		}
	}
	
	@SuppressWarnings("finally")
	@Path("getByOrderId/{id}")
	@GET
	@Produces("application/json")
	public String getByOrderId(@PathParam("id") String orderid){
		Repairorder repairorder = null;
		try {
			repairorder = repairDao.getByOrderId(orderid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ObjectMapper mapper = new ObjectMapper();
			try {return mapper.writeValueAsString(repairorder);} catch (Exception e) {return "{}";}
		}
	}
	
	@GET
	@Path("setCoding")
	public String setCodingString(){
		if(repairDao.setCoding()){
			return "success";
		}else{
			return "fail";
		}
	}
}

