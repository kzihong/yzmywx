package cn.easycode.yzmywx.bean.vo.wechat;

import java.util.List;

public class Openid implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private List<String> openid;

	public List<String> getOpenid() {
		return openid;
	}

	public void setOpenid(List<String> openid) {
		this.openid = openid;
	}
	
}
