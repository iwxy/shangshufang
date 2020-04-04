<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<form method="post" action="">
	            <!--收货人姓名-->
	            <div class="recipients">
	                <span class="red">*</span><span class="kuan">收货人：</span><input type="text" name="receiverName" value="${address.receiverName}" autofocus id="receiverName"/>
	            </div>
	            <!--收货人所在城市等信息-->
	            <div data-toggle="distpicker" class="address_content">
					 <span class="red">*</span><span class="kuan">省&nbsp;&nbsp;份：</span><select class="ad_select" data-province="---- 选择省 ----"  id="receiverState" name="receiverProvince"></select>
					  城市：<select class="ad_select" data-city="---- 选择市 ----" value="${address.receiverCity}" id="receiverCity" name="receiverCity"></select>
					  区/县：<select class="ad_select" data-district="---- 选择区 ----" value="${address.receiverCounty}" id="receiverDistrict" name="receiverCounty"></select>
				</div> 
	            
	            <!--收货人详细地址-->
	            <div class="address_particular">
	                <span class="red">*</span><span class="kuan">详细地址：</span><textarea   name="receiverAddress" id="receiverAddress" cols="60" rows="3" placeholder="建议您如实填写详细收货地址">${address.receiverAddress }</textarea>
	            </div>
	            <!--收货人地址-->
	            <div class="address_tel">
	                <span class="red">*</span><span class="kuan">手机号码：</span><input type="tel" value="${address.receiverMobile}" id="receiverMobile" name="receiverMobile"/>固定电话：<input type="text" name="receiverPhone" id="receiverPhone"/>
	            </div>
	            <!--邮政编码-->
	            <div class="address_postcode">
	                <span class="red">&nbsp;</span class="kuan"><span>邮政编码：</span>&nbsp;<input type="text" value="${address.receiverZip}" id="receiverZip" name="receiverZip"/>
	            </div>
	            <!--地址名称-->
	            <div class="address_name">
	                <span class="red">&nbsp;</span class="kuan"><span>地址名称：</span>&nbsp;<input type="text" value="${address.addressName}" id="addressName" name="addressName"/>如：<span class="sp">家</span><span class="sp">公司</span><span class="sp">宿舍</span>
	            </div>
	            <!--保存收货人信息-->
	            <div class="save_recipient">
	                保存收货人信息
	            </div>
	
    		</form>
            <!--已有地址栏-->
            <div class="address_information_manage">
                <div class="aim_title">
                    <span class="dzmc dzmc_title">地址名称</span><span class="dzxm dzxm_title">姓名</span><span class="dzxq dzxq_title">地址详情</span><span class="lxdh lxdh_title">联系电话</span><span class="operation operation_title">操作</span>
                </div>
                <!--<c:forEach items="${addressList }" var="addressList"> -->
                <div class="aim_content_two ">               
                    <span class="dzmc dzmc_active"><c:out value="${addressList.addressName}"/>南昌</span>
                    <span class="dzxm dzxm_normal"><c:out value="${addressList.receiverName}"/>王欣妍</span>
                    <span class="dzxq dzxq_normal"><c:out value="${addressList.receiverAddress}"/>宜春</span>
                    <span class="lxdh lxdh_normal"><c:out value="${addressList.receiverMobile}"/>12345678901</span>
                    <span class="operation operation_normal">
                    	<span class="aco_change" onclick="changeReceiver(${addressList.addressId})">修改</span>|<span class="aco_delete" onclick="deleteRecipient(${addressList.addressId})">删除</span>
                    </span>
                    <!--<c:if test="${addressList.receiverStatus eq '0'}">
                    <span class="swmr swmr_normal" onclick="changeStatus(${addressList.receiverStatus},${addressList.addressId})">设为默认</span>
                    </c:if>
                    <c:if test="${addressList.receiverStatus eq '1'}">-->
                    <span class="swmr swmr_normal" onclick="changeStatus(${addressList.receiverStatus},${addressList.addressId})"></span>
                    <!--</c:if>-->
                </div>
               
               <!-- </c:forEach>-->
            </div>
</body>
</html>