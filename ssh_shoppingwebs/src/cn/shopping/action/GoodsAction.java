package cn.shopping.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import cn.shopping.domain.Book;
import cn.shopping.domainImpl.CartsImpl;
import cn.shopping.domainImpl.OrdersImpl;
import cn.shopping.service.BookService;
import cn.shopping.service.CartService;
import cn.shopping.service.OrderService;

public class GoodsAction extends ActionSupport {
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();

	private BookService bookService;
	private CartService cartService;
	private OrderService orderService;
	private CartsImpl carts;
	private OrdersImpl orders;

	public BookService getBookService() {
		return bookService;
	}

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}

	public CartService getCartService() {
		return cartService;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public CartsImpl getCarts() {
		return carts;
	}

	public void setCarts(CartsImpl carts) {
		this.carts = carts;
	}

	public OrdersImpl getOrders() {
		return orders;
	}

	public void setOrders(OrdersImpl orders) {
		this.orders = orders;
	}

	public String discript() throws IOException {
		String book_img = request.getParameter("url");
		Book book = bookService.getBook(book_img);
		request.setAttribute("book", book);
		return "book";
	}

	public void addCart() throws IOException {
		String book_img = request.getParameter("book_img");
		String book_num = request.getParameter("book_num");
		String user_name = (String) session.getAttribute("user_name");
		if (user_name == null) {
			String str = "{\"mes\":\"您还没有登录！\"}";
			response.getWriter().print(str);
			return;
		} else {
			Book book = bookService.getBook(book_img);
			CartsImpl carts = cartService.getCart(user_name, String.valueOf(book.getBook_id()));
			if (carts == null) {
				cartService.addCart(user_name, String.valueOf(book.getBook_id()), book_num);
			} else {
				int n = Integer.parseInt(carts.getBook_num());
				n = ++n;
				book_num = String.valueOf(n);
				carts.setBook_num(book_num);
				cartService.alterCart(carts);
			}
			String str = "{\"mes\":\"成功加入购物车\"}";
			response.getWriter().print(str);
			return;
		}
	}

	public void alterCart() throws IOException {
		String book_num = request.getParameter("num");
		String book_id = request.getParameter("book_id");
		String user_name = (String) session.getAttribute("user_name");
		carts.setUser_name(user_name);
		carts.setBook_id(book_id);
		carts.setBook_num(book_num);
		cartService.alterCart(carts);
		String str = "{\"mes\":\" \"}";
		response.getWriter().print(str);
		return;
	}

	public void addOrder() throws IOException {
		String user_name = (String) session.getAttribute("user_name");
		String book_id = request.getParameter("book_id");
		String book_price = request.getParameter("book_price");
		String order_num = request.getParameter("order_num");
		String cart_id = request.getParameter("cart_id");
		orders.setUser_name(user_name);
		orders.setBook_id(book_id);
		orders.setOrder_num(order_num);
		if (user_name == null) {
			String str = "{\"mes\":\"你还没有登录！\"}";
			response.getWriter().print(str);
			return;
		} else {
			orderService.addOrder(orders, book_price);
			cartService.delCart(cart_id);
			String str = "{\"mes\":\"购买成功！\"}";
			response.getWriter().print(str);
			return;
		}
	}

}
