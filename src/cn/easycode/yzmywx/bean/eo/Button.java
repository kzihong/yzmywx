package cn.easycode.yzmywx.bean.eo;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the button database table.
 * 
 */
@Entity
@Table(name = "button")
public class Button implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private String btkey;

	private String mediaid;

	private String name;

	private String pid = "0";

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public String getTypeid() {
		return typeid;
	}

	public void setTypeid(String typeid) {
		this.typeid = typeid;
	}

	private String url;
	
	@Transient
	private String state = "open";// open,closed
	@Transient
	private String iconCls = "ext-icon-application_view_detail";
	@Transient
	private String typeid;

	//bi-directional many-to-one association to Buttontype
	@ManyToOne
	@JoinColumn(name="type")
	private Buttontype buttontype;

	public Button() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBtkey() {
		return this.btkey;
	}

	public void setBtkey(String btkey) {
		this.btkey = btkey;
	}

	public String getMediaid() {
		return this.mediaid;
	}

	public void setMediaid(String mediaid) {
		this.mediaid = mediaid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPid() {
		return this.pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Buttontype getButtontype() {
		return this.buttontype;
	}

	public void setButtontype(Buttontype buttontype) {
		this.buttontype = buttontype;
	}

}