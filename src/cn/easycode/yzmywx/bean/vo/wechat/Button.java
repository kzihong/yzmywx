package cn.easycode.yzmywx.bean.vo.wechat;

import java.io.Serializable;
import java.util.List;

public class Button implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String type;
	//�˵����
	private String name;
	//�����˵�
	
	private String url;
	
	private String key;
	
	private String media_id;
	
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getMedia_id() {
		return media_id;
	}
	public void setMedia_id(String media_id) {
		this.media_id = media_id;
	}
	private List<Button> sub_button;
	public List<Button> getSub_button() {
		return sub_button;
	}
	public void setSub_button(List<Button> sub_button) {
		this.sub_button = sub_button;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
