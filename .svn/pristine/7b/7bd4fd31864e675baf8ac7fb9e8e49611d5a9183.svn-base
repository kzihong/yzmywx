package cn.easycode.yzmywx.bean.eo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Transient;

import cn.easycode.yzmywx.utils.DateUtil;


/**
 * The persistent class for the companynews database table.
 * 
 */
@Entity
@Table(name="companynews")
public class Companynew implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	@Lob
	private String content;
	
	@Transient
	private String formatcontent;

	private long createtime;
	
	@Transient
	private String formatcreatetime;

	private String title;
	
	private String photoUrl;

	public Companynew() {
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

	public Long getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Long createtime) {
		this.createtime = createtime;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getFormatcreatetime() {
		if (createtime > 0) {
			this.formatcreatetime = DateUtil.dateToString(new Date(createtime));
		}
		return this.formatcreatetime;
	}

	public String getFormatcontent() {
		return formatcontent;
	}

	public void setFormatcontent(String formatcontent) {
		this.formatcontent = formatcontent;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}
	

}