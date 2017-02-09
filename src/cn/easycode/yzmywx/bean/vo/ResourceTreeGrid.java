package cn.easycode.yzmywx.bean.vo;

import java.util.ArrayList;
import java.util.List;

import cn.easycode.yzmywx.bean.eo.Resourcetype;


public class ResourceTreeGrid implements java.io.Serializable {
	private static final long serialVersionUID = 790249030310721071L;
	private String id;
	private String description;
	private String iconCls;
	private String name;
	private String pid;
	private int seq;
	private String target;
	private String url;
	private Resourcetype resourcetype;
	private List<ResourceTreeGrid> children = new ArrayList<ResourceTreeGrid>();
	public ResourceTreeGrid(){}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getIconCls() {
		return iconCls;
	}
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Resourcetype getResourcetype() {
		return resourcetype;
	}
	public void setResourcetype(Resourcetype resourcetype) {
		this.resourcetype = resourcetype;
	}
	public List<ResourceTreeGrid> getChildren() {
		return children;
	}
	public void setChildren(List<ResourceTreeGrid> children) {
		this.children = children;
	}
}
