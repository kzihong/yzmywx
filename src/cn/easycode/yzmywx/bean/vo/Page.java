package cn.easycode.yzmywx.bean.vo;

import java.io.Serializable;

public class Page implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int page;
	private int rows;
	private long total;
	
	public Page(){}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	
}
