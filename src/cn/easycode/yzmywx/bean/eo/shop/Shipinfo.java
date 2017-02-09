package cn.easycode.yzmywx.bean.eo.shop;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * The persistent class for the shipinfo database table.
 * 7.shipInfo
	1.id	UUID 64
	2.zipcode	vachar 10
	3.phoneNum	vachar 20
	4.contact	vachar 20
	5.shipArea	varchar 255
	6.shipStreet	varchar 255
	7.shipAddress	varchar 255
 */
@Entity
@Table(name = "shipinfo")
public class Shipinfo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private String contact;

	private String phoneNum;

	private String shipAddress;

	private String shipArea;

	private String shipStreet;

	private String zipcode;

	public Shipinfo() {
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

	public String getPhoneNum() {
		return this.phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getShipAddress() {
		return this.shipAddress;
	}

	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
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