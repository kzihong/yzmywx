package cn.easycode.yzmywx.bean.eo.shop;

import java.io.Serializable;
import javax.persistence.*;

import org.codehaus.jackson.annotate.JsonIgnore;


/**
 * The persistent class for the productattr database table.
 * 
 */
@Entity
@Table(name = "productattr")
public class Productattr implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private String attrKey;

	private String attrValue;

	//bi-directional many-to-one association to Product
	@JsonIgnore
	@ManyToOne
	private Product product;

	public Productattr() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAttrKey() {
		return this.attrKey;
	}

	public void setAttrKey(String atrrKey) {
		this.attrKey = atrrKey;
	}

	public String getAttrValue() {
		return this.attrValue;
	}

	public void setAttrValue(String attrValue) {
		this.attrValue = attrValue;
	}
	
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}