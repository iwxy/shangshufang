package cn.shopping.serviceImpl;

import org.springframework.transaction.annotation.Transactional;

import cn.shopping.dao.UserDao;
import cn.shopping.domain.User;
import cn.shopping.service.UserService;

@Transactional
public class UserServiceImpl implements UserService {
	private UserDao userDao;
	private User user;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	/*
	 * 注册 判断用户名是否已存在 如不存在，注册 存在，返回错误信息
	 * 
	 * @see cn.shopping.service.UserService#regist(cn.shopping.domain.User)
	 */
	public void regist(User user1) throws UserException {
		user = userDao.getUsers(user1.getUser_name());
		if (user != null) {
			throw new UserException("用户名" + user.getUser_name() + "，已被注册过了！");
		}
		userDao.addUser(user1);

	}

	public User login(User user1) throws UserException {
		user = userDao.getUsers(user1.getUser_name());
		if (user == null) {
			throw new UserException("用户不存在！");
		}
		if (!user.getUser_password().equals(user1.getUser_password())) {
			throw new UserException("密码错误，请重新输入！");

		}
		return user;
	}

	/*
	 * 判断用户名是否存在 方便ajax的操作
	 * 
	 * @see cn.shopping.service.UserService#ajaxHasName(java.lang.String)
	 */
	@Override
	public boolean ajaxHasName(String username) {
		// TODO Auto-generated method stub
		User user = userDao.getUsers(username);
		if (user != null) { // 用户名已存在，返回true
			return true;
		} else {
			return false;

		}

	}

	/*
	 * 通过用户名获取用户信息 返回一个User
	 * 
	 * @see cn.shopping.service.UserService#getUser(java.lang.String)
	 */
	public User getUser(String username) {
		User user = userDao.getUsers(username);
		return user;

	}

	/*
	 * 修改个人信息
	 * 
	 * @see cn.shopping.service.UserService#alterUser(cn.shopping.domain.User,
	 * java.lang.String)
	 */
	public boolean alterUser(User user, String name) {
		if (userDao.alterUser(user, name)) {
			return true;
		} else {
			return false;
		}
	}
}
