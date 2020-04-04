package cn.shopping.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.springframework.orm.hibernate5.HibernateTemplate;

import cn.shopping.dao.OrderDao;
import cn.shopping.dao.TxQueryRunner;
import cn.shopping.domainImpl.BookImpl;
import cn.shopping.domainImpl.OrderImpl;
import cn.shopping.domainImpl.OrdersImpl;

public class OrderDaoImpl implements OrderDao {
	private QueryRunner qr = new TxQueryRunner();
	// 得到hibernateTemplate对象
	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public void addOrder(OrdersImpl orders) {
		hibernateTemplate.save(orders);

	}

	@Override
	public List<OrderImpl> order(String user_name) {
		List<OrderImpl> orderList = new ArrayList<OrderImpl>();
		try {
			List<?> list = hibernateTemplate.findByNamedParam(
					"from OrdersImpl o,BookImpl b where o.user_name=:names and o.book_id=b.book_id", "names",
					user_name);
			for (int i = 0; i < list.size(); i++) {
				Object[] object = (Object[]) list.get(i);// 每行记录不在是一个对象 而是一个数组
				OrdersImpl orders = (OrdersImpl) object[0];
				BookImpl book = (BookImpl) object[1];
				OrderImpl order = new OrderImpl();
				// 重新封装在一个javabean里面
				order.setOrder_id(orders.getOrder_id());
				order.setUser_name(orders.getUser_name());
				order.setBook_id(orders.getBook_id());
				order.setOrder_price(orders.getOrder_price());
				order.setOrder_num(orders.getOrder_num());
				order.setBook_name(book.getBook_name());
				order.setBook_price(book.getBook_price());
				order.setBook_img(book.getBook_img());
				order.setBook_author(book.getBook_author());
				orderList.add(order); // 最终封装在list中 传到前台。
			}
			return orderList;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public void delOrder(String order_id) {
		try {
			OrdersImpl orders = hibernateTemplate.get(OrdersImpl.class, order_id);
			hibernateTemplate.delete(orders);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}

}
