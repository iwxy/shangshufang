<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>个人中心</title>
	<link href="css/reg.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>

<%@ include file="index/head.jsp"%>
<div class="back">
	<div class="back1">
		<div class="person_left">
			<div class="person_left_font1" align="center"><font size="5" color="#faf8f8">账号管理</h3></div>
			<div class="person_left_font"><a href="<c:url value='bar_cart'/>"><font size="3">我的购物车</font></a></div>
			<div class="person_left_font"><a href="<c:url value='bar_order'/>"><font size="3">我的订单</font></a></div>
			<div class="person_left_font"><a href="<c:url value='bar_exit'/>"><font size="3">退出登录</font></a></div>
		</div>
		<div class="person_right">
			<div class="person_right_top" align="left"><font size="3" color="#030303">个人资料</font></div>
			<div class="person_right_form">
			<form action="<c:url value='login_alterPassword'/>" method="post">
				<br/>
				<div class="person_right_mes" align="left"><font size="2" color="#030303">&nbsp;原密码：&nbsp;&nbsp;&nbsp;<input type="password" name="oldPassword" class="person_right_input" value=""></font></div>
				<div class="person_right_mes" align="left"><font size="2" color="#030303">&nbsp;新密码：&nbsp;&nbsp;&nbsp;<input type="password" name="newPassword" class="person_right_input" value=""></font></div>
				<div class="person_right_mes" align="left"><font size="2" color="#030303">重新输入：&nbsp;<input type="password" name="rePassword" class="person_right_input" value=""></font></div>
				<br/>
				<div class="person_right_botton" align="left">
					<font color="#fefdfb"><input type="submit" value="保 存" class="person_right_button"></font>
					&nbsp;&nbsp;&nbsp;&nbsp;<font size="2"><a href="<c:url value='bar_person'/>">返回个人中心</a></font>
					<c:if test="${not empty requestScope.msg }">
		
						<c:if test="${requestScope.msg eq '原密码错误！' }">
							<div class="alert alert-danger alert-dismissable" style="width:300px; height:50px; margin-left:50px; float:left;">
								<button type="button" class="close" data-dismiss="alert"
										aria-hidden="true">
									&times;
								</button>
								<font size="3"><strong>错误！</strong><c:out value="${requestScope.msg }"/></font>
							</div>
						</c:if>
						
						<c:if test="${requestScope.msg eq '两遍输入的密码不一致！' }">
							<div class="alert alert-danger alert-dismissable" style="width:300px; height:50px; margin-left:50px; float:left;">
								<button type="button" class="close" data-dismiss="alert"
										aria-hidden="true">
									&times;
								</button>
								<font size="3"><strong>错误！</strong><c:out value="${requestScope.msg }"/></font>
							</div>
						</c:if>
					
						<c:if test="${requestScope.msg eq '修改完成！' }">
							<div class="alert alert-success alert-dismissable"  style="width:300px; height:50px; margin-left:50px; float:left;">
								<button type="button" class="close" data-dismiss="alert"
										aria-hidden="true">
									&times;
								</button>
								<font size="3">密码修改成功！</font>
							</div>
						</c:if>
						
					</c:if>
				
				</div>
			</form>
			</div>
		</div>
	</div>
</div>
<%@include file="index/flood.jsp" %>

</body>
</html>