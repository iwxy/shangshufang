package cn.shopping.dao;

import cn.shopping.domain.User;
import cn.shopping.domainImpl.UserImpl;

public interface UserDao {
	public void addUser(User user);

	public UserImpl getUsers(String name);

	public boolean alterUser(User user, String name);
}
