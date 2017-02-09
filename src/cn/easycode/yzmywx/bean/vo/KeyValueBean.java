package cn.easycode.yzmywx.bean.vo;

public class KeyValueBean implements java.io.Serializable  {
	private static final long serialVersionUID = 1L;
	private String key;
	private String value;

	public KeyValueBean() { }

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
