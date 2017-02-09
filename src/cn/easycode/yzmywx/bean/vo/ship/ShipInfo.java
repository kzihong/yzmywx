package cn.easycode.yzmywx.bean.vo.ship;

import java.io.Serializable;
import java.util.List;

public class ShipInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String EBusinessID;
	private String ShipperCode;
	private boolean Success;
	private String State;//物流状态：2-在途中,3-签收,4-问题件
	private List<ShipTrace> Traces;
	public String getEBusinessID() {
		return EBusinessID;
	}
	public void setEBusinessID(String eBusinessID) {
		EBusinessID = eBusinessID;
	}
	public String getShipperCode() {
		return ShipperCode;
	}
	public void setShipperCode(String shipperCode) {
		ShipperCode = shipperCode;
	}
	public boolean isSuccess() {
		return Success;
	}
	public void setSuccess(boolean success) {
		Success = success;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public List<ShipTrace> getTraces() {
		return Traces;
	}
	public void setTraces(List<ShipTrace> traces) {
		Traces = traces;
	}
	
	
	

}
