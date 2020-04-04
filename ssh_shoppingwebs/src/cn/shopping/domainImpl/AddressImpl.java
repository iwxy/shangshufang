package cn.shopping.domainImpl;

import cn.shopping.domain.Address;

public class AddressImpl implements Address {
	int ad_id;
	String ad_name;
	String ad_province;
	String ad_city;
	String ad_county;
	String ad_address;
	String ad_phone;

	@Override
	public String toString() {
		return "AddressImpl [ad_id=" + ad_id + ", ad_name=" + ad_name + ", ad_province=" + ad_province + ", ad_city="
				+ ad_city + ", ad_county=" + ad_county + ", ad_address=" + ad_address + ", ad_phone=" + ad_phone + "]";
	}

	public int getAd_id() {
		return ad_id;
	}

	public void setAd_id(int ad_id) {
		this.ad_id = ad_id;
	}

	public String getAd_name() {
		return ad_name;
	}

	public void setAd_name(String ad_name) {
		this.ad_name = ad_name;
	}

	public String getAd_province() {
		return ad_province;
	}

	public void setAd_province(String ad_province) {
		this.ad_province = ad_province;
	}

	public String getAd_city() {
		return ad_city;
	}

	public void setAd_city(String ad_city) {
		this.ad_city = ad_city;
	}

	public String getAd_county() {
		return ad_county;
	}

	public void setAd_county(String ad_county) {
		this.ad_county = ad_county;
	}

	public String getAd_address() {
		return ad_address;
	}

	public void setAd_address(String ad_address) {
		this.ad_address = ad_address;
	}

	public String getAd_phone() {
		return ad_phone;
	}

	public void setAd_phone(String ad_phone) {
		this.ad_phone = ad_phone;
	}

}
