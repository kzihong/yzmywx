package cn.easycode.yzmywx.bean.eo.shop;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;


/**
 * The persistent class for the productcategory database table.
 * 11.productCategory
	1.id UUID 64
	2.name varchar 64
	3.inventory int 
	4.price float

 */
@Entity
@Table(name = "productcategory")
public class Productcategory implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private int inventory;

	private String name;

	private float price;
	
	private int sales;
	
	@JsonIgnore
	@ManyToOne
	private Product product;

	public Productcategory() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getInventory() {
		return this.inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getPrice() {
		return this.price;
	}

	public void setPrice(float price) {
		this.price = price;
	}
	
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}
	
	
}