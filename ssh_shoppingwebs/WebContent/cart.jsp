<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>购物车</title>
	<link href="css/reg.css" rel="stylesheet" type="text/css"/>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="index/head.jsp"%>
<div class="cart_back">
<c:forEach items="${requestScope.cartList }" var="cart">
	<div class="cart_box">
		<div class="cart_box_left">
			<div class="cart_left_img" style="width:130px; height:170px;">
				<a href="<c:url value="goods_discript?url=${cart.book_img }"/>" target="_blank">
				<img src="images/<c:out value="${cart.book_img }"/>"/ style="width:130px; height:170px;">
				</a>
			</div>
		</div>
		<div class="cart_box_center">
			<div class="cart_center_top"><font size="3" style="float:left;">书名：<c:out value="${cart.book_name }"/></font></div>
			<div class="cart_center_center"><font size="3" style="float:left;">作者：<c:out value="${cart.book_author }"/></font></div>
			<div class="cart_center_bottom">
				<div class="cart_bottom_left"><font size="3" style="float:left;">价格：￥<c:out value="${cart.book_price }"/></font></div>
				<div class="cart_bottom_right">
					<div class="cart_num" style="width:150px; hieght:30px; background:#f5e1d0;">
				        <button type="button" id="sub" class="btn btn-default btn-sm" onclick="sub(${cart.book_id})" style="float:left;">
				          <span class="glyphicon glyphicon-minus"></span>
				        </button>
				        <font size="3"><input type="text" id="${cart.book_id }" class="cart_input_num" value="<c:out value="${cart.book_num }"/>" size="1" readonly="readonly"/></font>
				         <button type="button" id="add" class="btn btn-default btn-sm" onclick="add(${cart.book_id})" style="float:right;">
				          <span class="glyphicon glyphicon-plus"></span>
				        </button>
					</div>
				</div>
			</div>
		</div>
		<div class="cart_box_right">
			<font color="fefdfc">
				<p class="tooltip-options" >
					<a id="${cart.book_id }tip" data-toggle="tooltip" title="<h5>购买成功！</h5>" data-trigger="click" data-placement="top"></a>
				</p>
				<script>
				$(function () { $(".tooltip-options a").tooltip({html : true });});
				</script>
				<input class="cart_buy" type="button" value="购 买" onclick="addOrder(${cart.book_id },${cart.book_price },${cart.cart_id })">
			</font>
			<a href="<c:url value='bar_delCart?cart_id=${cart.cart_id }'/>"><input class="cart_del" type="button" value="删 除"></a>
		</div>
	</div>
</c:forEach>
</div>


<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@include file="index/flood.jsp" %>
</body>
<script type="text/javascript">
	function add(bookid){
		var num=document.getElementById(bookid);
		var a=++num.value;
		num.value=a;
		 ajax(
					{
						method:"POST",
						params:"num="+a+"&book_id="+bookid,
						url:"<c:url value='goods_alterCart'/>",
						type:"json",
						callback:function(data){}
					}
				); 
	}
	
	function sub(bookid){
		var num=document.getElementById(bookid);
		if(num.value>1){
			var a=num.value-1;
			num.value=a;
			ajax(
					{
						method:"POST",
						params:"num="+a+"&book_id="+bookid,
						url:"<c:url value='goods_alterCart'/>",
						type:"json",
						callback:function(data){}
					}
				); 
		}
	}
	
	function addOrder(book_id,book_price,cart_id){
		var num=document.getElementById(book_id);
		var book_num=num.value;
		var tip=document.getElementById(book_id+"tip");
		window.location.href = "<c:url value='address.jsp'/>";
		ajax(
				{
					method:"POST",
					params:"book_id="+book_id+"&book_price="+book_price+"&order_num="+book_num+"&cart_id="+cart_id,
					url:"<c:url value='goods_addOrder'/>",
					type:"json",
					callback:function(data){
						if(data.mes=="购买成功！"){
							tip.click();
							setTimeout(function(){
							      tip.click();
							    },1000);
							window.location.href = "<c:url value='bar_order'/>";
						}
					}
				}
			); 
	}
</script>
</html>