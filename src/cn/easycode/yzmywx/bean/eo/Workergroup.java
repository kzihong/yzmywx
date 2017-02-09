package cn.easycode.yzmywx.bean.eo;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the workergroup database table.
 * 
 */
@Entity
@Table(name = "workergroup")
public class Workergroup implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private String groupname;

	public Workergroup() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGroupname() {
		return this.groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

}