package cn.easycode.yzmywx.bean.eo.shop;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.codehaus.jackson.annotate.JsonIgnore;

import cn.easycode.yzmywx.bean.eo.Customer;
import cn.easycode.yzmywx.utils.DateUtil;


/**
 * The persistent class for the productorder database table.
 * 4.productorder   5fk
	1.id UUID 64
	2.createtime long
	3.modifytime long
	4.payment_id vachar 64
	5.orderStatus	short
	6.memo	tinytext
	7.deliveryfee	float
	8.delivery_id	varchar 64
	9.orderSn long
	10.customer_id varchar 64
	11.shipInfo_id varchar 64
	12.totalPrice float
	13.totalAMT	int
	14.evaluation_id	varchar 64
 */
@Entity
@Table(name = "productorder")
public class Productorder implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private Long createtime;

	@JsonIgnore
	@OneToOne
	@JoinColumn(name="customer_id")
	private Customer customer;

	private float deliveryfee;

	@Lob
	private String memo;
	
	@JsonIgnore
	@Lob
	private String unifiedorderResult;

	private Long modifytime;

	private String orderSn;

	private short orderStatus;

	private int totalAmount;

	private float totalPrice;

	//bi-directional many-to-one association to Delivery
	@ManyToOne(cascade={CascadeType.MERGE})
	private Delivery delivery;

	//bi-directional many-to-one association to Payment
	@ManyToOne(cascade={CascadeType.MERGE})
	private Payment payment;

	//bi-directional many-to-one association to Pevaluation
	@OneToOne
	@JoinColumn(name="evaluation_id")
	@JsonIgnore
	private Pevaluation pevaluation;

	//bi-directional many-to-one association to Shipinfo
	@ManyToOne(cascade={CascadeType.PERSIST})
	private Shipinfo shipinfo;
	
	@OneToMany(cascade={CascadeType.PERSIST,CascadeType.REMOVE},mappedBy="productorder")
	private List<Orderitem> orderitems;

	public Productorder() {
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


	public float getDeliveryfee() {
		return this.deliveryfee;
	}

	public void setDeliveryfee(float deliveryfee) {
		this.deliveryfee = deliveryfee;
	}

	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public short getOrderStatus() {
		return this.orderStatus;
	}

	public void setOrderStatus(short orderStatus) {
		this.orderStatus = orderStatus;
	}

	public int getTotalAmount() {
		return this.totalAmount;
	}

	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}

	public float getTotalPrice() {
		return this.totalPrice;
	}

	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Delivery getDelivery() {
		return this.delivery;
	}

	public void setDelivery(Delivery delivery) {
		this.delivery = delivery;
	}

	public Payment getPayment() {
		return this.payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}
	
	public Pevaluation getPevaluation() {
		return this.pevaluation;
	}

	public void setPevaluation(Pevaluation pevaluation) {
		this.pevaluation = pevaluation;
	}

	public Shipinfo getShipinfo() {
		return this.shipinfo;
	}

	public void setShipinfo(Shipinfo shipinfo) {
		this.shipinfo = shipinfo;
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

	public String getOrderSn() {
		return orderSn;
	}

	public void setOrderSn(String orderSn) {
		this.orderSn = orderSn;
	}

	public List<Orderitem> getOrderitems() {
		return orderitems;
	}

	public void setOrderitems(List<Orderitem> orderitems) {
		this.orderitems = orderitems;
	}

	public String getUnifiedorderResult() {
		return unifiedorderResult;
	}

	public void setUnifiedorderResult(String unifiedorderResult) {
		this.unifiedorderResult = unifiedorderResult;
	}
	
	
}