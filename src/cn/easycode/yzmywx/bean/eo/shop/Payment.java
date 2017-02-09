package cn.easycode.yzmywx.bean.eo.shop;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import cn.easycode.yzmywx.utils.DateUtil;


/**
 * The persistent class for the payment database table.
 * 5.payment	1fk
	1.id	UUID 64
	2.createtime
	3.payment_type 
 */
@Entity
@Table(name = "payment")
public class Payment implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private Long createtime;

	//bi-directional many-to-one association to Paymenttype
	@ManyToOne
	@JoinColumn(name="payment_type")
	private Paymenttype paymenttype;

	public Payment() {
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

	public Paymenttype getPaymenttype() {
		return this.paymenttype;
	}

	public void setPaymenttype(Paymenttype paymenttype) {
		this.paymenttype = paymenttype;
	}

	public Long getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Long createtime) {
		this.createtime = createtime;
	}

	
}