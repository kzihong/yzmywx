package cn.easycode.yzmywx.bean.vo;

/**
 * 	private String groupid;
	private String openid;
	private String remark;
	private String base64code;
	private String signature;
	private String nonceStr;
	private int timestap; 
	private String url;
 * @author FANCY
 *
 */
public class SearchData implements java.io.Serializable {
	private static final long serialVersionUID = 1158576530001281109L;
	private String groupid;
	private String openid;
	private String remark;
	private String base64code;
	private String signature;
	private String nonceStr;
	private int timestap; 
	private String url;
	private String access_token;
	private String appid;
	private String addrSign;
	private String timeStap; 
	
	
	public String getTimeStap() {
		return timeStap;
	}
	public void setTimeStap(String timeStap) {
		this.timeStap = timeStap;
	}
	public String getAddrSign() {
		return addrSign;
	}
	public void setAddrSign(String addrSign) {
		this.addrSign = addrSign;
	}
	public String getBase64code() {
		return base64code;
	}
	public void setBase64code(String base64code) {
		this.base64code = base64code;
	}
	public String getGroupid() {
		return groupid;
	}
	public void setGroupid(String groupid) {
		this.groupid = groupid;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public String getNonceStr() {
		return nonceStr;
	}
	public void setNonceStr(String nonceStr) {
		this.nonceStr = nonceStr;
	}
	public int getTimestap() {
		return timestap;
	}
	public void setTimestap(int timestap) {
		this.timestap = timestap;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getAccess_token() {
		return access_token;
	}
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
	public String getAppid() {
		return appid;
	}
	public void setAppid(String appid) {
		this.appid = appid;
	}
	
}
