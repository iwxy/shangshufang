package cn.shopping.serviceImpl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.shopping.dao.OrderDao;
import cn.shopping.domainImpl.OrderImpl;
import cn.shopping.domainImpl.OrdersImpl;
import cn.shopping.service.OrderService;

@Transactional
public class OrderServiceImpl implements OrderService {
	private OrderDao orderDao;

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	public OrderDao getOrderDao() {
		return orderDao;
	}

	@Override
	public void addOrder(OrdersImpl orders, String book_price) {
		int price = Integer.parseInt(book_price);
		int num = Integer.parseInt(orders.getOrder_num());
		String order_price = String.valueOf(price * num);
		orders.setOrder_price(order_price);
		orderDao.addOrder(orders);

	}

	@Override
	public List<OrderImpl> order(String user_name) {
		List<OrderImpl> orderList = orderDao.order(user_name);
		return orderList;
	}

	@Override
	public void delOrder(String order_id) {
		orderDao.delOrder(order_id);

	}

}
