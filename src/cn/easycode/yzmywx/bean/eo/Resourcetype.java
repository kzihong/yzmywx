package cn.easycode.yzmywx.bean.eo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="resourcetype")
public class Resourcetype implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private String description;

	private String name;

	public Resourcetype() {
	}

	public String getId() {
		return this.id;
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
}