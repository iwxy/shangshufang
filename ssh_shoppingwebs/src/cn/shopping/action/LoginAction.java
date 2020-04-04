package cn.shopping.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import cn.shopping.domain.User;
import cn.shopping.service.UserService;
import cn.shopping.serviceImpl.UserException;

public class LoginAction extends ActionSupport {
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();

	private String user_name;
	private String user_password;
	private String text;
	private String verify;
	private String password;
	private String user_phone;
	private String user_sex;

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return password;
	}

	public void setText(String text) {
		this.text = text;
	}

	public void setVerify(String verify) {
		this.verify = verify;
	}

	public String getVerify() {
		return verify;
	}

	public String getText() {
		return text;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}

	public String getUser_sex() {
		return user_sex;
	}

	private User user;

	public void setUser(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void loginName() throws IOException {
		if (user_name == "") {
			String str = "{\"msg\":\"请输入用户名！\"}";
			response.getWriter().print(str);
			return;
		} else if (!userService.ajaxHasName(user_name)) {
			String str = "{\"msg\":\"用户名不存在！\"}";
			response.getWriter().print(str);
			return;
		} else {
			String str = "{\"msg\":\" \"}";
			response.getWriter().print(str);
			return;
		}
	}

	public void isEmpty() throws IOException {
		if (text == "") {
			String str = "{\"msg\":\"请输入你的信息！\"}";
			response.getWriter().print(str);
			return;
		} else {
			String str = "{\"msg\":\" \"}";
			response.getWriter().print(str);
			return;
		}
	}

	public void loginVerify() throws IOException {
		String trueverify = (String) request.getSession().getAttribute("session_vcode");
		if (verify == "") {
			String str = "{\"msg\":\"请输入验证码！\"}";
			response.getWriter().print(str);
			return;
		} else if (!verify.equalsIgnoreCase(trueverify)) {
			String str = "{\"msg\":\"验证码错误！\"}";
			response.getWriter().print(str);
			return;
		} else {
			String str = "{\"msg\":\" \"}";
			response.getWriter().print(str);
			return;
		}
	}

	public void registName() throws IOException {
		if (user_name == "") {
			String str = "{\"msg\":\"请输入用户名！\"}";
			response.getWriter().print(str);
			return;
		} else if (userService.ajaxHasName(user_name)) {
			String str = "{\"msg\":\"用户名已存在！\"}";
			response.getWriter().print(str);
			return;
		} else {
			String str = "{\"msg\":\" \"}";
			response.getWriter().print(str);
			return;
		}
	}

	public void RegistPassword() throws IOException {
		if (password == "") {
			String str = "{\"msg\":\"请输入你的信息！\"}";
			response.getWriter().print(str);
			return;
		} else if (password.length() < 6) {
			String str = "{\"msg\":\"密码不能小于六位数！\"}";
			response.getWriter().print(str);
			return;
		} else {
			String str = "{\"msg\":\" \"}";
			response.getWriter().print(str);
			return;
		}
	}

	public void RegistrePassword() throws IOException {
		if (user_password == "") {
			String str = "{\"msg\":\"请输入你的信息！\"}";
			response.getWriter().print(str);
			return;
		} else if (!password.equals(user_password)) {
			String str = "{\"msg\":\"两遍输入的密码不一致！\"}";
			response.getWriter().print(str);
			return;
		} else {
			String str = "{\"msg\":\" \"}";
			response.getWriter().print(str);
			return;
		}
	}

	public void registPhone() throws IOException {
		if (user_phone == "") {
			String str = "{\"msg\":\"请输入你的信息！\"}";
			response.getWriter().print(str);
			return;
		} else if (!user_phone.matches("\\d{11}")) {
			String str = "{\"msg\":\"电话号码错误，请重新输入！\"}";
			response.getWriter().print(str);
			return;
		} else {
			String str = "{\"msg\":\" \"}";
			response.getWriter().print(str);
			return;
		}
	}

	public void login() throws IOException {
		user.setUser_name(user_name);
		user.setUser_password(user_password);
		if (session.getAttribute("user_name") != null) {
			if (user.getUser_name().equals(session.getAttribute("user_name"))) {
				String str = "{\"msg\":\"您已经登录了！\"}";
				response.getWriter().print(str);
				return;
			}
		}
		try {
			User user = userService.login(getUser());
			session.setAttribute("user_name", user.getUser_name());
			String str = "{\"msg\":\"登录成功！\"}";
			response.getWriter().print(str);
			return;

		} catch (UserException e) {
			// TODO Auto-generated catch block
			if (e.getMessage().contains("用户不存在")) {
				String str = "{\"msg\":\"用户名不存在，请重新输入！\"}";
				response.getWriter().print(str);
				return;
			}
			if (e.getMessage().contains("密码错误")) {
				String str = "{\"msg\":\"密码错误，请重新输入！\"}";
				response.getWriter().print(str);
				return;
			}
		}
	}

	public void regist() throws IOException {
		user.setUser_name(user_name);
		user.setUser_password(user_password);
		user.setUser_phone(user_phone);
		user.setUser_sex(user_sex);
		if (user.getUser_password().length() < 6) {
			String str = "{\"msg\":\"密码不能小于六位数！\"}";
			response.getWriter().print(str);
			return;
		}
		if (!password.equals(user.getUser_password())) {
			String str = "{\"msg\":\"两遍输入的密码不一致！\"}";
			response.getWriter().print(str);
			return;
		}
		try {
			userService.regist(user);
			String str = "{\"msg\":\"注册成功！\"}";
			response.getWriter().print(str);
			return;
		} catch (UserException e) {
			if (e.getMessage().contains("已被注册")) {
				String str = "{\"msg\":\"用户名已存在！\"}";
				response.getWriter().print(str);
				return;
			}
		}
	}

	public String alterPassword() throws IOException {
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		String rePassword = request.getParameter("rePassword");
		String user_name = (String) session.getAttribute("user_name");
		User user = userService.getUser(user_name);
		if (!newPassword.equals(rePassword)) {
			request.setAttribute("msg", "两遍输入的密码不一致！");
			return "alterPw";
		} else if (!user.getUser_password().equals(oldPassword)) {
			request.setAttribute("msg", "原密码错误！");
			return "alterPw";
		} else {
			user.setUser_password(newPassword);
			userService.alterUser(user, user_name);
			request.setAttribute("msg", "修改完成！");
			return "alterPw";
		}

	}

}
