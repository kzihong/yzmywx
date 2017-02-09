package cn.easycode.yzmywx.services.wechat;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;

import cn.easycode.yzmywx.bean.eo.shop.Payment;
import cn.easycode.yzmywx.bean.eo.shop.Paymenttype;
import cn.easycode.yzmywx.bean.eo.shop.Productorder;
import cn.easycode.yzmywx.bean.vo.weixinorder.BaseResult;
import cn.easycode.yzmywx.bean.vo.weixinorder.PayResult;
import cn.easycode.yzmywx.dao.shop.ProductOrderDao;
import cn.easycode.yzmywx.utils.OrderUtil;
import cn.easycode.yzmywx.utils.WeixinPay;

/**
 * 
 * 商户订单回调接口
 * @author caimengyuan
 *
 */
@Stateless
@Path("notify")
public class NotifyRest {
	@EJB
	ProductOrderDao productOrderDao;
	
	@POST
	@Path("payback")
	public String payback(@Context HttpServletRequest req)
	{
		BaseResult baseResult = new BaseResult();
		try {
			PayResult payResult = WeixinPay.payback(req.getInputStream());
			//通知参数
			if ("SUCCESS".equals(payResult.getReturn_code())) {
				//业务结果
				if ("SUCCESS".equals(payResult.getResult_code())) {
					//商品订单号
					String orderSn = payResult.getOut_trade_no();
					
					List<Productorder> list = productOrderDao.getBySn(orderSn);
					Productorder productorder = list.get(0);
					
					//客户id
					assert( payResult.getOpenid().equals(productorder.getCustomer().getOpenid()) );
					//订单金额
					assert(payResult.getTotal_fee() == productorder.getTotalPrice()*100);
					
					Paymenttype paymenttype = new Paymenttype();
					paymenttype.setId("2001");
					paymenttype.setName("微信支付");
					
					Payment payment = new Payment();//暂时这样写
					payment.setPaymenttype(paymenttype);
					
					//付款的id
					payment.setId(OrderUtil.getUUID());
					payment.setCreatetime(System.currentTimeMillis());
					
					productorder.setPayment(payment);
					
					productorder.setOrderStatus(ProductOrderDao.PAID);
					productOrderDao.merge(productorder);
				}else {
					baseResult.setReturn_code(payResult.getResult_code());
					baseResult.setReturn_msg(payResult.getErr_code_des());
				}
			}else {
				baseResult.setReturn_code(payResult.getReturn_code());
				baseResult.setReturn_msg(payResult.getReturn_msg());
			}
		} catch (Exception e) {
			baseResult.setReturn_code("FAIL");
			baseResult.setReturn_msg("参数格式校验错误");
			e.printStackTrace();
		}
		return WeixinPay.objectToXml(baseResult);
	}
	
	/**
	 * 向微信查询订单
	 * @param orderSn
	 * @param request
	 * @return
	 */
	/*@POST
	@Path("checkorder/{orderSn}")
	@Consumes("application/json")
	@Produces("application/json")
	public String checkorder(@PathParam("orderSn") String orderSn, @Context HttpServletRequest request) {
		ReturnJson returnjson = new ReturnJson();
		
		HttpSession session = request.getSession();
		SecurityUtil securityUtil = new SecurityUtil(session);
		//是否有权限
		if (securityUtil.havePermission("productorder.productOrderManager.delivery")) {
			Orderquery orderquery = new Orderquery();
			orderquery.setAppid(ConfigUtil.get("appid"));
			orderquery.setMch_id(ConfigUtil.get("mchid"));
			orderquery.setNonce_str(OrderUtil.getUUID());//随机串
			orderquery.setOut_trade_no(orderSn);
			
			//拼凑签名信息
			StringBuilder sb = new StringBuilder();
			sb.append("appid="+orderquery.getAppid())//
				.append("&mch_id="+orderquery.getMch_id())//
				.append("&nonce_str="+orderquery.getNonce_str())//
				.append("&out_trade_no="+orderquery.getOut_trade_no())//
				.append("&key="+ConfigUtil.get("signkey"));
			//签名
			orderquery.setSign(MD5Util.MD5Encode(sb.toString(),"UTF-8").toUpperCase());
			
			try {
				OrderqueryResult orderqueryResult = WeixinPay.getResult(orderquery);
				//返回状态码
				if ("SUCCESS".equals(orderqueryResult.getReturn_code())) {
					//业务结果
					if ("SUCCESS".equals(orderqueryResult.getResult_code())) {
						
						returnjson.setSuccess(true);
						returnjson.setMsg("订单信息获取成功");
						returnjson.setObj(orderqueryResult);
					}else {
						returnjson.setSuccess(false);
						returnjson.setMsg(orderqueryResult.getErr_code_des());
					}
				}else {
					returnjson.setSuccess(false);
					returnjson.setMsg(orderqueryResult.getReturn_msg());
				}
				
			} catch (Exception e) {
				returnjson.setSuccess(false);
				returnjson.setMsg(e.toString());
				e.printStackTrace();
			}
			
		}else {
			returnjson.setMsg("对不起，无权限！");
			returnjson.setSuccess(false);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(returnjson);
		} catch (Exception e) {
			return "[]";
		}
	}
	
	*//**
	 * 向微信关闭订单
	 * @param orderSn
	 * @param request
	 * @return
	 *//*
	@POST
	@Path("closeorder/{orderSn}")
	@Consumes("application/json")
	@Produces("application/json")
	public String closeorder(@PathParam("orderSn") String orderSn, @Context HttpServletRequest request) {
		ReturnJson returnjson = new ReturnJson();
		
		HttpSession session = request.getSession();
		SecurityUtil securityUtil = new SecurityUtil(session);
		//是否有权限
		if (securityUtil.havePermission("productorder.productOrderManager.delivery")) {
			Closeorder closeorder = new Closeorder();
			closeorder.setAppid(ConfigUtil.get("appid"));
			closeorder.setMch_id(ConfigUtil.get("mchid"));
			closeorder.setNonce_str(OrderUtil.getUUID());//随机串
			closeorder.setOut_trade_no(orderSn);
			
			//拼凑签名信息
			StringBuilder sb = new StringBuilder();
			sb.append("appid="+closeorder.getAppid())//
				.append("&mch_id="+closeorder.getMch_id())//
				.append("&nonce_str="+closeorder.getNonce_str())//
				.append("&out_trade_no="+closeorder.getOut_trade_no())//
				.append("&key="+ConfigUtil.get("signkey"));
			//签名
			closeorder.setSign(MD5Util.MD5Encode(sb.toString(),"UTF-8").toUpperCase());
			
			try {
				CloseorderResult closeorderResult = WeixinPay.getResult(closeorder);
				//返回状态码
				if ("SUCCESS".equals(closeorderResult.getReturn_code())) {
					returnjson.setSuccess(true);
					returnjson.setMsg("关闭订单成功");
					returnjson.setObj(closeorderResult.getErr_code_des());
				}else {
					returnjson.setSuccess(false);
					returnjson.setMsg(closeorderResult.getReturn_msg());
				}
				
			} catch (Exception e) {
				returnjson.setSuccess(false);
				returnjson.setMsg(e.toString());
				e.printStackTrace();
			}
			
		}else {
			returnjson.setMsg("对不起，无权限！");
			returnjson.setSuccess(false);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(returnjson);
		} catch (Exception e) {
			return "[]";
		}
	}
	
	*//**
	 * 向微信申请退款
	 * @param orderSn
	 * @param request
	 * @return
	 *//*
	@POST
	@Path("refundorder/{orderSn}")
	@Consumes("application/json")
	@Produces("application/json")
	public String refundorder(@PathParam("orderSn") String orderSn, @Context HttpServletRequest request) {
		ReturnJson returnjson = new ReturnJson();
		
		HttpSession session = request.getSession();
		SecurityUtil securityUtil = new SecurityUtil(session);
		//是否有权限
		if (securityUtil.havePermission("productorder.productOrderManager.delivery")) {
			
			List<Productorder> productorders = productOrderDao.getBySn(orderSn);
			Productorder productorder = productorders.get(0);
			
			float totalPrice = productorder.getTotalPrice();
			
			Refund refund = new Refund();
			refund.setAppid(ConfigUtil.get("appid"));
			refund.setMch_id(ConfigUtil.get("mchid"));
			refund.setNonce_str(OrderUtil.getUUID());//随机串
			refund.setOut_trade_no(orderSn);
			refund.setOut_refund_no(OrderUtil.getSn());//退单号
			refund.setTotal_fee((int)(totalPrice*100));//总金额
			refund.setRefund_fee((int)(totalPrice*100));//退款金额
			refund.setRefund_fee_type("CNY");
			refund.setOp_user_id(ConfigUtil.get("mchid"));
			
			//拼凑签名信息
			StringBuilder sb = new StringBuilder();
			sb.append("appid="+refund.getAppid())//
				.append("&mch_id="+refund.getMch_id())//
				.append("&nonce_str="+refund.getNonce_str())//
				.append("&op_user_id="+refund.getOp_user_id())//
				.append("&out_refund_no="+refund.getOut_refund_no())//
				.append("&out_trade_no="+refund.getOut_trade_no())//
				.append("&refund_fee="+refund.getRefund_fee())//
				.append("&refund_fee_type="+refund.getRefund_fee_type())//
				.append("&total_fee="+refund.getTotal_fee())//
				.append("&key="+ConfigUtil.get("signkey"));
			//签名
			refund.setSign(MD5Util.MD5Encode(sb.toString(),"UTF-8").toUpperCase());
			
			try {
				RefundResult refundResult = WeixinPay.getResult(refund);
				//返回状态码
				if ("SUCCESS".equals(refundResult.getReturn_code())) {
					//业务结果
					if ("SUCCESS".equals(refundResult.getResult_code())) {
						
						returnjson.setSuccess(true);
						returnjson.setMsg("申请退款成功");
						returnjson.setObj(refundResult);
					}else {
						returnjson.setSuccess(false);
						returnjson.setMsg(refundResult.getErr_code_des());
					}
				}else {
					returnjson.setSuccess(false);
					returnjson.setMsg(refundResult.getReturn_msg());
				}
				
			} catch (Exception e) {
				returnjson.setSuccess(false);
				returnjson.setMsg(e.toString());
				e.printStackTrace();
			}
			
		}else {
			returnjson.setMsg("对不起，无权限！");
			returnjson.setSuccess(false);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(returnjson);
		} catch (Exception e) {
			return "[]";
		}
	}
	
	*//**
	 * 向微信查询退款
	 * @param orderSn
	 * @param request
	 * @return
	 *//*
	@POST
	@Path("refundquery/{orderSn}")
	@Consumes("application/json")
	@Produces("application/json")
	public String refundquery(@PathParam("orderSn") String orderSn, @Context HttpServletRequest request) {
		ReturnJson returnjson = new ReturnJson();
		
		HttpSession session = request.getSession();
		SecurityUtil securityUtil = new SecurityUtil(session);
		//是否有权限
		if (securityUtil.havePermission("productorder.productOrderManager.delivery")) {
			
			Refundquery refundquery = new Refundquery();
			refundquery.setAppid(ConfigUtil.get("appid"));
			refundquery.setMch_id(ConfigUtil.get("mchid"));
			refundquery.setNonce_str(OrderUtil.getUUID());//随机串
			refundquery.setOut_trade_no(orderSn);
			
			//拼凑签名信息
			StringBuilder sb = new StringBuilder();
			sb.append("appid="+refundquery.getAppid())//
				.append("&mch_id="+refundquery.getMch_id())//
				.append("&nonce_str="+refundquery.getNonce_str())//
				.append("&out_trade_no="+refundquery.getOut_trade_no())//
				.append("&key="+ConfigUtil.get("signkey"));
			//签名
			refundquery.setSign(MD5Util.MD5Encode(sb.toString(),"UTF-8").toUpperCase());
			
			try {
				RefundqueryResult refundqueryResult = WeixinPay.getResult(refundquery);
				//返回状态码
				if ("SUCCESS".equals(refundqueryResult.getReturn_code())) {
					//业务结果
					if ("SUCCESS".equals(refundqueryResult.getResult_code())) {
						
						returnjson.setSuccess(true);
						returnjson.setMsg("申请退款成功");
						returnjson.setObj(refundqueryResult);
					}else {
						returnjson.setSuccess(false);
						returnjson.setMsg(refundqueryResult.getErr_code_des());
					}
				}else {
					returnjson.setSuccess(false);
					returnjson.setMsg(refundqueryResult.getReturn_msg());
				}
				
			} catch (Exception e) {
				returnjson.setSuccess(false);
				returnjson.setMsg(e.toString());
				e.printStackTrace();
			}
			
		}else {
			returnjson.setMsg("对不起，无权限！");
			returnjson.setSuccess(false);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(returnjson);
		} catch (Exception e) {
			return "[]";
		}
	}
	
	*//**
	 * 向微信下载对账单
	 * @param orderSn
	 * @param request
	 * @return
	 *//*
	@POST
	@Path("downloadbill/{orderSn}/{bill_type}")
	@Consumes("application/json")
	@Produces("application/json")
	public byte[] downloadbill(@PathParam("orderSn") String orderSn, @PathParam("bill_type") String bill_type, @Context HttpServletRequest request) {
		
		byte[] b = null;
		
		HttpSession session = request.getSession();
		SecurityUtil securityUtil = new SecurityUtil(session);
		//是否有权限
		if (securityUtil.havePermission("productorder.productOrderManager.delivery")) {
			
			//ALL，返回当日所有订单信息，默认值
			if (null == bill_type || "".equals(bill_type)) {
				bill_type = "ALL";
			}
			Downloadbill downloadbill = new Downloadbill();
			downloadbill.setAppid(ConfigUtil.get("appid"));
			downloadbill.setMch_id(ConfigUtil.get("mchid"));
			downloadbill.setNonce_str(OrderUtil.getUUID());//随机串
			downloadbill.setBill_date(DateUtil.dateToString(new Date(),"yyyyMMdd"));
			downloadbill.setBill_type(bill_type);
			
			//拼凑签名信息
			StringBuilder sb = new StringBuilder();
			sb.append("appid="+downloadbill.getAppid())//
				.append("&bill_date="+downloadbill.getBill_date())//
				.append("&bill_type="+downloadbill.getBill_type())//
				.append("&mch_id="+downloadbill.getMch_id())//
				.append("&nonce_str="+downloadbill.getNonce_str())//
				.append("&key="+ConfigUtil.get("signkey"));
			//签名
			downloadbill.setSign(MD5Util.MD5Encode(sb.toString(),"UTF-8").toUpperCase());
			
			try {
				InputStream ins = WeixinPay.getResult(downloadbill);
				b = new byte[ins.available()];
				ins.read(b);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return b;
	}*/
	
	
}
