package cn.easycode.yzmywx.bean.eo;

import java.io.Serializable;
import java.util.List;
import java.util.UUID;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
@Table(name = "role")
public class Role implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private String description;

	private String name;

	private int seq;

	private String type;

	@ManyToMany
	@JoinTable(name = "role_resource", joinColumns = { @JoinColumn(name = "role_id") }, inverseJoinColumns = { @JoinColumn(name = "resource_id") })
	private List<Resource> resources;
	
	@ManyToMany(mappedBy = "roles")
	private List<User> users;

	public Role() { }
	
	/**
     * 角色为维护者，为其指定添加资源方法
     * @param teacher
     */
    public void addResource(Resource resource){
        this.resources.add(resource);
    }
     
    /**
     * 角色为维护者，为其指定移除资源方法
     * @param teacher
     */
    public void removeResource(Resource resource){
        if(this.resources.contains(resource)){
            this.resources.remove(resource);
        }
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

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSeq() {
		return this.seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	@JsonIgnore
	public List<Resource> getResources() {
		return this.resources;
	}

	public void setResources(List<Resource> resources) {
		this.resources = resources;
	}

	@JsonIgnore
	public List<User> getUsers() {
		return this.users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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
		Role other = (Role) obj;
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
		if (resources == null) {
			if (other.resources != null)
				return false;
		} else if (!resources.equals(other.resources))
			return false;
		if (users == null) {
			if (other.users != null)
				return false;
		} else if (!users.equals(other.users))
			return false;
		return true;
	}
}