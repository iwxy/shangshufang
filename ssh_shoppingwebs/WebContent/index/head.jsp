<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>head</title>
	<link href="css/Layout.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="css/reg.css" rel="stylesheet" type="text/css" />
	
<script type="text/javascript" src="<c:url value='/js/ajaxutils.js'/>"></script>
<script type="text/javascript">
function change(){
	var imgEle=document.getElementById("imgs");
	imgEle.src="verifyCodeAction?a="+new Date().getTime();
}
window.onload=function login(){  //文档加载完毕后执行
	
	var userEle=document.getElementById("login_name");
	userEle.onblur=function(){
		var userEle=document.getElementById("login_name");
	 ajax(
			{
				method:"POST",
				params:"user_name="+userEle.value,
				url:"<c:url value='login_loginName'/>",
				type:"json",
				callback:function(data){
					document.getElementById("login_msgfont").innerHTML=data.msg;
				}
			}
		); 
	};
	
	var passwordEle=document.getElementById("login_password");
	passwordEle.onblur=function(){
		var passwordEle=document.getElementById("login_password");
		 ajax(
				{
					method:"POST",
					params:"text="+passwordEle.value,
					url:"<c:url value='login_isEmpty'/>",
					type:"json",
					callback:function(data){
						document.getElementById("login_msgfont").innerHTML=data.msg;
					}
				}
			); 
		};
		
	var verifyEle=document.getElementById("verify"); //登录模态框中输入验证码的框
	verifyEle.onblur=function(){
		var verifyEle=document.getElementById("verify");
		 ajax(
				{
					method:"POST",
					params:"verify="+verifyEle.value,
					url:"<c:url value='login_loginVerify'/>",
					type:"json",
					callback:function(data){
						document.getElementById("login_msgfont").innerHTML=data.msg;
					}
				}
			); 
		};
			
	var buttonEle=document.getElementById("login-button");   //登录按钮
	buttonEle.onclick=function(){
		var msgEle=document.getElementById("login_msgfont");
		var b="";
		if(msgEle.innerText==b){
			var nameEle=document.getElementById("login_name");
			var passwordEle=document.getElementById("login_password");
			 ajax(
					{
						method:"POST",
						params:"user_name="+nameEle.value+"&user_password="+passwordEle.value,
						url:"<c:url value='login_login'/>",
						type:"json",
						callback:function(data){
							var a="登录成功！";
							if(data.msg==a){
								document.getElementById("login-exit").click();  //登录成功，模拟点击关闭按钮，关闭模态框
							}else{
								document.getElementById("login_msgfont").innerHTML=data.msg;
							}
	
						}
					}
				); 
			}
		};			

	var userEle=document.getElementById("regist_name");
	userEle.onblur=function(){
		var userEle=document.getElementById("regist_name");
	 ajax(
			{
				method:"POST",
				params:"user_name="+userEle.value,
				url:"<c:url value='login_registName'/>",
				type:"json",
				callback:function(data){
					document.getElementById("regist_msgfont").innerHTML=data.msg;
				}
			}
		); 
	};
	
	var passwordEle=document.getElementById("regist_password");
	passwordEle.onblur=function(){
		var passwordEle=document.getElementById("regist_password");
	 ajax(
			{
				method:"POST",
				params:"password="+passwordEle.value,
				url:"<c:url value='login_RegistPassword'/>",
				type:"json",
				callback:function(data){
					document.getElementById("regist_msgfont").innerHTML=data.msg;
				}
			}
		); 
	};
	
	var repasswordEle=document.getElementById("regist_repassword");
	repasswordEle.onblur=function(){
		var repasswordEle=document.getElementById("regist_repassword");
		var passwordEle=document.getElementById("regist_password");
	 ajax(
			{
				method:"POST",
				params:"user_password="+repasswordEle.value+"&password="+passwordEle.value,
				url:"<c:url value='login_RegistrePassword'/>",
				type:"json",
				callback:function(data){
					document.getElementById("regist_msgfont").innerHTML=data.msg;
				}
			}
		); 
	};
	
	var phoneEle=document.getElementById("regist_phone");
	phoneEle.onblur=function(){
		var phoneEle=document.getElementById("regist_phone");
	 ajax(
			{
				method:"POST",
				params:"user_phone="+phoneEle.value,
				url:"<c:url value='login_registPhone'/>",
				type:"json",
				callback:function(data){
					document.getElementById("regist_msgfont").innerHTML=data.msg;
				}
			}
		); 
	};
	
	var registButtonEle=document.getElementById("regist-button");  //注册按钮
	registButtonEle.onclick=function(){
		var msgEle=document.getElementById("regist_msgfont");
		var b="";
		if(msgEle.innerText==b){
			var nameEle=document.getElementById("regist_name");
			var passwordEle=document.getElementById("regist_password");
			var repasswordEle=document.getElementById("regist_repassword");
			var sexEle=document.getElementById("regist_sex");
			var sex="";
			if(sexEle.checked==true){  //判断单选按钮
				sex=sexEle.value;
			}else{
				sex="女";
			}
			var phoneEle=document.getElementById("regist_phone");
			 ajax(
					{
						method:"POST",
						params:"user_name="+nameEle.value+"&password="
						+passwordEle.value+"&user_password="+repasswordEle.value+"&user_sex="+sex+"&user_phone="+phoneEle.value,
						url:"<c:url value='login_regist'/>",
						type:"json",
						callback:function(data){
							var a="注册成功！";
							if(data.msg==a){
								document.getElementById("regist-exit").click(); //注册成功，模拟点击关闭按钮，关闭模态框
								document.getElementById("loginLink").click();
							}else{
								document.getElementById("regist_msgfont").innerHTML=data.msg;
							}
	
						}
					}
				); 
			}
		};			
};
</script>
</head>
<body>
<!--顶部注册开始-->
	<div class="itop">   <!-- 最顶上的一个条 -->
		<div class="itop_body">   
			<div class="itop_left fl"><font color="#ffffff">网罗天下图书&nbsp;&nbsp;&nbsp; 传承中华文明</font></div>
			<div class="itop_right fl">

		<!-- 	
				<span class="red"></span>&nbsp;
				<span class="blue"><a href="#">[退出]</a></span>
			
				<span class="blue"><a href="login.jsp">[登录]</a></span>
			
				<span class="red"><a href="reg.jsp">[注册]</a></span>				
		 -->	
		 	 <font color="#ffffff">
		 	 	<span class="blue"><a id="loginLink" data-toggle="modal" data-target="#myModal"><font color="#ffffff">登录</font></a></span>&nbsp;&nbsp;<span>|</span>&nbsp;
		 	 	<span class="red"><a id="registLink" data-toggle="modal" data-target="#myModal1"><font color="#ffffff">注册</font></a></span>	&nbsp;&nbsp;<span>|</span>&nbsp;	
		 	 	<span class="fa fa-shopping-cart"></span>
				<span><a href="<c:url value='bar_cart'/>"><font color="#ffffff">购物车</font></a></span>&nbsp;&nbsp;<span>|</span>&nbsp;
				<span class="red"><a href="<c:url value='bar_order'/>"><font color="#ffffff">我的订单</font></a></span>&nbsp;&nbsp;<span>|</span>&nbsp;
		 	 	<span class="red"><a href="<c:url value='bar_person'/>"><font color="#ffffff">个人中心</font></a></span>&nbsp;&nbsp;<span>|</span>&nbsp;
		 	 	<span class="red"><a href="<c:url value='bar_exit'/>" ><font color="#ffffff">退出登录</font></a></span>
		 	 </font>
				<!-- <span class="red">5</span> 件  -->	
			</div>
		</div>
	</div>
	<div class="clearall"></div>
<!--顶部注册结束-->

<!-- 登录的模态框开始 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
		style="width:400px;height:auto;">
	<div class="modal-dialog" style="width:400px;">
		<div class="modal-content" style="width:400px;background:#f2f1ea;">
			<div class="modal-header">
				<button type="button" id="closemodal" class="close" data-dismiss="modal" aria-hidden="true" style="align:right;">
					&times;
				</button>
				<h3 class="modal-title" id="myModalLabel">
					登录
				</h3>
				<font id="login_msgfont" color="red" size="2"> </font><!-- 显示错误信息 -->
			</div>
			<div class="modal-header">
				<font size="4">用户名：</font><input type="text" name="userImpl.user_name" class="input_text" id="login_name" value=""/>
			</div>
			<div class="modal-header">
				<font size="4">密 &nbsp;&nbsp;&nbsp;码：</font><input type="password" name="userImpl.user_password" class="input_text" id="login_password" value=""/>
			</div>
			<div class="modal-header">
				<font size="4">验证码：</font><input type="text" name="verify" class="login-verify" id="verify" value=""/>
				<img id="imgs" src="verifyCodeAction"/>&nbsp;&nbsp;
				<a href="javascript:change()">换一张</a>
			</div>
			<div class="modal-footer">
				<!-- <button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button> -->
				<button type="button" id="login-button" class="btn btn-primary"
				style="background:#a40000;width:300px;height:35px;margin-right:30px;margin-bottom:5px;margin-top:5px;">
					登录
				</button>
				<button type="button" id="login-exit" class="btn btn-default" data-dismiss="modal"
				style="width:300px;height:35px;margin-right:30px;margin-bottom:5px;margin-top:5px;">
				关闭
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<!-- 登录的模态框结束 -->

<!-- 注册的模态框开始 -->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
		style="width:400px;height:auto;">
	<div class="modal-dialog" style="width:400px;">
		<div class="modal-content" style="width:400px;background:#f2f1ea;">
			<div class="modal-header">
				<button type="button" id="closemodal" class="close" data-dismiss="modal" aria-hidden="true" style="align:right;">
					&times;
				</button>
				<h3 class="modal-title" id="myModalLabel">
					注册
				</h3>
				<font id="regist_msgfont" color="red" size="2"> </font><!-- 显示错误信息 -->
			</div>
			<div class="modal-header">
				<font size="4">用户名：&nbsp;&nbsp;</font><input type="text" name="user_name" class="input_text" id="regist_name" value=""/>
			</div>
			<div class="modal-header">
				<font size="4">密 &nbsp;&nbsp;&nbsp;码：&nbsp;&nbsp;</font><input type="password" name="user_password" class="input_text" id="regist_password" value=""/>
			</div>
			<div class="modal-header">
				<font size="4">确认密码：</font><input type="password" name="user_repassword" class="input_text" id="regist_repassword" value=""/>
			</div>
			<div class="modal-header">
				<font size="4">性&nbsp;&nbsp; &nbsp;别：&nbsp;&nbsp;</font><input type="radio" name="user_sex" id="regist_sex" value="男" checked="checked"><font size="4">男</font>
				&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="user_sex" value="女"><font size="4">女</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div class="modal-header">
				<font size="4">电话号码：</font><input type="text" name="user_phone" class="input_text" id="regist_phone" value=""/>
			</div>
			<div class="modal-footer">
				<!-- <button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button> -->
				<button type="button" id="regist-button" class="btn btn-primary"
				style="background:#a40000;width:300px;height:35px;margin-right:30px;margin-bottom:5px;margin-top:5px;">
					注册
				</button>
				<button type="button" id="regist-exit" class="btn btn-default" data-dismiss="modal"
				style="width:300px;height:35px;margin-right:30px;margin-bottom:5px;margin-top:5px;">
					关闭
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<!-- 注册的模态框结束 -->

<!--头部搜索开始-->
	<div class="header">   <!-- 标志和搜索的那个条 -->
		<div class="logo fl"><img src="images/logo.jpg"/></div>
		<div class="search fl">
			<div class="search_from">
			<form action="<c:url value='bar_searchGoods'/>" method="post">
				<input type="hidden" name="pc" value="1"/>
				<div><input name="url" type="text" class="s_input fl"/></div>
				<font size="4" color="#fdfdfa"><input type="submit" value="搜 索" class="s_botton fl"/></font>
			</form>
			</div>
		</div>
	</div>
<!--头部搜索结束-->
<!--菜单开始-->
	<div class="menu">   <!-- 菜单那一栏 -->
		<div class="menu_center fl">
			<div class="dh_topd"><A href="index.jsp" class="shouye">首页</A></div>
			<!-- <div class="dh_topd"><A href="" class="connectwe">联系我们</A></div> -->
		</div>
	</div>
<!--菜单结束-->
</body>
</html>