package cn.shopping.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;

import cn.shopping.dao.CartDao;
import cn.shopping.domainImpl.BookImpl;
import cn.shopping.domainImpl.CartImpl;
import cn.shopping.domainImpl.CartsImpl;

public class CartDaoImpl implements CartDao {

	// 得到hibernateTemplate对象
	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public void addCart(CartsImpl carts) {
		hibernateTemplate.save(carts);
	}

	@Override
	public List<CartImpl> cart(String user_name) {
		List<CartImpl> cartList = new ArrayList<CartImpl>();
		try {
			List<?> list = hibernateTemplate.findByNamedParam(
					"from BookImpl b,CartsImpl c where c.user_name=:names and c.book_id=b.book_id", "names", user_name);

			for (int i = 0; i < list.size(); i++) {
				Object[] object = (Object[]) list.get(i);// 每行记录不在是一个对象 而是一个数组
				BookImpl book = (BookImpl) object[0];
				CartsImpl carts = (CartsImpl) object[1];
				CartImpl cart = new CartImpl();
				// 重新封装在一个javabean里面
				cart.setCart_id(carts.getCart_id());
				cart.setUser_name(carts.getUser_name());
				cart.setBook_id(carts.getBook_id());
				cart.setBook_num(carts.getBook_num());
				cart.setBook_name(book.getBook_name());
				cart.setBook_author(book.getBook_author());
				cart.setBook_price(book.getBook_price());
				cart.setBook_img(book.getBook_img());
				cartList.add(cart); // 最终封装在list中 传到前台。
			}
			return cartList;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public void alterCart(CartsImpl carts) {
		String[] param = { "name", "id" };
		String[] value = { carts.getUser_name(), carts.getBook_id() };
		CartsImpl cart = (CartsImpl) hibernateTemplate
				.findByNamedParam("from CartsImpl c where c.user_name=:name and c.book_id=:id", param, value).get(0);
		cart.setBook_num(carts.getBook_num());
		hibernateTemplate.update(cart);
	}

	@Override
	public void delCart(String cart_id) {
		try {
			CartsImpl cart = hibernateTemplate.get(CartsImpl.class, cart_id);
			hibernateTemplate.delete(cart);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public CartsImpl getCart(String user_name, String book_id) {
		String[] param = { "name", "id" };
		String[] value = { user_name, book_id };
		List<?> list = hibernateTemplate.findByNamedParam("from CartsImpl c where c.user_name=:name and c.book_id=:id",
				param, value);
		if (list.size() == 0) {
			return null;
		} else {
			CartsImpl cart = (CartsImpl) list.get(0);
			return cart;
		}
	}

}
