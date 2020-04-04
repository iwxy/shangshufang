<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>收货地址</title>
	<link href="css/reg.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>

<%@ include file="index/head.jsp"%>
<div class="back">
	<div class="ad_back">
		<div class="ad_top" align="left"><font size="4" color="#030303">填写收货地址</font></div>
		 <div class="ad_content">
       		<div class="ad_one" align="left">
       			<font size="3">收货人：&nbsp;<input type="text" name="receiverName" id="receiverName" value=""></font>
       		</div>
       		<div data-toggle="distpicker" class="ad_two" align="left">
				<font size="3"> 省&nbsp;&nbsp;份：&nbsp;<select data-province="---- 选择省 ----"  id="receiverState" name="receiverProvince"></select>
				  &nbsp;&nbsp;城&nbsp;&nbsp;市：<select data-city="---- 选择市 ----" value="" id="receiverCity" name="receiverCity"></select>
				 &nbsp;&nbsp; 区/县：<select data-district="---- 选择区 ----" value="" id="receiverDistrict" name="receiverCounty"></select></font>
			</div> 
       		<div class="ad_three" align="left">
       			<font size="3">详细地址：<textarea name="receiverAddress" id="receiverAddress" cols="60" rows="3" placeholder="建议您如实填写详细收货地址"></textarea></font>
       		</div>
       		<div class="ad_four" align="left">
       			<font size="3">联系电话：<input type="text" value="" id="receiverMobile" name="receiverMobile"/></font>
       		</div>
       		<div class="ad_five">
       			<font size="3"><input type="button" class="ad_button" id="ad_button" value="提交订单" onclick="check()"></font>
       		</div>
       		
       	</div>
	
	</div>
</div>
<%@include file="index/flood.jsp" %>

</body>

<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/distpicker.data.js"></script>
<script type="text/javascript" src="js/distpicker.js"></script>

<script type="text/javascript">
function check(){
	var name=$("#receiverName").val();
	var address=$("#receiverAddress").val();
	var phone=$("#receiverMobile").val();
	var province=$("#receiverState").val();
	var city=$("#receiverCity").val();
	var county=$("#receiverDistrict").val();
	var reg=/^[1][3,4,5,7,8][0-9]{9}$/;
	if(name && address && phone){
		if(reg.test(phone)){
			window.location.href = "<c:url value='ad_save'/>?ad_name="+name+"&ad_address="+address+"&ad_phone="+phone+"&ad_province="+province+"&ad_city="+city+"&ad_county="+county;
		}else{
			alert("电话号码错误！");
		}
	}else{
		alert("请将信息填写完整");
	}
	
	
}
</script>
</html>