package cn.shopping.dao;

import cn.shopping.domain.Book;
import cn.shopping.domainImpl.BookImpl;
import cn.shopping.domainImpl.PageBeanImpl;

public interface BookDao {

	public Book getBook(String book_img);

	public PageBeanImpl<BookImpl> searchGoods(PageBeanImpl<BookImpl> page);

}
