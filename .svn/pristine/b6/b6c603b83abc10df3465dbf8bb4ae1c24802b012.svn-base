package cn.easycode.yzmywx.bean.vo.weixinorder;

import java.io.Serializable;

/**
 * <xml>
	   <appid>wx2421b1c4370ec43b</appid>
	   <mch_id>10000100</mch_id>
	   <nonce_str>0b9f35f484df17a732e537c37708d1d0</nonce_str>
	   <out_refund_no></out_refund_no>
	   <out_trade_no>1415757673</out_trade_no>
	   <refund_id></refund_id>
	   <transaction_id></transaction_id>
	   <sign>66FFB727015F450D167EF38CCC549521</sign>
	</xml>
 */
/**
 * 查询退款
 * @author deshun
 *
 */
public class Refundquery implements Serializable {

	private static final long serialVersionUID = 1L;
	//查询退款
	public static final String REFUNDQUERY = "https://api.mch.weixin.qq.com/pay/refundquery";
	
	private String appid;
	private String mch_id;
	private String device_info;
	private String nonce_str;
	private String sign;
	//以下四选一
	private String transacion_id;//微信订单号
	private String out_trade_no;//商户订单号
	private String out_refund_no;//商户退款单号
	private String refund_id;//微信退款单号
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
	public String getTransacion_id() {
		return transacion_id;
	}
	public void setTransacion_id(String transacion_id) {
		this.transacion_id = transacion_id;
	}
	public String getOut_trade_no() {
		return out_trade_no;
	}
	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
	}
	public String getOut_refund_no() {
		return out_refund_no;
	}
	public void setOut_refund_no(String out_refund_no) {
		this.out_refund_no = out_refund_no;
	}
	public String getRefund_id() {
		return refund_id;
	}
	public void setRefund_id(String refund_id) {
		this.refund_id = refund_id;
	}
	
	

}
