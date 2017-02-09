package cn.easycode.yzmywx.bean.vo.weixinorder;

import java.io.Serializable;

import org.codehaus.jackson.annotate.JsonIgnore;

/**
 * <xml>
	   <return_code><![CDATA[SUCCESS]]></return_code>
	   <return_msg><![CDATA[OK]]></return_msg>
	   <appid><![CDATA[wx2421b1c4370ec43b]]></appid>
	   <mch_id><![CDATA[10000100]]></mch_id>
	   <nonce_str><![CDATA[BFK89FC6rxKCOjLX]]></nonce_str>
	   <sign><![CDATA[72B321D92A7BFA0B2509F3D13C7B1631]]></sign>
	   <result_code><![CDATA[SUCCESS]]></result_code>
	</xml>
 */
/**
 * 关闭订单的回复通知
 * @author deshun
 *
 */
public class CloseorderResult implements Serializable{

	private static final long serialVersionUID = 1L;

	//必返回
	private String return_code;//返回状态码
	private String return_msg;//返回信息
	
	//以下字段在return_code为SUCCESS的时候有返回
	private String appid;//公众号账号ID
	private String mch_id;//商户号
	private String nonce_str;//随机字符串
	private String sign;//签名
	private String err_code;//错误代码
	private String err_code_des;//错误代码描述
	
	public String getReturn_code() {
		return return_code;
	}
	public void setReturn_code(String return_code) {
		this.return_code = return_code;
	}
	public String getReturn_msg() {
		return return_msg;
	}
	public void setReturn_msg(String return_msg) {
		this.return_msg = return_msg;
	}
	@JsonIgnore
	public String getAppid() {
		return appid;
	}
	public void setAppid(String appid) {
		this.appid = appid;
	}
	@JsonIgnore
	public String getMch_id() {
		return mch_id;
	}
	public void setMch_id(String mch_id) {
		this.mch_id = mch_id;
	}
	@JsonIgnore
	public String getNonce_str() {
		return nonce_str;
	}
	public void setNonce_str(String nonce_str) {
		this.nonce_str = nonce_str;
	}
	@JsonIgnore
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public String getErr_code() {
		return err_code;
	}
	public void setErr_code(String err_code) {
		this.err_code = err_code;
	}
	public String getErr_code_des() {
		return err_code_des;
	}
	public void setErr_code_des(String err_code_des) {
		this.err_code_des = err_code_des;
	}
	
	
}
