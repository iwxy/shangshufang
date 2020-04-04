package cn.shopping.service;

import cn.shopping.domain.User;
import cn.shopping.serviceImpl.UserException;

public interface UserService {
	public void regist(User user) throws UserException;

	public User login(User user) throws UserException;

	public boolean ajaxHasName(String username);

	public User getUser(String username);

	public boolean alterUser(User user, String name);

}
