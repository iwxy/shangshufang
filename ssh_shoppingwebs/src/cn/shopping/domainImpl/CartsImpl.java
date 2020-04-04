package cn.shopping.domainImpl;

import cn.shopping.domain.Carts;

public class CartsImpl implements Carts {

	String cart_id;
	String user_name;
	String book_id;
	String book_num;

	@Override
	public String toString() {
		return "CartImpl [cart_id=" + cart_id + ", user_name=" + user_name + ", book_id=" + book_id + ", book_num="
				+ book_num + "]";
	}

	public String getCart_id() {
		return cart_id;
	}

	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
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

	public String getBook_num() {
		return book_num;
	}

	public void setBook_num(String book_num) {
		this.book_num = book_num;
	}

}
