package cn.easycode.yzmywx.bean.vo.weixinorder;

import java.io.Serializable;

import org.codehaus.jackson.annotate.JsonIgnore;

/**
 * <xml>
	   <appid><![CDATA[wx2421b1c4370ec43b]]></appid>
	   <mch_id><![CDATA[10000100]]></mch_id>
	   <nonce_str><![CDATA[TeqClE3i0mvn3DrK]]></nonce_str>
	   <out_refund_no_0><![CDATA[1415701182]]></out_refund_no_0>
	   <out_trade_no><![CDATA[1415757673]]></out_trade_no>
	   <refund_count>1</refund_count>
	   <refund_fee_0>1</refund_fee_0>
	   <refund_id_0><![CDATA[2008450740201411110000174436]]></refund_id_0>
	   <refund_status_0><![CDATA[PROCESSING]]></refund_status_0>
	   <result_code><![CDATA[SUCCESS]]></result_code>
	   <return_code><![CDATA[SUCCESS]]></return_code>
	   <return_msg><![CDATA[OK]]></return_msg>
	   <sign><![CDATA[1F2841558E233C33ABA71A961D27561C]]></sign>
	   <transaction_id><![CDATA[1008450740201411110005820873]]></transaction_id>
	</xml>
 */
/**
 * 查询退款的回复通知
 * @author deshun
 *
 */
public class RefundqueryResult implements Serializable{

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
	private String transaction_id;//微信支付订单号
	private String out_trade_no;//商户订单号
	private int total_fee;//总金额
	private String fee_type;//货币种类
	private int cash_fee;//现金支付金额
	private int refund_count;//退款笔数
	private String out_refund_no_$n;//商户退款单号
	private String refund_id_$n;//微信退款单号
	private String refund_channel_$n;//退款渠道
	private int refund_fee_$n;//退款金额
	
	private int coupon_refund_fee_$n;//代金券或立减优惠退款金额
	private int coupon_refund_count_$n;//代金券或立减优惠使用数量
	private String coupon_refund_batch_id_$n_$m;//代金券或立减优惠批次ID
	private String coupon_refund_id_$n_$m;//代金券或立减优惠ID
	private int coupon_refund_fee_$n_$m;//单个代金券或立减优惠支付金额
	
	
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
	public String getResult_code() {
		return result_code;
	}
	public void setResult_code(String result_code) {
		this.result_code = result_code;
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
	public String getDevice_info() {
		return device_info;
	}
	public void setDevice_info(String device_info) {
		this.device_info = device_info;
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
	public String getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(String transaction_id) {
		this.transaction_id = transaction_id;
	}
	public String getOut_trade_no() {
		return out_trade_no;
	}
	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
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
	public int getRefund_count() {
		return refund_count;
	}
	public void setRefund_count(int refund_count) {
		this.refund_count = refund_count;
	}
	public String getOut_refund_no_$n() {
		return out_refund_no_$n;
	}
	public void setOut_refund_no_$n(String out_refund_no_$n) {
		this.out_refund_no_$n = out_refund_no_$n;
	}
	public String getRefund_id_$n() {
		return refund_id_$n;
	}
	public void setRefund_id_$n(String refund_id_$n) {
		this.refund_id_$n = refund_id_$n;
	}
	public String getRefund_channel_$n() {
		return refund_channel_$n;
	}
	public void setRefund_channel_$n(String refund_channel_$n) {
		this.refund_channel_$n = refund_channel_$n;
	}
	public int getRefund_fee_$n() {
		return refund_fee_$n;
	}
	public void setRefund_fee_$n(int refund_fee_$n) {
		this.refund_fee_$n = refund_fee_$n;
	}
	public int getCoupon_refund_fee_$n() {
		return coupon_refund_fee_$n;
	}
	public void setCoupon_refund_fee_$n(int coupon_refund_fee_$n) {
		this.coupon_refund_fee_$n = coupon_refund_fee_$n;
	}
	public int getCoupon_refund_count_$n() {
		return coupon_refund_count_$n;
	}
	public void setCoupon_refund_count_$n(int coupon_refund_count_$n) {
		this.coupon_refund_count_$n = coupon_refund_count_$n;
	}
	public String getCoupon_refund_batch_id_$n_$m() {
		return coupon_refund_batch_id_$n_$m;
	}
	public void setCoupon_refund_batch_id_$n_$m(String coupon_refund_batch_id_$n_$m) {
		this.coupon_refund_batch_id_$n_$m = coupon_refund_batch_id_$n_$m;
	}
	public String getCoupon_refund_id_$n_$m() {
		return coupon_refund_id_$n_$m;
	}
	public void setCoupon_refund_id_$n_$m(String coupon_refund_id_$n_$m) {
		this.coupon_refund_id_$n_$m = coupon_refund_id_$n_$m;
	}
	public int getCoupon_refund_fee_$n_$m() {
		return coupon_refund_fee_$n_$m;
	}
	public void setCoupon_refund_fee_$n_$m(int coupon_refund_fee_$n_$m) {
		this.coupon_refund_fee_$n_$m = coupon_refund_fee_$n_$m;
	}
	
	
}
