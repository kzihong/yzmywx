package cn.easycode.yzmywx.bean.vo.weixinorder;

import java.io.Serializable;

/**
 * <xml>
	  <appid>wx2421b1c4370ec43b</appid>
	  <bill_date>20141110</bill_date>
	  <bill_type>ALL</bill_type>
	  <mch_id>10000100</mch_id>
	  <nonce_str>21df7dc9cd8616b56919f20d9f679233</nonce_str>
	  <sign>332F17B766FC787203EBE9D6E40457A1</sign>
	</xml>
 */
/**
 * 下载对账单
 * @author deshun
 *
 */
public class Downloadbill implements Serializable {

	private static final long serialVersionUID = 1L;
	//下载对账单
	public static final String DOWNLOADBILL = "https://api.mch.weixin.qq.com/pay/downloadbill";
	
	private String appid;
	private String mch_id;
	private String device_info;
	private String nonce_str;
	private String sign;
	
	private String bill_date;//对账单日期--下载对账单的日期，格式：20140603
	/**
	 * ALL，返回当日所有订单信息，默认值
	 * SUCCESS，返回当日成功支付的订单
	 * REFUND，返回当日退款订单
	 */
	private String bill_type = "ALL";//账单类型
	
	
	public String getAppid() {
		return appid;
	}
	public void setAppid(String appid) {
		this.appid = appid;
	}
	public String getMch_id() {
		return mch_id;
	}
	public void setMch_id(String mch_id) {
		this.mch_id = mch_id;
	}
	public String getDevice_info() {
		return device_info;
	}
	public void setDevice_info(String device_info) {
		this.device_info = device_info;
	}
	public String getNonce_str() {
		return nonce_str;
	}
	public void setNonce_str(String nonce_str) {
		this.nonce_str = nonce_str;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public String getBill_date() {
		return bill_date;
	}
	public void setBill_date(String bill_date) {
		this.bill_date = bill_date;
	}
	public String getBill_type() {
		return bill_type;
	}
	public void setBill_type(String bill_type) {
		this.bill_type = bill_type;
	}
	
}
