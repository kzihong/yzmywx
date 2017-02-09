package cn.easycode.yzmywx.bean.eo.shop;

import java.io.Serializable;
import javax.persistence.*;

import cn.easycode.yzmywx.bean.eo.Customer;


/**
 * The persistent class for the receiver database table.
 * 
9.receiver	1fk
	1.id	UUID 64
	2.zipcode	vachar 10
	3.phoneNum	vachar 20
	4.contact	vachar 20
	5.shipArea	varchar 255
	6.shipStreet	varchar 255
	7.shipAddress	varchar 255
	8.isDefault	bit
	9.customer_id	varchar 64
 */
@Entity
@Table(name = "receiver")
public class Receiver implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private String contact;

	@ManyToOne
	@JoinColumn(name="customer_id")
	private Customer customer;

	private boolean isDefault;

	private String phoneNum;

	private String shipArea;

	private String shipStreet;

	private String zipcode;

	public Receiver() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContact() {
		return this.contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	
	public boolean isDefault() {
		return isDefault;
	}

	public void setDefault(boolean isDefault) {
		this.isDefault = isDefault;
	}

	public String getPhoneNum() {
		return this.phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getShipArea() {
		return this.shipArea;
	}

	public void setShipArea(String shipArea) {
		this.shipArea = shipArea;
	}

	public String getShipStreet() {
		return this.shipStreet;
	}

	public void setShipStreet(String shipStreet) {
		this.shipStreet = shipStreet;
	}

	public String getZipcode() {
		return this.zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

}