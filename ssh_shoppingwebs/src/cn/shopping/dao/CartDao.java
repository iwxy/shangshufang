package cn.shopping.dao;

import java.util.List;

import cn.shopping.domainImpl.CartImpl;
import cn.shopping.domainImpl.CartsImpl;

public interface CartDao {

	public void addCart(CartsImpl carts);

	public List<CartImpl> cart(String user_name);

	public void alterCart(CartsImpl carts);

	public void delCart(String cart_id);

	public CartsImpl getCart(String user_name, String book_id);

}
