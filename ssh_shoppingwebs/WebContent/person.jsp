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

<%-- <c:if test="${not empty requestScope.msg }">
<div class="alert alert-warning" style="margin-bottom:0px;">
	<a href="#" class="close" data-dismiss="alert">
		&times;
	</a>
	<c:if test="${requestScope.msg eq '电话号码错误！' }">
		<strong>错误！</strong><c:out value="${requestScope.msg }"/>
	</c:if>
	<c:if test="${requestScope.msg eq '成功' }">
		<strong>个人信息修改成功！</strong>
	</c:if>
	<c:if test="${requestScope.msg eq '失败' }">
		<strong>警告！</strong>修改失败！
	</c:if>
	
</div>
</c:if> --%>

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
			<form action="<c:url value='bar_alterPerson'/>" method="post">
				<input type="hidden" name="method" value="alterPerson"/>
				<div class="person_right_mes" align="left"><font size="2" color="#030303">用户名：&nbsp;<c:out value="${requestScope.user.user_name }"/></font></div>
				<div class="person_right_mes" align="left"><font size=2" color="#030303">密 &nbsp;码：&nbsp;&nbsp;&nbsp;<a href="alterPw.jsp">修改密码</a></font></div>
				<div class="person_right_mes" align="left"><font size="2" color="#030303">男 &nbsp;女：&nbsp;&nbsp;&nbsp;
					<c:choose>
						<c:when test="${requestScope.user.user_sex eq '男'}"><input type="radio" name="user.user_sex" value="男" checked="checked">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
						<c:otherwise><input type="radio" name="user_sex" value="男">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${requestScope.user.user_sex eq '女'}"><input type="radio" name="user.user_sex" value="女" checked="checked">女</font></c:when>
						<c:otherwise><input type="radio" name="user_sex" value="女">女</font></c:otherwise>
					</c:choose>
				</div>
				<div class="person_right_mes" align="left"><font size="2" color="#030303">电话号码：&nbsp;&nbsp;&nbsp;<input type="text" name="user.user_phone" class="person_right_input" value="${requestScope.user.user_phone }"></font></div>
				<div class="person_right_botton" align="left">
					<font color="#fefdfb"><input type="submit" value="保 存" class="person_right_button"></font>
					
					<c:if test="${not empty requestScope.msg }">
		
						<c:if test="${requestScope.msg eq '电话号码错误！' }">
							<div class="alert alert-danger alert-dismissable" style="width:300px; height:50px; margin-left:50px; float:left;">
								<button type="button" class="close" data-dismiss="alert"
										aria-hidden="true">
									&times;
								</button>
								<font size="3"><strong>错误！</strong><c:out value="${requestScope.msg }"/></font>
							</div>
						</c:if>
						<c:if test="${requestScope.msg eq '密码不能小于六位数！' }">
							<div class="alert alert-danger alert-dismissable" style="width:300px; height:50px; margin-left:50px; float:left;">
								<button type="button" class="close" data-dismiss="alert"
										aria-hidden="true">
									&times;
								</button>
								<font size="3"><strong>错误！</strong><c:out value="${requestScope.msg }"/></font>
							</div>
						</c:if>
						<c:if test="${requestScope.msg eq '失败' }">
							<div class="alert alert-danger alert-dismissable" style="width:300px; height:50px; margin-left:50px; float:left;">
								<button type="button" class="close" data-dismiss="alert"
										aria-hidden="true">
									&times;
								</button>
								<font size="3"><strong>失败！</strong>修改失败！</font>
							</div>
						</c:if>
						<c:if test="${requestScope.msg eq '成功' }">
							<div class="alert alert-success alert-dismissable"  style="width:300px; height:50px; margin-left:50px; float:left;">
								<button type="button" class="close" data-dismiss="alert"
										aria-hidden="true">
									&times;
								</button>
								<font size="3">个人信息修改成功！</font>
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