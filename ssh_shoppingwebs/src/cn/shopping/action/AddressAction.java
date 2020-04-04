package cn.shopping.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import cn.shopping.domain.Address;
import cn.shopping.domainImpl.AddressImpl;
import cn.shopping.service.AddressService;

public class AddressAction extends ActionSupport {
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();

	AddressService addressService;

	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}

	public String save() throws IOException {
		String ad_name = request.getParameter("ad_name");
		String ad_address = request.getParameter("ad_address");
		String ad_phone = request.getParameter("ad_phone");
		String ad_province = request.getParameter("ad_province");
		String ad_city = request.getParameter("ad_city");
		String ad_county = request.getParameter("ad_county");
		Address address = new AddressImpl();
		address.setAd_name(ad_name);
		address.setAd_address(ad_address);
		address.setAd_phone(ad_phone);
		address.setAd_province(ad_province);
		address.setAd_city(ad_city);
		address.setAd_county(ad_county);
		boolean b = addressService.save(address);
		if (b) {
			return "order";
		} else {
			return "address";
		}

	}

}
