package cn.shopping.dao;

import java.util.List;

import cn.shopping.domainImpl.OrderImpl;
import cn.shopping.domainImpl.OrdersImpl;

public interface OrderDao {

	public void addOrder(OrdersImpl orders);

	public List<OrderImpl> order(String user_name);

	public void delOrder(String order_id);

}
