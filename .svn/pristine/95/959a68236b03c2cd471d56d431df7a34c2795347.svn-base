package cn.easycode.yzmywx.bean.eo;

import java.io.Serializable;
import java.util.List;
import java.util.UUID;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
@Table(name = "resource")
public class Resource implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private String description;

	private String iconCls;

	private String name;

	private String pid = "0";

	private int seq;

	private String target;

	private String url;

	@Transient
	private String resourcetypeid;

	@ManyToOne
	private Resourcetype resourcetype;

	@ManyToMany(mappedBy = "resources")
	private List<Role> roles;
	
	public Resource() {
	}

	public String getId() {
		if (!StringUtils.isBlank(this.id)) {
			return this.id;
		}
		return UUID.randomUUID().toString();
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIconCls() {
		return this.iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
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

	public int getSeq() {
		return this.seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTarget() {
		return this.target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Resourcetype getResourcetype() {
		return this.resourcetype;
	}

	public void setResourcetype(Resourcetype resourcetype) {
		this.resourcetype = resourcetype;
	}

	@JsonIgnore
	public List<Role> getRoles() {
		return this.roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	@JsonIgnore
	public String getResourcetypeid() {
		return resourcetypeid;
	}

	public void setResourcetypeid(String resourcetypeid) {
		this.resourcetypeid = resourcetypeid;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        result = prime * result + ((name == null) ? 0 : name.hashCode());
        return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Resource other = (Resource) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (roles == null) {
			if (other.roles != null)
				return false;
		} else if (!roles.equals(other.roles))
			return false;
		return true;
	}
}