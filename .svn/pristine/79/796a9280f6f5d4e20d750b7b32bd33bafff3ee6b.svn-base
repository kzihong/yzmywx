package cn.easycode.yzmywx.bean.vo.weixinorder;

import java.io.Serializable;

/**
 * 查询订单
 * @author deshun
 *
 */
public class Orderquery implements Serializable {

	private static final long serialVersionUID = 1L;
	//查询订单
	public static final String ORDERQUERY = "https://api.mch.weixin.qq.com/pay/orderquery";
	
	private String appid;
	private String mch_id;
	//以下二选一
	private String transacion_id;//微信订单号
	private String out_trade_no;//商户订单号
	private String nonce_str;
	private String sign;
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
	@Override
	public String toString() {
		return "Orderquery [appid=" + appid + ", mch_id=" + mch_id
				+ ", transacion_id=" + transacion_id + ", out_trade_no="
				+ out_trade_no + ", nonce_str=" + nonce_str + ", sign=" + sign
				+ "]";
	}
	

}
