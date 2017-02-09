package cn.easycode.yzmywx.services.shop;

import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

import cn.easycode.yzmywx.bean.eo.Customer;
import cn.easycode.yzmywx.bean.eo.shop.Cartitem;
import cn.easycode.yzmywx.bean.eo.shop.Delivery;
import cn.easycode.yzmywx.bean.eo.shop.Payment;
import cn.easycode.yzmywx.bean.eo.shop.Pevaluation;
import cn.easycode.yzmywx.bean.eo.shop.Productorder;
import cn.easycode.yzmywx.bean.eo.shop.Shipinfo;
import cn.easycode.yzmywx.bean.eo.shop.Shippercoding;
import cn.easycode.yzmywx.bean.vo.Grid;
import cn.easycode.yzmywx.bean.vo.Page;
import cn.easycode.yzmywx.bean.vo.ReturnJson;
import cn.easycode.yzmywx.bean.vo.order.ShipCartitem;
import cn.easycode.yzmywx.dao.shop.ProductOrderDao;
import cn.easycode.yzmywx.utils.ConfigUtil;
import cn.easycode.yzmywx.utils.DateUtil;
import cn.easycode.yzmywx.utils.OrderUtil;
import cn.easycode.yzmywx.utils.SecurityUtil;

@Stateless
@Path("productorder")
public class ProductOrderRest {
	@EJB
	private ProductOrderDao productOrderDao;

	//下单，未付款
	private static final short AWAITPAY = Short.parseShort(ConfigUtil.get("awaitPay"));
	//已付款，待发货
	private static final short PAID = Short.parseShort(ConfigUtil.get("paid"));
	//已发货，待签收
	private static final short SENT = Short.parseShort(ConfigUtil.get("sent"));
	//已签收，待评价
	private static final short CONFIRM = Short.parseShort(ConfigUtil.get("confirm"));
	//完成订单
	private static final short COMPLETE = Short.parseShort(ConfigUtil.get("complete"));
	//申请售后
	private static final short APPLYREFUND = Short.parseShort(ConfigUtil.get("applyRefund"));
	//售后完成
	private static final short REFUNDED = Short.parseShort(ConfigUtil.get("refunded"));
	//取消订单
	private static final short CANCELPRODUCTORDER = Short.parseShort(ConfigUtil.get("cancelProductOrder"));
	
	/**
	 * 用户下单
	 * @param shipCartitem
	 * @param request
	 * @return
	 */
	@POST
	@Path("book")
	@Consumes("application/json")
	@Produces("application/json")
	public String book(ShipCartitem shipCartitem, @Context HttpServletRequest request) {
		ReturnJson returnjson = new ReturnJson();
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute(ConfigUtil.get("customer"));
		if (customer != null) {
			try {
				List<Cartitem> cartitems = shipCartitem.getCartitems();
				Shipinfo shipinfo = shipCartitem.getShipinfo();
				
				//下单
				returnjson = productOrderDao.book(customer, cartitems, shipinfo, request);
			} catch (Exception e) {
				e.printStackTrace();
				returnjson.setMsg("下单失败！");
				returnjson.setSuccess(false);
			}
		}else {
			returnjson.setMsg("用户信息出错，下单失败！");
			returnjson.setSuccess(false);
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(returnjson);
		} catch (Exception e) {
			return "[]";
		}
	}
	
	/**
	 * 用户付款
	 * @param id
	 * @param request
	 * @return
	 */
	@POST
	@Path("pay/{id}")
	@Consumes("application/json")
	@Produces("application/json")
	public String pay(@PathParam("id") String id, @Context HttpServletRequest request) {
		ReturnJson returnjson = new ReturnJson();
		
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute(ConfigUtil.get("customer"));
		if (customer != null) {
			
			//付款Payment payment
			returnjson = productOrderDao.pay(customer, id, request);
		}else {
			returnjson.setMsg("付款失败！");
			returnjson.setSuccess(false);
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(returnjson);
		} catch (Exception e) {
			return "[]";
		}
	}
	
	/**
	 * 用户确认收货
	 * @param id
	 * @param request
	 * @return
	 */
	@POST
	@Path("confirm/{id}")
	@Consumes("application/json")
	@Produces("application/json")
	public String confirm(@PathParam("id") String id, @Context HttpServletRequest request) {
		ReturnJson returnjson = new ReturnJson();
		
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute(ConfigUtil.get("customer"));
		//确认收货
		boolean result = productOrderDao.confirm(id, customer);
		if (result) {
			returnjson.setMsg("确认成功！");
			returnjson.setSuccess(true);
		}else{
			returnjson.setMsg("确认失败！");
			returnjson.setSuccess(false);
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(returnjson);
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * 用户评价订单
	 * @param id
	 * @param pEvaluation
	 * @param request
	 * @return
	 */
	@POST
	@Path("evaluate/{id}")
	@Consumes("application/json")
	@Produces("application/json")
	public String evaluate(@PathParam("id") String id,
			Pevaluation pEvaluation, @Context HttpServletRequest request) {
		ReturnJson returnjson = new ReturnJson();
		
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute(ConfigUtil.get("customer"));
		//评价订单
		boolean result = productOrderDao.evaluate(id, pEvaluation, customer);
		if (result) {
			returnjson.setMsg("评价成功！");
			returnjson.setSuccess(true);
		}else{
			returnjson.setMsg("评价失败！");
			returnjson.setSuccess(false);
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(returnjson);
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * 用户申请售后
	 * @param productorderId
	 * @return
	 */
	@POST
	@Path("applyrefund/{id}")
	@Consumes("application/json")
	@Produces("application/json")
	public String applyrefund(@PathParam("id") String productorderId, @Context HttpServletRequest request) {
		ReturnJson returnjson = new ReturnJson();
		
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute(ConfigUtil.get("customer"));
		//申请售后
		boolean result = productOrderDao.applyrefund(productorderId, customer);
		if (result) {
			returnjson.setMsg("申请成功！");
			returnjson.setSuccess(true);
		}else{
			returnjson.setMsg("申请失败！");
			returnjson.setSuccess(false);
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(returnjson);
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * 更新发货信息
	 * @param productorderId
	 * @param delivery
	 * @param request
	 * @return
	 */
	@POST
	@Path("updateDelivery/{id}")
	@Consumes("application/json")
	@Produces("application/json")
	@Deprecated
	public ReturnJson updateDelivery(@PathParam("id") String productorderId,
			Delivery delivery, @Context HttpServletRequest request) {
		ReturnJson returnjson = new ReturnJson();
		
		HttpSession session = request.getSession();
		SecurityUtil securityUtil = new SecurityUtil(session);
		//是否有权限
		if (securityUtil.havePermission("productorder.productOrderManager.delivery")) {
			//发货
			returnjson = productOrderDao.updateDelivery(productorderId, delivery);
		}else {
			returnjson.setMsg("对不起，无权限！");
			returnjson.setSuccess(false);
		}
		return returnjson;
	}
	
	/**
	 * 获取发货信息
	 * @param id
	 * @return
	 */
	@GET
	@Path("getDelivery/{id}")
	@Produces("application/json")
	@Deprecated
	public String getDelivery(@PathParam("id") String id) {
		Productorder productorder = productOrderDao.getById(id);
		Delivery delivery = productorder.getDelivery();
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(delivery);
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * 获取支付方式
	 * @param id
	 * @return
	 */
	@GET
	@Path("getPayment/{id}")
	@Produces("application/json")
	@Deprecated
	public String getPayment(@PathParam("id") String id) {
		Productorder productorder = productOrderDao.getById(id);
		Payment payment = productorder.getPayment();
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(payment);
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * 管理员操作---》售后完成
	 * @param productorderId
	 * @return
	 */
	@POST
	@Path("refunded/{id}")
	@Consumes("application/json")
	@Produces("application/json")
	public String refunded(@PathParam("id") String productorderId) {
		ReturnJson returnjson = new ReturnJson();
		//售后完成
		boolean result = productOrderDao.refunded(productorderId);
		if (result) {
			returnjson.setMsg("售后完成！");
			returnjson.setSuccess(true);
		}else{
			returnjson.setMsg("操作失败！");
			returnjson.setSuccess(false);
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(returnjson);
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * 管理员修改订单
	 * @param Productorder
	 * @param request
	 * @return
	 */
	@POST
	@Path("update")
	@Consumes("application/json")
	@Produces("application/json")
	public String update(Productorder productorder, @Context HttpServletRequest request) {
		ReturnJson returnjson = new ReturnJson();
		
		HttpSession session = request.getSession();
		SecurityUtil securityUtil = new SecurityUtil(session);
		//是否有权限
		if (securityUtil.havePermission("productorder.productOrderManager.update")) {
		
			if (!StringUtils.isBlank(productorder.getId())) {
				Productorder old = productOrderDao.getById(productorder.getId());
				//修改的内容
				old.setTotalPrice(productorder.getTotalPrice());
				old.setTotalAmount(productorder.getTotalAmount());
				old.setOrderStatus(productorder.getOrderStatus());
				//快递信息
				old.setDelivery(productorder.getDelivery());
				
				//微信的单据要作改变
				
				boolean result = productOrderDao.merge(old);
				if (result) {
					returnjson.setMsg("更新成功！");
					returnjson.setSuccess(true);
				}else{
					returnjson.setMsg("更新失败！");
					returnjson.setSuccess(false);
				}
			}else{
				returnjson.setMsg("数据出错!");
			}
		}else {
			returnjson.setMsg("对不起，无权限！");
			returnjson.setSuccess(false);
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(returnjson);
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * 管理员删除订单
	 * @param id
	 * @param request
	 * @return
	 */
	@POST
	@Path("delete/{id}")
	@Produces("application/json")
	public String delete(@PathParam("id") String id, @Context HttpServletRequest request) {
		ReturnJson returnjson = new ReturnJson();
		HttpSession session = request.getSession();
		SecurityUtil securityUtil = new SecurityUtil(session);
		//是否有权限
		if (securityUtil.havePermission("productorder.productOrderManager.delete")) {
			boolean result = productOrderDao.delete(id);
			if (result) {
				returnjson.setMsg("删除成功！");
				returnjson.setSuccess(true);
			}else{
				returnjson.setMsg("删除失败！");
				returnjson.setSuccess(false);
			}
		}else {
			returnjson.setMsg("对不起，无权限！");
			returnjson.setSuccess(false);
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(returnjson);
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * 用户取消订单
	 * @param id
	 * @param request
	 * @return
	 */
	@POST
	@Path("cancel/{id}")
	@Produces("application/json")
	public String cancel(@PathParam("id") String id, @Context HttpServletRequest request) {
		ReturnJson returnjson = new ReturnJson();
		
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute(ConfigUtil.get("customer"));
		//用户取消此订单
		boolean result = productOrderDao.cancel(id, customer);
		if (result) {
			returnjson.setMsg("取消成功！");
			returnjson.setSuccess(true);
		}else{
			returnjson.setMsg("取消失败！");
			returnjson.setSuccess(false);
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(returnjson);
		} catch (Exception e) {
			return "[]";
		}
	}
	
	/**
	 * 发货信息
	 * @param id
	 * @return
	 */
	@GET
	@Path("getShipinfo/{id}")
	@Produces("application/json")
	@Deprecated
	public String getShipinfo(@PathParam("id") String id) {
		Productorder productorder = productOrderDao.getById(id);
		Shipinfo shipinfo = productorder.getShipinfo();
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(shipinfo);
		} catch (Exception e) {
			return "[]";
		}
	}
	
	/**
	 * 获得商品评价信息
	 * @param page
	 * @param rows
	 * @param orderSn
	 * @param dateString
	 * @param orderStatus
	 * @param contact
	 * @param phoneNum
	 * @param sort
	 * @param order
	 * @param request
	 * @return
	 */
	@POST
	@Path("getPevaluations")
	@Consumes("application/x-www-form-urlencoded")
	@Produces("application/json")
	public String getPevaluations(@FormParam("page") Integer page,@FormParam("rows") Integer rows,
			@FormParam("orderSn") String orderSn, @FormParam("date") String dateString,
			@FormParam("orderStatus") Short orderStatus,
			@FormParam("contact") String contact,@FormParam("phoneNum") String phoneNum,
			@FormParam("sort") String sort, @FormParam("order") String order,
			@Context HttpServletRequest request) {
		Grid returnjson = new Grid();
		
		HttpSession session = request.getSession();
		SecurityUtil securityUtil = new SecurityUtil(session);
		//是否有权限
		if (securityUtil.havePermission("productorder.productprderManager.delete")) {
			//拥有权限
			Date date = DateUtil.stringToDate(dateString, "yyyy-MM-dd");
			if (orderSn == null) {
				//没有包含订单序列号的
				Long total = productOrderDao.getSize(orderStatus, date, contact, phoneNum);
				if(total > 0){
					returnjson.setTotal(total);
					List<Productorder> productorders = productOrderDao.getByCondition(page, rows, orderStatus, date, contact, phoneNum, sort, order);
					
					returnjson.setRows(productorders);
				}
			}else {
				//含有订单序列号
				List<Productorder> productorders = productOrderDao.getBySn(orderSn);
				
				returnjson.setTotal(1L);
				returnjson.setRows(productorders);
			}
		}else {
			//没有权限
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(returnjson);
		} catch (Exception e) {
			return "[]";
		}
	}
	
	/**
	 * 根据订单id来获取订单信息
	 * @param id
	 * @return
	 */
	@GET
	@Path("getById/{id}")
	@Produces("application/json")
	public String getById(@PathParam("id") String id) {
		Productorder productorder = productOrderDao.getById(id);
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(productorder);
		} catch (Exception e) {
			return "[]";
		}
	}
	
	/**
	 * 根据订单序列号来获取订单信息
	 * @param sn
	 * @return
	 */
	@POST
	@Path("getBySn/{sn}")
	@Produces("application/json")
	public String getBySn(@PathParam("sn") String sn) {
		Grid returnjson = new Grid();
		List<Productorder> productorders = productOrderDao.getBySn(sn);
		
		returnjson.setTotal(1L);
		returnjson.setRows(productorders);
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(returnjson);
		} catch (Exception e) {
			return "[]";
		}
	}
	
	/**
	 * 用户获取他个人的订单
	 */
	@POST
	@Path("getCustomerOrder")
	@Consumes("application/json")
	@Produces("application/json")
	public String getCustomerOrder(Page page, @Context HttpServletRequest request) {
		Grid returnjson = new Grid();
		
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute(ConfigUtil.get("customer"));
		
		if (customer != null) {
			Long total  = productOrderDao.getCustomerOrderSize(customer.getOpenid());
			returnjson.setTotal(total);
			
			List<Productorder> productorders = productOrderDao.getByCustomer(page.getPage(), page.getRows(), null, customer.getOpenid());
			
			for (Productorder productorder : productorders) {
				//根据超时时间改变订单状态
				changeOrderStutas(productorder);
			}//end for
			
			returnjson.setRows(productorders);
		}else {
			returnjson.setTotal(0L);
			returnjson.setRows(null);
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(returnjson);
		} catch (Exception e) {
			return "[]";
		}
	}

	/**
	 * 订单分页显示
	 * @param page
	 * @param rows
	 * @param orderSn
	 * @param dateString
	 * @param orderStatus
	 * @param contact
	 * @param phoneNum
	 * @param sort
	 * @param order
	 * @param request
	 * @return
	 */
	@POST
	@Path("getList")
	@Consumes("application/x-www-form-urlencoded")
	@Produces("application/json")
	public String getList(@FormParam("page") Integer page,@FormParam("rows") Integer rows,
			@FormParam("orderSn") String orderSn, @FormParam("date") String dateString,
			@FormParam("orderStatus") Short orderStatus,
			@FormParam("contact") String contact,@FormParam("phoneNum") String phoneNum,
			@FormParam("sort") String sort, @FormParam("order") String order,
			@Context HttpServletRequest request) {
		Grid returnjson = new Grid();
		
		HttpSession session = request.getSession();
		SecurityUtil securityUtil = new SecurityUtil(session);
		//是否有权限
		if (securityUtil.havePermission("productorder.productOrderManager.getById")) {
		
			Date date = DateUtil.stringToDate(dateString, "yyyy-MM-dd");
			if (orderSn == null) {
				//没有包含订单序列号的
				Long total = productOrderDao.getSize(orderStatus, date, contact, phoneNum);
				if(total > 0){
					returnjson.setTotal(total);
					List<Productorder> productorders = productOrderDao.getByCondition(page, rows, orderStatus, date, contact, phoneNum, sort, order);
					
					for (Productorder productorder : productorders) {
						//根据超时时间改变订单状态
						changeOrderStutas(productorder);
					}
					
					returnjson.setRows(productorders);
				}
			}else {
				//含有订单序列号
				List<Productorder> productorders = productOrderDao.getBySn(orderSn);
				
				returnjson.setTotal(1L);
				returnjson.setRows(productorders);
			}
		}else {
			
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(returnjson);
		} catch (Exception e) {
			return "[]";
		}
	}
	
	@SuppressWarnings("finally")
	@POST
	@Path("getShipperlist")
	@Produces("application/json")
	public String getShipperlist(){
		List<Shippercoding> shippercodings = null;
		String returnString  =null;
		try {
			shippercodings = productOrderDao.getShippercodings();
			ObjectMapper objectMapper = new ObjectMapper();
			returnString  = objectMapper.writeValueAsString(shippercodings);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			return returnString;
		}
	}

	/**
	 * 根据超时时间改变订单状态
	 * @param productorder
	 */
	private void changeOrderStutas(Productorder productorder) {
		if (productorder.getOrderStatus() == AWAITPAY) {
			//超两小时未付款取消订单
			if (productorder.getCreatetime() < System.currentTimeMillis() - 7200000L) {
				productOrderDao.cancel(productorder);
			}
		}else if(productorder.getOrderStatus() == CONFIRM){
			//评价时间为15天，若超过十五天则自动好评
			if (productorder.getCreatetime() < System.currentTimeMillis() - 3600000*24*15) {
				Pevaluation pEvaluation = new Pevaluation();
				pEvaluation.setId(OrderUtil.getUUID());
				pEvaluation.setGrade((short)5);
				pEvaluation.setContent("好评！");
				
				productOrderDao.evaluate(pEvaluation, productorder);
			}
		}
	}
	
	
}
