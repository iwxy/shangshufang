<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>电子商城--首页</title>
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1 .1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<c:if test="${not empty requestScope.msg }">
<div class="alert alert-warning" style="margin-bottom:0px;">
	<a href="#" class="close" data-dismiss="alert">
		&times;
	</a>
	<strong>警告！</strong><c:out value="${requestScope.msg }"/>
</div>
</c:if>
<%@ include file="index/head.jsp"%>
<%@include file="index/main.jsp" %>
<%@include file="index/flood.jsp" %>
</body>
</html>