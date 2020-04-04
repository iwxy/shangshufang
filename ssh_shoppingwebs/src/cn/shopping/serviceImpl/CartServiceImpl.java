package cn.shopping.serviceImpl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.shopping.dao.CartDao;
import cn.shopping.domainImpl.CartImpl;
import cn.shopping.domainImpl.CartsImpl;
import cn.shopping.service.CartService;

@Transactional
public class CartServiceImpl implements CartService {
	private CartDao cartDao;
	private CartsImpl carts;

	public CartsImpl getCarts() {
		return carts;
	}

	public void setCarts(CartsImpl carts) {
		this.carts = carts;
	}

	public CartDao getCartDao() {
		return cartDao;
	}

	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}

	@Override
	public void addCart(String user_name, String book_id, String book_num) {
		carts.setUser_name(user_name);
		carts.setBook_id(book_id);
		carts.setBook_num(book_num);
		cartDao.addCart(carts);

	}

	@Override
	public List<CartImpl> cart(String user_name) {
		List<CartImpl> cartList = cartDao.cart(user_name);
		return cartList;
	}

	@Override
	public void alterCart(CartsImpl carts) {
		cartDao.alterCart(carts);

	}

	@Override
	public void delCart(String cart_id) {
		cartDao.delCart(cart_id);

	}

	@Override
	public CartsImpl getCart(String user_name, String book_id) {
		CartsImpl cart = cartDao.getCart(user_name, book_id);
		return cart;
	}

}
