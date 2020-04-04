package cn.shopping.domainImpl;

import cn.shopping.domain.Cart;

public class CartImpl implements Cart {
	String cart_id;
	String user_name;
	String book_id;
	String book_num;
	String book_name;
	String book_author;
	String book_price;
	String book_img;

	@Override
	public String toString() {
		return "CartImpl [cart_id=" + cart_id + ", user_name=" + user_name + ", book_id=" + book_id + ", book_num="
				+ book_num + ", book_name=" + book_name + ", book_author=" + book_author + ", book_price=" + book_price
				+ ", book_img=" + book_img + "]";
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

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getBook_author() {
		return book_author;
	}

	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}

	public String getBook_price() {
		return book_price;
	}

	public void setBook_price(String book_price2) {
		this.book_price = book_price2;
	}

	public String getBook_img() {
		return book_img;
	}

	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}

}
