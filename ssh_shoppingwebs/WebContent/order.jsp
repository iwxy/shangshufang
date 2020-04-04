<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>订单</title>
	<link href="css/reg.css" rel="stylesheet" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="index/head.jsp"%>
<div class="order_back">
<c:forEach items="${requestScope.orderList }" var="order">
	<div class="order_box">
		<div class="order_box_left">
			<div class="order_left_img" style="width:100px; height:140px;">
				<a href="<c:url value="goods_discript?url=${order.book_img }"/>" target="_blank">
				<img src="images/<c:out value="${order.book_img }"/>" style="width:100px; height:140px;">
				</a>
			</div>
		</div>
		<div class="order_box_right">
			<div class="order_right_top">
				<font size="3" style="float:left;"><b>书名：<c:out value="${order.book_name }"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作者：<c:out value="${order.book_author }"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价格：￥<c:out value="${order.book_price }"/></b></font>
			</div>
			<div class="order_right_center">
				<font size="3" style="float:left;"><b>共 <c:out value="${order.order_num }"/> 件商品，合计 <c:out value="${order.order_price }"/> 元</b></font>
			</div>
			<div class="order_right_bottom">
				<a href="<c:url value="bar_delOrder?order_id=${order.order_id }"/>"><input class="order_bottom_del" type="button" value="取消订单"></a>
			</div>
		</div>
	</div>
</c:forEach>
</div>
<%@include file="index/flood.jsp" %>
</body>
</html>