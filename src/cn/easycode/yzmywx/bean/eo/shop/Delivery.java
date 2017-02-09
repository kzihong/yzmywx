package cn.easycode.yzmywx.bean.eo.shop;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;


/**
 * The persistent class for the delivery database table.
 * 6.delivery
	1.id	UUID 64
	2.companyName
	3.deliverySn
 */
@Entity
@Table(name = "delivery")
public class Delivery implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;
	
	@JoinColumn(name="companyName")
	@ManyToOne
	private Shippercoding shippercoding;
	
	@Transient
	private String shippercode ;

	private String deliverySn;

	public Delivery() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDeliverySn() {
		return this.deliverySn;
	}

	public void setDeliverySn(String deliverySn) {
		this.deliverySn = deliverySn;
	}

	public Shippercoding getShippercoding() {
		return shippercoding;
	}

	public void setShippercoding(Shippercoding shippercoding) {
		this.shippercoding = shippercoding;
	}

	public String getShippercode() {
		return shippercode;
	}

	public void setShippercode(String shippercode) {
		this.shippercode = shippercode;
	}
	
	
}