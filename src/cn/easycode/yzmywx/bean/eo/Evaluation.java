package cn.easycode.yzmywx.bean.eo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import cn.easycode.yzmywx.utils.DateUtil;


/**
 * The persistent class for the evaluation database table.
 * 
 */
@Entity
@Table(name = "evaluation")
public class Evaluation implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	@Lob
	private String content;

	@Column(name="customer_id")
	private String customerId;

	private short grade = 3;

	@OneToOne
	@JoinColumn(name="order_id")
	private Repairorder repairorder;

	@Transient
	private String orderid;
	
	private Long createtime;
	
	@Transient
	private String formatcreatetime;
	
	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public Evaluation() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public short getGrade() {
		return this.grade;
	}

	public void setGrade(short grade) {
		this.grade = grade;
	}

	public Repairorder getRepairorder() {
		return repairorder;
	}

	public void setRepairorder(Repairorder repairorder) {
		this.repairorder = repairorder;
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

	public Long getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Long createtime) {
		this.createtime = createtime;
	}
	
	
}