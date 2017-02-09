package cn.easycode.yzmywx.bean.eo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

import org.codehaus.jackson.annotate.JsonIgnore;

import cn.easycode.yzmywx.utils.DateUtil;


/**
 * The persistent class for the repairorder database table.
 * 
 */
@Entity
@Table(name = "repairorder")
public class Repairorder implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private String address;
	
	@JsonIgnore
	private Long booktimeup;
	
	@JsonIgnore
	private Long booktimedown;
	
	@JsonIgnore
	private Long createtime;

	@Lob
	private String memo;
	
	@JsonIgnore
	private Long modifytime;

	private String orderSn;

	private short orderStatus;

	private String photoUrl;
	
	private String telephone;
	
	private String contact;
	
	@JoinColumn(name="category_id")
	private Repaircategory repaircategory;
	
	@Transient
	@JsonIgnore
	private String categoryidString;
	
	@Transient
	private String formatbooktimeup;
	
	@Transient
	private String formatbooktimedown;
	
	@Transient
	private String formatcreatetime;
	
	/**
	 * 一个维修工可以有多个订单，是many to one
	 */
	@JoinColumn(name="user_id")
	@ManyToOne
	private User user;
	
	@Transient
	Evaluation evaluation;

	//bi-directional many-to-one association to Customer
	/**
	 * 一个支付类型可以有多个订单，是many to one
	 */

	
	/**
	 * 一个消费者可以有多个订单，是many to one
	 */
	@JoinColumn(name="customer_id")
	@ManyToOne
	private Customer customer;

	public Repairorder() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Long getBooktimeup() {
		return this.booktimeup;
	}

	public void setBooktimeup(Long booktime) {
		this.booktimeup = booktime;
	}
	
	public Long getBooktimedown() {
		return this.booktimedown;
	}

	public void setBooktimedown(Long booktime) {
		this.booktimedown = booktime;
	}

	public Long getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Long createtime) {
		this.createtime = createtime;
	}

	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Long getModifytime() {
		return this.modifytime;
	}

	public void setModifytime(Long modifytime) {
		this.modifytime = modifytime;
	}

	public String getOrderSn() {
		return this.orderSn;
	}

	public void setOrderSn(String orderSn) {
		this.orderSn = orderSn;
	}

	public short getOrderStatus() {
		return this.orderStatus;
	}

	public void setOrderStatus(short orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getPhotoUrl() {
		return this.photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getFormatbooktimeup() {
		if(this.booktimeup != null){
			this.formatbooktimeup = DateUtil.dateToString(new Date(this.booktimeup),"yyyy-MM-dd HH:mm");
		}
		return formatbooktimeup;
	}

	public void setFormatbooktimeup(String fotmatbooktimeup) {
		if(fotmatbooktimeup != null){
			fotmatbooktimeup += ":00";
			this.booktimeup = DateUtil.stringToDate(fotmatbooktimeup, "yyyy-MM-dd HH:mm:ss").getTime();
		}
		this.formatbooktimeup = fotmatbooktimeup;
	}

	public String getFormatbooktimedown() {
		if(this.booktimedown != null){
			this.formatbooktimedown = DateUtil.dateToString(new Date(this.booktimedown),"yyyy-MM-dd HH:mm");
		}
		return formatbooktimedown;
	}

	public void setFormatbooktimedown(String fotmatbooktimedown) {
		if(fotmatbooktimedown != null ){
			fotmatbooktimedown += ":00";
			this.booktimedown = DateUtil.stringToDate(fotmatbooktimedown, "yyyy-MM-dd HH:mm:ss").getTime();
		}
		this.formatbooktimedown = fotmatbooktimedown;
		
	}

	public String getFormatcreatetime() {
		if(this.createtime != null){
			this.formatcreatetime = DateUtil.dateToString(new Date(this.createtime),"yyyy-MM-dd HH:mm:ss");
		}
		return formatcreatetime;
	}

	public void setFormatcreatetime(String formatcreatetime) {
		this.formatcreatetime = formatcreatetime;
	}

	public Evaluation getEvaluation() {
		return evaluation;
	}

	public void setEvaluation(Evaluation evaluation) {
		this.evaluation = evaluation;
	}

	public Repaircategory getRepaircategory() {
		return repaircategory;
	}

	public void setRepaircategory(Repaircategory repaircategory) {
		this.repaircategory = repaircategory;
	}

	public String getCategoryidString() {
		return categoryidString;
	}

	public void setCategoryidString(String categoryidString) {
		this.categoryidString = categoryidString;
	}
	
	
}