package cn.shopping.domain;

public interface Order {
	public String toString();

	public String getOrder_id();

	public void setOrder_id(String order_id);

	public String getUser_name();

	public void setUser_name(String user_name);

	public String getBook_id();

	public void setBook_id(String book_id);

	public String getOrder_price();

	public void setOrder_price(String order_price);

	public String getOrder_num();

	public void setOrder_num(String order_num);

	public String getBook_name();

	public void setBook_name(String book_name);

	public String getBook_price();

	public void setBook_price(String book_price);

	public String getBook_img();

	public void setBook_img(String book_img);

	public String getBook_author();

	public void setBook_author(String book_author);

}
