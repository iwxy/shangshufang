package cn.shopping.daoImpl;

import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;

import cn.shopping.dao.UserDao;
import cn.shopping.domain.User;
import cn.shopping.domainImpl.UserImpl;

public class UserDaoImpl implements UserDao {
	private User user;

	public void setUser(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	// 得到hibernateTemplate对象
	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	/*
	 * 在user表中插入一条数据（添加一个用户）
	 * 
	 * @see cn.shopping.dao.UserDao#addUser(cn.shopping.domain.User)
	 */
	public void addUser(User user) {

		hibernateTemplate.save(user);

	}

	/*
	 * 通过用户名获取用户信息
	 * 
	 * @see cn.shopping.dao.UserDao#getUser(java.lang.String)
	 */
	public UserImpl getUsers(String name) {
		List<?> list = hibernateTemplate.findByNamedParam("from UserImpl u where u.user_name=:names", "names", name);
		if (list.size() == 0) {
			return null;
		} else {
			return (UserImpl) list.get(0);
		}

	}

	/*
	 * 通过用户名修改用户信息
	 * 
	 * @see cn.shopping.dao.UserDao#alterUser(cn.shopping.domain.User,
	 * java.lang.String)
	 */
	public boolean alterUser(User user, String name) {
		try {
			List<?> list = hibernateTemplate.findByNamedParam("from UserImpl u where u.user_name=:names", "names",
					name);
			User user1 = (UserImpl) list.get(0);
			user1.setUser_phone(user.getUser_phone());
			user1.setUser_sex(user.getUser_sex());
			hibernateTemplate.update(user1);
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}

	}

}
