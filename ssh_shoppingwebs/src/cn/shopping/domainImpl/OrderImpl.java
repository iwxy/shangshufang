package cn.shopping.domainImpl;

import cn.shopping.domain.Order;

public class OrderImpl implements Order {
	String order_id;
	String user_name;
	String book_id;
	String order_price;
	String order_num;
	String book_name;
	String book_price;
	String book_img;
	String book_author;

	@Override
	public String toString() {
		return "order [order_id=" + order_id + ", user_name=" + user_name + ", book_id=" + book_id + ", order_price="
				+ order_price + ", order_num=" + order_num + ", book_name=" + book_name + ", book_price=" + book_price
				+ ", book_img=" + book_img + ", book_author=" + book_author + "]";
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

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getBook_price() {
		return book_price;
	}

	public void setBook_price(String book_price) {
		this.book_price = book_price;
	}

	public String getBook_img() {
		return book_img;
	}

	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}

	public String getBook_author() {
		return book_author;
	}

	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}

}
