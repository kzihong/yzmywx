package cn.easycode.yzmywx.bean.eo.shop;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the producttype database table.
 * 12.productType
	1.id UUID
	2.name varchar 64

 */
@Entity
@Table(name = "producttype")
public class Producttype implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String id;

	private String name;

	public Producttype() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}