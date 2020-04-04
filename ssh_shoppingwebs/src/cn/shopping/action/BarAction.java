package cn.shopping.action;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import cn.shopping.domain.User;
import cn.shopping.domainImpl.BookImpl;
import cn.shopping.domainImpl.CartImpl;
import cn.shopping.domainImpl.OrderImpl;
import cn.shopping.domainImpl.PageBeanImpl;
import cn.shopping.domainImpl.UserImpl;
import cn.shopping.service.BookService;
import cn.shopping.service.CartService;
import cn.shopping.service.OrderService;
import cn.shopping.service.UserService;

public class BarAction extends ActionSupport {
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();

	private UserService userService;
	private CartService cartService;
	private OrderService orderService;
	private BookService bookService;
	private UserImpl user;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public void setUser(UserImpl user) {
		this.user = user;
	}

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}

	public UserImpl getUser() {
		return user;
	}

	/*
	 * 点击退出登录时，调用这个方法，将user_name移出session
	 */
	public String exit() throws IOException {
		session.removeAttribute("user_name");
		return "exit";
	}

	/*
	 * 点击个人信息时调用这个方法
	 */
	public String person() throws IOException {
		String name = (String) session.getAttribute("user_name");
		if (name == null) {
			request.setAttribute("msg", "你还没有登录！");
			return "index";
		} else {
			User user = userService.getUser(name);// 通过名字从数据库获取某人的所有信息
			request.setAttribute("user", user);
			return "person";
		}
	}

	/*
	 * 修改个人信息
	 */
	public String alterPerson() throws IOException {
		String name = (String) session.getAttribute("user_name");
		user.setUser_name(name);
		if (!user.getUser_phone().matches("\\d{11}")) {
			request.setAttribute("msg", "电话号码错误！");
			request.setAttribute("user", user);
			return "person";
		}
		if (userService.alterUser(user, name)) {
			request.setAttribute("msg", "成功");
			request.setAttribute("user", user);
			return "person";
		} else {
			request.setAttribute("msg", "失败");
			request.setAttribute("user", user);
			return "person";
		}
	}

	public String cart() throws IOException {
		String user_name = (String) session.getAttribute("user_name");
		if (user_name == null) {
			request.setAttribute("msg", "您还没有登录！");
			return "index";
		} else {
			List<CartImpl> cartList = cartService.cart(user_name);
			request.setAttribute("cartList", cartList);
			return "cart";
		}
	}

	public String delCart() throws IOException {
		String cart_id = request.getParameter("cart_id");
		cartService.delCart(cart_id);
		return "action_cart";
	}

	public String order() throws IOException {
		String user_name = (String) session.getAttribute("user_name");
		if (user_name == null) {
			request.setAttribute("msg", "您还没有登录！");
			return "index";
		} else {
			List<OrderImpl> ordertList = orderService.order(user_name);
			request.setAttribute("orderList", ordertList);
			return "order";
		}
	}

	public String delOrder() throws IOException {
		String order_id = request.getParameter("order_id");
		orderService.delOrder(order_id);
		return "action_order";
	}

	public String searchGoods() throws IOException {
		PageBeanImpl<BookImpl> page = new PageBeanImpl<BookImpl>();
		page.setPc(Integer.parseInt(request.getParameter("pc")));
		page.setUrl(request.getParameter("url"));
		page.setPs(6);

		PageBeanImpl<BookImpl> pageBean = bookService.searchGoods(page);
		if (pageBean == null) {
			request.setAttribute("msg", "抱歉，本网站暂时没有相关的书籍！");
			return "search";
		}
		String url = pageBean.getUrl();
		url = URLEncoder.encode(url, "utf-8");// 进行URL编码
		pageBean.setUrl(url);
		request.setAttribute("pageBean", pageBean);
		return "search";
	}

}
