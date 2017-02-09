package cn.easycode.yzmywx.bean.vo.order;

import java.io.Serializable;
import java.util.List;

import cn.easycode.yzmywx.bean.eo.shop.Cartitem;
import cn.easycode.yzmywx.bean.eo.shop.Shipinfo;

public class ShipCartitem implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<Cartitem> cartitems;
	
	private Shipinfo shipinfo;
	
	public ShipCartitem(){}

	public List<Cartitem> getCartitems() {
		return cartitems;
	}

	public void setCartitems(List<Cartitem> cartitems) {
		this.cartitems = cartitems;
	}

	public Shipinfo getShipinfo() {
		return shipinfo;
	}

	public void setShipinfo(Shipinfo shipinfo) {
		this.shipinfo = shipinfo;
	}
	

}
