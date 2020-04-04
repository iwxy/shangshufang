package cn.shopping.domain;

public interface Cart {
	public String toString();

	public String getCart_id();

	public void setCart_id(String cart_id);

	public String getUser_name();

	public void setUser_name(String user_name);

	public String getBook_id();

	public void setBook_id(String book_id);

	public String getBook_num();

	public void setBook_num(String book_num);

	public String getBook_name();

	public void setBook_name(String book_name);

	public String getBook_author();

	public void setBook_author(String book_author);

	public String getBook_price();

	public void setBook_price(String book_price);

	public String getBook_img();

	public void setBook_img(String book_img);
}
