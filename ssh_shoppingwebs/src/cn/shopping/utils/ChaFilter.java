package cn.shopping.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter("/ChaFilter")
public class ChaFilter implements Filter {

	public ChaFilter() {
		// TODO Auto-generated constructor stub
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		/*
		 * 处理get请求的编码问题
		 */
		/*
		 * 调包request 1.写一个request的装饰类 2.在放行时，使用我们自己的request
		 */
		HttpServletRequest req = (HttpServletRequest) request;
		if (req.getMethod().equals("GET")) {
			EncodingRequest er = new EncodingRequest(req);
			chain.doFilter(request, response);
		} else if (req.getMethod().equals("POST")) {
			chain.doFilter(request, response);
		}

	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
