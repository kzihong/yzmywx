package cn.easycode.yzmywx.bean.vo;

import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;

public class ReturnData implements java.io.Serializable{

	private static final long serialVersionUID = 1158576530001281109L;
	private String errcode = "1";
	private String errmsg = "fail";
	private Object obj = null;
	private List list = null;
	private boolean success = false;
	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}
	
	public String getErrcode() {
		return errcode;
	}
	public void setErrcode(String errcode) {
		this.errcode = errcode;
	}
	public String getErrmsg() {
		return errmsg;
	}
	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg;
	}
	public Object getObj() {
		return obj;
	}
	public void setObj(Object obj) {
		this.obj = obj;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	/*
	public String getMapListString(ReturnData rd){
		ObjectMapper mapper = new ObjectMapper();
		try {return mapper.writeValueAsString(rd);} catch (Exception e) {return null;}
	}*/
}
