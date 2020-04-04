package cn.shopping.daoImpl;

import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;

import cn.shopping.dao.BookDao;
import cn.shopping.domain.Book;
import cn.shopping.domainImpl.BookImpl;
import cn.shopping.domainImpl.PageBeanImpl;

public class BookDaoImpl implements BookDao {
	// 得到hibernateTemplate对象
	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public Book getBook(String book_img) {
		List<?> list = hibernateTemplate.findByNamedParam("from BookImpl b where b.book_img=:img", "img", book_img);
		BookImpl book = (BookImpl) list.get(0);
		return book;
	}

	@Override
	public PageBeanImpl<BookImpl> searchGoods(PageBeanImpl<BookImpl> page) {
		try {
			List<BookImpl> beanList = (List<BookImpl>) hibernateTemplate
					.find("from BookImpl b where b.book_name like '%" + page.getUrl() + "%'");
			int tr = beanList.size();
			if (tr == 0) {
				return null;
			}
			page.setTr(tr);
			if (tr <= 6) {
				page.setBeanList(beanList);
			} else {
				List<BookImpl> beanLists = (List<BookImpl>) hibernateTemplate.getSessionFactory().getCurrentSession()
						.createSQLQuery("select * from book b where b.book_name like '%" + page.getUrl() + "%' limit "
								+ (page.getPc() - 1) * page.getPs() + "," + page.getPs())
						.addEntity(BookImpl.class).list();
				page.setBeanList(beanLists);
			}

			return page;
		} catch (Exception e) {
			e.getMessage();
		}
		return null;
	}

}
