package cn.shopping.domainImpl;

import cn.shopping.domain.Book;

public class BookImpl implements Book {
	int book_id;
	String book_name;// 书名
	String book_descript;// 书的简介
	String book_price;// 价格
	String book_img;// 图片的地址
	String book_time;// 出版时间
	String book_author;// 作者
	String book_publish;// 出版社

	@Override
	public String toString() {
		return "BookImpl [book_id=" + book_id + ", book_name=" + book_name + ", book_descript=" + book_descript
				+ ", book_price=" + book_price + ", book_img=" + book_img + ", book_time=" + book_time
				+ ", book_author=" + book_author + ", book_publish=" + book_publish + "]";
	}

	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getBook_descript() {
		return book_descript;
	}

	public void setBook_descript(String book_descript) {
		this.book_descript = book_descript;
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

	public String getBook_time() {
		return book_time;
	}

	public void setBook_time(String book_time) {
		this.book_time = book_time;
	}

	public String getBook_author() {
		return book_author;
	}

	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}

	public String getBook_publish() {
		return book_publish;
	}

	public void setBook_publish(String book_publish) {
		this.book_publish = book_publish;
	}

}
