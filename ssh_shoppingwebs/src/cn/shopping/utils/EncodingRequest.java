package cn.shopping.utils;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

/*
 * 装饰request
 */
public class EncodingRequest extends HttpServletRequestWrapper {
	private HttpServletRequest req;

	public EncodingRequest(HttpServletRequest request) {
		super(request);
		this.req = request;
	}

	public String getParameter(String arg0) {
		// TODO Auto-generated method stub
		String value = req.getParameter(arg0);
		// 处理编码
		try {
			value = new String(value.getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
		return value;
	}

}
