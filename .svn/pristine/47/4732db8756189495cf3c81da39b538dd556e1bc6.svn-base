package cn.easycode.yzmywx.bean.eo.shop;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.codehaus.jackson.annotate.JsonIgnore;

import cn.easycode.yzmywx.bean.eo.Customer;
import cn.easycode.yzmywx.utils.DateUtil;


/**
 * The persistent class for the cartitem database table.
 * cartitem  3fk
	1.id UUID 64 vachar
	2.customer_id	onetomany
	3.product_id    onetomany
	4.quantity int 
	5.createtime long
	6.modifytime long
	7.product_category 
 * 
 */
@Entity
@Table(name = "cartitem")
public class Cartitem implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;
	
	@JsonIgnore
	private Long createtime;

	@OneToOne
	@JoinColumn(name="customer_id")
	private Customer customer;
	
	@JsonIgnore
	private Long modifytime;

	private int quantity;

	//bi-directional many-to-one association to Product
	@ManyToOne
	private Product product;
	
	@Transient
	private String productid;

	//bi-directional many-to-one association to Productcategory
	@ManyToOne
	@JoinColumn(name="product_category")
	private Productcategory productcategory;
	
	@Transient
	private String categoryid;
	
	public Cartitem() {
	}
	
	@Transient
	private String formatcreatetime;
	
	public String getFormatcreatetime() {
		if(this.createtime != null){
			this.formatcreatetime = DateUtil.dateToString(new Date(this.createtime),"yyyy-MM-dd HH:mm:ss");
		}
		return formatcreatetime;
	}

	public void setFormatcreatetime(String formatcreatetime) {
		this.formatcreatetime = formatcreatetime;
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
	public Long getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Long createtime) {
		this.createtime = createtime;
	}

	
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Long getModifytime() {
		return modifytime;
	}

	public void setModifytime(Long modifytime) {
		this.modifytime = modifytime;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Productcategory getProductcategory() {
		return this.productcategory;
	}

	public void setProductcategory(Productcategory productcategory) {
		this.productcategory = productcategory;
	}

	public String getProductid() {
		return productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}

	public String getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(String categoryid) {
		this.categoryid = categoryid;
	}
	
	
}