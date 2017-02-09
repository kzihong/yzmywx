package cn.easycode.yzmywx.bean.vo.weixinorder;

import java.io.Serializable;

import org.codehaus.jackson.annotate.JsonIgnore;

/**
 * <xml>
	   <return_code><![CDATA[SUCCESS]]></return_code>
	   <return_msg><![CDATA[OK]]></return_msg>
	   <appid><![CDATA[wx2421b1c4370ec43b]]></appid>
	   <mch_id><![CDATA[10000100]]></mch_id>
	   <device_info><![CDATA[1000]]></device_info>
	   <nonce_str><![CDATA[TN55wO9Pba5yENl8]]></nonce_str>
	   <sign><![CDATA[BDF0099C15FF7BC6B1585FBB110AB635]]></sign>
	   <result_code><![CDATA[SUCCESS]]></result_code>
	   <openid><![CDATA[oUpF8uN95-Ptaags6E_roPHg7AG0]]></openid>
	   <is_subscribe><![CDATA[Y]]></is_subscribe>
	   <trade_type><![CDATA[MICROPAY]]></trade_type>
	   <bank_type><![CDATA[CCB_DEBIT]]></bank_type>
	   <total_fee>1</total_fee>
	   <fee_type><![CDATA[CNY]]></fee_type>
	   <transaction_id><![CDATA[1008450740201411110005820873]]></transaction_id>
	   <out_trade_no><![CDATA[1415757673]]></out_trade_no>
	   <attach><![CDATA[订单额外描述]]></attach>
	   <time_end><![CDATA[20141111170043]]></time_end>
	   <trade_state><![CDATA[SUCCESS]]></trade_state>
	</xml>
 */
/**
 * 查询订单的回复通知
 * @author deshun
 *
 */
public class OrderqueryResult implements Serializable{

	private static final long serialVersionUID = 1L;

	//必返回
	private String return_code;//返回状态码
	private String return_msg;//返回信息
	
	//以下字段在return_code为SUCCESS的时候有返回
	private String appid;//公众号账号ID
	private String mch_id;//商户号
	private String nonce_str;//随机字符串
	private String sign;//签名
	private String result_code;//业务结果
	private String err_code;//错误代码
	private String err_code_des;//错误代码描述
	
	//以下字段在return_code 和result_code都为SUCCESS的时候有返回
	private String device_info;//设备号
	private String openid;//用户标识
	private String is_subscribe;//是否关注公众账号
	private String trade_type;//交易类型	
	private String trade_state;//交易状态
	private String bank_type;//付款银行
	private int total_fee;//总金额
	private String fee_type;//货币种类
	private int cash_fee;//现金支付金额
	private String cash_fee_type;//现金支付货币类型
	private int coupon_fee;//代金券或立减优惠金额
	private int coupon_count;//代金券或立减优惠使用数量
	private String coupon_batch_id_$n;//代金券或立减优惠批次ID
	private String coupon_id_$n;//代金券或立减优惠ID
	private int coupon_fee_$n;//单个代金券或立减优惠支付金额
	private String transaction_id;//微信支付订单号
	private String out_trade_no;//商户订单号
	private String attach;//附加数据
	private String time_end;//支付完成时间
	private String trade_state_desc;//交易状态描述
	
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
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getIs_subscribe() {
		return is_subscribe;
	}
	public void setIs_subscribe(String is_subscribe) {
		this.is_subscribe = is_subscribe;
	}
	public String getTrade_type() {
		return trade_type;
	}
	public void setTrade_type(String trade_type) {
		this.trade_type = trade_type;
	}
	public String getTrade_state() {
		return trade_state;
	}
	public void setTrade_state(String trade_state) {
		this.trade_state = trade_state;
	}
	public String getBank_type() {
		return bank_type;
	}
	public void setBank_type(String bank_type) {
		this.bank_type = bank_type;
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
	public String getCash_fee_type() {
		return cash_fee_type;
	}
	public void setCash_fee_type(String cash_fee_type) {
		this.cash_fee_type = cash_fee_type;
	}
	public int getCoupon_fee() {
		return coupon_fee;
	}
	public void setCoupon_fee(int coupon_fee) {
		this.coupon_fee = coupon_fee;
	}
	public int getCoupon_count() {
		return coupon_count;
	}
	public void setCoupon_count(int coupon_count) {
		this.coupon_count = coupon_count;
	}
	public String getCoupon_batch_id_$n() {
		return coupon_batch_id_$n;
	}
	public void setCoupon_batch_id_$n(String coupon_batch_id_$n) {
		this.coupon_batch_id_$n = coupon_batch_id_$n;
	}
	public String getCoupon_id_$n() {
		return coupon_id_$n;
	}
	public void setCoupon_id_$n(String coupon_id_$n) {
		this.coupon_id_$n = coupon_id_$n;
	}
	public int getCoupon_fee_$n() {
		return coupon_fee_$n;
	}
	public void setCoupon_fee_$n(int coupon_fee_$n) {
		this.coupon_fee_$n = coupon_fee_$n;
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
	public String getAttach() {
		return attach;
	}
	public void setAttach(String attach) {
		this.attach = attach;
	}
	public String getTime_end() {
		return time_end;
	}
	public void setTime_end(String time_end) {
		this.time_end = time_end;
	}
	public String getTrade_state_desc() {
		return trade_state_desc;
	}
	public void setTrade_state_desc(String trade_state_desc) {
		this.trade_state_desc = trade_state_desc;
	}
	
	
}
