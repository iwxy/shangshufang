<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>查询</title>
	<meta charset="utf-8"> 
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="css/sea.css" rel="stylesheet" type="text/css" />
	
<script type="text/javascript">

function addCart(value){
	var tip1=document.getElementById(value+"1");
	var tip2=document.getElementById(value+"2");
	ajax(
			{
				method:"POST",
				params:"book_num=1&book_img="+value,
				url:"<c:url value='/goods_addCart'/>",
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

</script>
</head>
<body>
<%@ include file="index/head.jsp"%>

<div calss="search_back">
	<div class="serch_goods">
	<c:choose>
		<c:when test="${not empty requestScope.msg }">
			<font size="5"><b><c:out value="${requestScope.msg }"/></b></font>
			<div class="search_pag">
			
			</div>
		</c:when>
		<c:otherwise>
			 <table>
			 	<c:if test="${requestScope.pageBean.tr<=3 }">
			 		<tr>
			 			<c:forEach items="${requestScope.pageBean.beanList }" var="book">
			 			<td>
			 				<div class="mpro fl">
								<div class="mpro_tp">
									<a href="<c:url value="/goods_discript?url=${book.book_img }"/>" target="_blank">
										<img class="shu" src="images/${book.book_img }"/>
									</a>
								</div>
								<div class="mpro_con">
								  <table width="180" border="0" cellpadding="0" cellspacing="0">
								    <tr>
								      <td width="180" height="25" align="left" valign="middle" class="jiacu"><c:out value="${book.book_name }"/></td>
								      <td width="62" rowspan="3" align="right" valign="middle">
								      	 <p class="tooltip-options" >
											<a id="${book.book_img }1" data-toggle="tooltip" title="<h5>您还没有登录！</h5>" data-trigger="click" data-placement="right"></a>
											<a id="${book.book_img }2" data-toggle="tooltip" title="<h5>成功加入购物车</h5>" data-trigger="click" data-placement="right"></a>
										</p>
										<script>
											$(function () { $(".tooltip-options a").tooltip({html : true });});
										</script>
								      	 <a href="javascript:addCart('${book.book_img }')" ><img src="images/006.jpg"/></a>
								      	<!-- addtoshopcart?后面加上CartAction的字段属性 -->
								      </td>
								    </tr>
								   	<tr align="left" valign="middle">
								      <td width="180" height="25"><font color="#767673"><c:out value="${book.book_author }"/> </font></td>
								    </tr>
								    <tr align="left" valign="middle">
								      <td width="180" height="25"><font color=red>¥<c:out value="${book.book_price }"/> </font></td>
								    </tr>
								  </table>
								</div>
							</div>
						</td>
						
			 			</c:forEach>
			 		</tr>
			 	</c:if>
			 	<c:if test="${requestScope.pageBean.tr>3 }">
			 	<c:if test="${requestScope.pageBean.tr<=6 || pageBean.tp>1}">
			 		<c:set var="o" value="0"/>
			 		<c:set var="tr1" value="${requestScope.pageBean.tr }"/>
			 		<tr>
			 			<c:forEach items="${requestScope.pageBean.beanList }" var="book">
			 			<c:set var="o" value="${o+1 }"/>
			 			<c:if test="${o == 4 }">
			 				<tr>
			 			</c:if>
			 			
			 			<td>
			 				<div class="mpro fl">
								<div class="mpro_tp">
									<a href="<c:url value="/goods_discript?url=${book.book_img }"/>" target="_blank">
										<img class="shu" src="images/${book.book_img }"/>
									</a>
								</div>
								<div class="mpro_con">
								  <table width="180" border="0" cellpadding="0" cellspacing="0">
								    <tr>
								      <td width="180" height="25" align="left" valign="middle" class="jiacu"><c:out value="${book.book_name }"/></td>
								      <td width="62" rowspan="3" align="right" valign="middle">
								      	 <p class="tooltip-options" >
											<a id="${book.book_img }1" data-toggle="tooltip" title="<h5>您还没有登录！</h5>" data-trigger="click" data-placement="right"></a>
											<a id="${book.book_img }2" data-toggle="tooltip" title="<h5>成功加入购物车</h5>" data-trigger="click" data-placement="right"></a>
										</p>
										<script>
											$(function () { $(".tooltip-options a").tooltip({html : true });});
										</script>
								      	 <a href="javascript:addCart('${book.book_img }')" ><img src="images/006.jpg"/></a>
								      	<!-- addtoshopcart?后面加上CartAction的字段属性 -->
								      </td>
								    </tr>
								   	<tr align="left" valign="middle">
								      <td width="180" height="25"><font color="#767673"><c:out value="${book.book_author }"/> </font></td>
								    </tr>
								    <tr align="left" valign="middle">
								      <td width="180" height="25"><font color=red>¥<c:out value="${book.book_price }"/></font></td>
								    </tr>
								  </table>
								</div>
							</div>
						</td>
						
						<c:if test="${o == tr1 }">
							</tr>
						</c:if>
			 			</c:forEach>
			 		</tr>
			 	</c:if>
			 	</c:if>
			 </table>
			 </div>
		<div class="search_pag">
		<font size="4">
			第${pageBean.pc }页/共${pageBean.tp }页&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/bar_searchGoods?pc=1&url=${pageBean.url }'/>">首页</a>&nbsp;&nbsp;&nbsp;
			<c:if test="${pageBean.pc!=1 }">
				<a href="<c:url value='/bar_searchGoods?pc=${pageBean.pc-1 }&url=${pageBean.url }'/>">上一页</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			<%-- 计算begin、end --%>
			<c:choose>
				<%-- 如果总页数不足10页，那么把所有的页数都显示出来！ --%>
				<c:when test="${pageBean.tp<=10 }">
					<c:set var="begin" value="1"/>
					<c:set var="end" value="${pageBean.tp }"/>
				</c:when>
				<c:otherwise>
					<%-- 当总页数>10时，通过公式计算出begin和end --%>
					<c:set var="begin" value="${pageBean.pc-5 }"/>
					<c:set var="end" value="${pageBean.pc+4 }"/>
					<%-- 头溢出 --%>
					<c:if test="${begin<1 }">
						<c:set var="begin" value="1"/>
						<c:set var="end" value="10"/>
					</c:if>
					<%-- 尾溢出 --%>
					<c:if test="${end>pageBean.tp }">
						<c:set var="begin" value="${pageBean.tp-9 }"/>
						<c:set var="end" value="${pageBean.tp }"/>
					</c:if>
				</c:otherwise>
			</c:choose>
			<%-- 循环遍历页码列表 --%>
			<c:forEach var="i" begin="${begin }" end="${end }">
				<c:choose>
					<c:when test="${i eq pageBean.pc }">
						[${i }]
					</c:when>
					<c:otherwise>
						<a href="<c:url value="/bar_searchGoods?pc=${i }&url=${pageBean.url }"/>">[${i }]</a>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
			
			<c:if test="${pageBean.pc!=pageBean.tp }">
				<a href="<c:url value='/bar_searchGoods?pc=${pageBean.pc+1 }&url=${pageBean.url }'/>">下一页</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			<a href="<c:url value='/bar_searchGoods?pc=${pageBean.tp }&url=${pageBean.url }'/>">尾页</a>
		</font>
		</div>
		
			
		</c:otherwise>

	</c:choose>
	
	
	</div>
		
</div>
	

<%@include file="index/flood.jsp" %>
</body>
</html>