package cn.easycode.yzmywx.bean.vo.weixinorder;

import java.io.Serializable;

/**
 * 统一下单
 * @author caimengyuan
 *
 */
public class Unifiedorder implements Serializable{

	private static final long serialVersionUID = 1L;
	//统一下单
	public static final String UNIFIEDORDER = "https://api.mch.weixin.qq.com/pay/unifiedorder";

	private String appid;//公众号账号ID
	private String mch_id;//商户号
	private String device_info;//"WEB"设备号
	private String nonce_str;//随机字符串
	private String sign;//签名
	private String body;//商品描述
	private String attach;//附加数据
	private String out_trade_no;//商户订单号
	private int total_fee;//总金额
	private String spbill_create_ip;//用户端ip
	private String notify_url;//回调通知接口
	private String trade_type;//"JSAPI"交易类型
	private String openid;//消费者
	
	private String detail;//商品的详情
	private String fee_type;//"CNY"符合ISO 4217标准的三位字母代码，默认人民币：CNY，
	private String time_start;//订单生成时间，格式为yyyyMMddHHmmss，如2009年12月25日9点10分10秒表示为20091225091010
	private String time_expire;//订单失效时间，格式为yyyyMMddHHmmss，如2009年12月27日9点10分10秒表示为20091227091010
	private String goods_tag;//"WXG"商品标记，代金券或立减优惠功能的参数
	private String product_id;//trade_type=NATIVE，此参数必传。此id为二维码中包含的商品ID，商户自行定义
	private String limit_pay;//"no_credit"no_credit--指定不能使用信用卡支付
	
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
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getAttach() {
		return attach;
	}
	public void setAttach(String attach) {
		this.attach = attach;
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
	public String getSpbill_create_ip() {
		return spbill_create_ip;
	}
	public void setSpbill_create_ip(String spbill_create_ip) {
		this.spbill_create_ip = spbill_create_ip;
	}
	public String getNotify_url() {
		return notify_url;
	}
	public void setNotify_url(String notify_url) {
		this.notify_url = notify_url;
	}
	public String getTrade_type() {
		return trade_type;
	}
	public void setTrade_type(String trade_type) {
		this.trade_type = trade_type;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getFee_type() {
		return fee_type;
	}
	public void setFee_type(String fee_type) {
		this.fee_type = fee_type;
	}
	public String getTime_start() {
		return time_start;
	}
	public void setTime_start(String time_start) {
		this.time_start = time_start;
	}
	public String getTime_expire() {
		return time_expire;
	}
	public void setTime_expire(String time_expire) {
		this.time_expire = time_expire;
	}
	public String getGoods_tag() {
		return goods_tag;
	}
	public void setGoods_tag(String goods_tag) {
		this.goods_tag = goods_tag;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getLimit_pay() {
		return limit_pay;
	}
	public void setLimit_pay(String limit_pay) {
		this.limit_pay = limit_pay;
	}
	@Override
	public String toString() {
		return "Unifiedorder [appid=" + appid + ", mch_id=" + mch_id
				+ ", device_info=" + device_info + ", nonce_str=" + nonce_str
				+ ", sign=" + sign + ", body=" + body + ", attach=" + attach
				+ ", out_trade_no=" + out_trade_no + ", total_fee=" + total_fee
				+ ", spbill_create_ip=" + spbill_create_ip + ", notify_url="
				+ notify_url + ", trade_type=" + trade_type + ", openid="
				+ openid + ", detail=" + detail + ", fee_type=" + fee_type
				+ ", time_start=" + time_start + ", time_expire=" + time_expire
				+ ", goods_tag=" + goods_tag + ", product_id=" + product_id
				+ ", limit_pay=" + limit_pay + "]";
	}
	
}
