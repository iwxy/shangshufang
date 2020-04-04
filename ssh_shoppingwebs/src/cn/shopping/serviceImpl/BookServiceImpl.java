package cn.shopping.serviceImpl;

import org.springframework.transaction.annotation.Transactional;

import cn.shopping.dao.BookDao;
import cn.shopping.domain.Book;
import cn.shopping.domainImpl.BookImpl;
import cn.shopping.domainImpl.PageBeanImpl;
import cn.shopping.service.BookService;

@Transactional
public class BookServiceImpl implements BookService {
	BookDao bookDao;

	public BookDao getBookDao() {
		return bookDao;
	}

	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}

	@Override
	public Book getBook(String book_img) {
		Book book = bookDao.getBook(book_img);
		return book;
	}

	@Override
	public PageBeanImpl<BookImpl> searchGoods(PageBeanImpl<BookImpl> page) {
		return bookDao.searchGoods(page);
	}

}
