package cn.easycode.yzmywx.bean.vo.weixinorder;

import java.io.Serializable;

import org.codehaus.jackson.annotate.JsonIgnore;

/**
 * <xml>
	   <return_code><![CDATA[SUCCESS]]></return_code>
	   <return_msg><![CDATA[OK]]></return_msg>
	   <appid><![CDATA[wx2421b1c4370ec43b]]></appid>
	   <mch_id><![CDATA[10000100]]></mch_id>
	   <nonce_str><![CDATA[NfsMFbUFpdbEhPXP]]></nonce_str>
	   <sign><![CDATA[B7274EB9F8925EB93100DD2085FA56C0]]></sign>
	   <result_code><![CDATA[SUCCESS]]></result_code>
	   <transaction_id><![CDATA[1008450740201411110005820873]]></transaction_id>
	   <out_trade_no><![CDATA[1415757673]]></out_trade_no>
	   <out_refund_no><![CDATA[1415701182]]></out_refund_no>
	   <refund_id><![CDATA[2008450740201411110000174436]]></refund_id>
	   <refund_channel><![CDATA[]]></refund_channel>
	   <refund_fee>1</refund_fee> 
	</xml>
 */
/**
 * 申请退款的回复通知
 * @author deshun
 *
 */
public class RefundResult implements Serializable{

	private static final long serialVersionUID = 1L;

	//必返回
	private String return_code;//返回状态码
	private String return_msg;//返回信息
	
	//以下字段在return_code为SUCCESS的时候有返回
	private String result_code;//业务结果
	private String err_code;//错误代码
	private String err_code_des;//错误代码描述
	private String appid;//公众号账号ID
	private String mch_id;//商户号
	private String device_info;//设备号
	private String nonce_str;//随机字符串
	private String sign;//签名
	private String transation_id;//微信订单号
	private String out_trade_no;//商户订单号
	private String out_refund_no;//商户退款单号
	private String refund_id;//微信退款单号
	private String refund_channel;//退款渠道
	private int refund_fee;//退款金额
	private int total_fee;//订单总金额
	private String fee_type;//订单金额货币种类
	private int cash_fee;//现金支付金额
	private int cash_refund_fee;//现金退款金额
	
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
	public String getResult_code() {
		return result_code;
	}
	public void setResult_code(String result_code) {
		this.result_code = result_code;
	}
	public String getDevice_info() {
		return device_info;
	}
	public void setDevice_info(String device_info) {
		this.device_info = device_info;
	}
	public String getTransation_id() {
		return transation_id;
	}
	public void setTransation_id(String transation_id) {
		this.transation_id = transation_id;
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
	public String getRefund_channel() {
		return refund_channel;
	}
	public void setRefund_channel(String refund_channel) {
		this.refund_channel = refund_channel;
	}
	public int getRefund_fee() {
		return refund_fee;
	}
	public void setRefund_fee(int refund_fee) {
		this.refund_fee = refund_fee;
	}
	public int getTotal_fee() {
		return total_fee;
	}
	public void setTotal_fee(int total_fee) {
		this.total_fee = total_fee;
	}
	public String getFee_type() {
		return fee_type;
	}
	public void setFee_type(String fee_type) {
		this.fee_type = fee_type;
	}
	public int getCash_fee() {
		return cash_fee;
	}
	public void setCash_fee(int cash_fee) {
		this.cash_fee = cash_fee;
	}
	public int getCash_refund_fee() {
		return cash_refund_fee;
	}
	public void setCash_refund_fee(int cash_refund_fee) {
		this.cash_refund_fee = cash_refund_fee;
	}
	@Override
	public String toString() {
		return "RefundResult [return_code=" + return_code + ", return_msg="
				+ return_msg + ", result_code=" + result_code + ", err_code="
				+ err_code + ", err_code_des=" + err_code_des + ", appid="
				+ appid + ", mch_id=" + mch_id + ", device_info=" + device_info
				+ ", nonce_str=" + nonce_str + ", sign=" + sign
				+ ", transation_id=" + transation_id + ", out_trade_no="
				+ out_trade_no + ", out_refund_no=" + out_refund_no
				+ ", refund_id=" + refund_id + ", refund_channel="
				+ refund_channel + ", refund_fee=" + refund_fee
				+ ", total_fee=" + total_fee + ", fee_type=" + fee_type
				+ ", cash_fee=" + cash_fee + ", cash_refund_fee="
				+ cash_refund_fee + "]";
	}
	
	
}
