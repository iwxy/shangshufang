package cn.shopping.domainImpl;

import cn.shopping.domain.Orders;

public class OrdersImpl implements Orders {
	String order_id;
	String user_name;
	String book_id;
	String order_price;
	String order_num;

	@Override
	public String toString() {
		return "order [order_id=" + order_id + ", user_name=" + user_name + ", book_id=" + book_id + ", order_price="
				+ order_price + ", order_num=" + order_num + "]";
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getBook_id() {
		return book_id;
	}

	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}

	public String getOrder_price() {
		return order_price;
	}

	public void setOrder_price(String order_price) {
		this.order_price = order_price;
	}

	public String getOrder_num() {
		return order_num;
	}

	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}

}
