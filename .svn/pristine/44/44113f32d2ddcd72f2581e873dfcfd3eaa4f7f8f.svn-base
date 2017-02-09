package cn.easycode.yzmywx.bean.eo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * The persistent class for the customer database table.
 * 
 */
@Entity
@Table(name = "customer")
public class Customer implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String openid;
	
	private String locationprecision;
	
	private String longitude;
	
	private String latitude;

	public Customer() {
	}

	public String getOpenid() {
		return this.openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public String getLocationprecision() {
		return locationprecision;
	}

	public void setLocationprecision(String precision) {
		this.locationprecision = precision;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((openid == null) ? 0 : openid.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Customer other = (Customer) obj;
		if (openid == null) {
			if (other.openid != null)
				return false;
		} else if (!openid.equals(other.openid))
			return false;
		return true;
	}
	
	
}