<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>商品详情</title>
	<link href="css/reg.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
<script type="text/javascript">

function addCart(value){
	var tip1=document.getElementById(value+"1");
	var tip2=document.getElementById(value+"2");
	ajax(
			{
				method:"POST",
				params:"book_num=1&book_img="+value,
				url:"<c:url value='goods_addCart'/>",
				type:"json",
				callback:function(data){
					if(data.mes=="您还没有登录！"){
						tip1.click();
						setTimeout(function(){
						      tip1.click();
						    },1000);
					}else{
						tip2.click();
						setTimeout(function(){
						      tip2.click();
						    },1000);
					}
				}
			}
		);
}
	
function addOrder(book_id,book_price){
	var tip3=document.getElementById(book_id+"3");
	var tip4=document.getElementById(book_id+"4");
	window.location.href = "<c:url value='address.jsp'/>";
	ajax(
			{
				method:"POST",
				params:"book_id="+book_id+"&book_price="+book_price+"&order_num=1",
				url:"<c:url value='goods_addOrder'/>",
				type:"json",
				callback:function(data){
					if(data.mes=="你还没有登录！"){
						tip3.click();
						setTimeout(function(){
						      tip3.click();
						    },1000);
					}else{
						tip4.click();
						setTimeout(function(){
						      tip4.click();
						    },1000);
					}
				}
			}
		); 
}
</script>
</head>
<body>
<%@ include file="index/head.jsp"%>
<div class="book">
<div class="book_back">
	<div class="book_top"><font size="4" face="黑体" class="book_font"><b><c:out value="${requestScope.book.book_name }"/></b></font></div>
	<div class="book_left">
		<div class="book_img"><img class="shu" src="<c:url value='images/${requestScope.book.book_img }'/>"/></div>
	</div>
	<div class="book_right">
		<div class="book_right_top">
			<div class="book_right_mes">
				<div class="book_mes"><font size="2" class="book_mes_font">作者：<c:out value="${requestScope.book.book_author }"/></font></div>
				<div class="book_mes"><font size="2" class="book_mes_font">出版时间：<c:out value="${requestScope.book.book_time }"/></font></div>
				<div class="book_mes"><font size="2" class="book_mes_font">出版社：<c:out value="${requestScope.book.book_publish }"/></font></div>
				<div class="book_mes"><font size="2" class="book_mes_font">价格：<c:out value="${requestScope.book.book_price }"/></font></div>
			</div>
			<div class="book_right_button">
				 <p class="tooltip-options" >
						<a id="${requestScope.book.book_img }1" data-toggle="tooltip" title="<h5>您还没有登录！</h5>" data-trigger="click" data-placement="top"></a>
						<a id="${requestScope.book.book_img }2" data-toggle="tooltip" title="<h5>成功加入购物车</h5>" data-trigger="click" data-placement="top"></a>
					</p>
					<script>
					$(function () { $(".tooltip-options a").tooltip({html : true });});
					</script>
				<font color="#fefcfa"><input type="button" value="加入购物车" class="book_cart" onclick="addCart('${requestScope.book.book_img }')"></font><br/>
				 	<p class="tooltip-option" >
						<a id="${requestScope.book.book_id }3" data-toggle="tooltip" title="<h5>您还没有登录！</h5>" data-trigger="click" data-placement="top"></a>
						<a id="${requestScope.book.book_id }4" data-toggle="tooltip" title="<h5>购买成功！</h5>" data-trigger="click" data-placement="top"></a>
					</p>
					<script>
					$(function () { $(".tooltip-options a").tooltip({html : true });});
					$(function () { $(".tooltip-option a").tooltip({html : true });});
					</script>
				<input type="button" value="购 买" class="book_buy"  onclick="addOrder('${requestScope.book.book_id }','${requestScope.book.book_price }')">
			</div>
			
		</div>
		<div class="book_right_bottom">
			<font size="2" class="book_discript"><b>内容简介：</b></font><br/>
			<font size="2" class="book_discript"><c:out value="${requestScope.book.book_descript }"/></font>
		</div>
	</div>

</div>
</div>
<%@include file="index/flood.jsp" %>
</body>
</html>