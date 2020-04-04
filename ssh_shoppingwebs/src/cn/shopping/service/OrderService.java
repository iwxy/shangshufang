package cn.shopping.service;

import java.util.List;

import cn.shopping.domainImpl.OrderImpl;
import cn.shopping.domainImpl.OrdersImpl;

public interface OrderService {

	public void addOrder(OrdersImpl order, String book_price);

	public List<OrderImpl> order(String user_name);

	public void delOrder(String order_id);

}
