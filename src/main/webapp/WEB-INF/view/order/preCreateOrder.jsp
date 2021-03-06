<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单申请</title>
</head>

<body>
<!--header start-->
<jsp:include page="../header/headerIndex.jsp"></jsp:include>
<!--header end-->

<!--主题内容 start-->
<div class="w1200">
<jsp:include page="../header/header.jsp"></jsp:include>
<script type="text/javascript" src="resource/js/jquery.validate.js"></script>
  <!--右侧模块 start-->
  <div class="part-right">
     <div class="r-tit">
         <h2 class="icon-ddsq">新增申请</h2>
     </div>
     <div class="content">
       <ul class="s-form">
       		<form action="order/createOrder" id="orderForm" method="post">
			     <input type="hidden" name="rate" id="rate" value="${rate.rateHigh}" />
	    
                 <li><label>申请金额：</label><input type="text" class="input-txt" id="applyAmount" name="applyAmount" value="" ><span class="left hbf">美元</span>
                 </li>
                 <li><label>应付金额：</label><input type="text" class="input-txt" id="payAmount" name="payAmount" value="" readonly="readonly"> <span class="left hbf">元</span>
                 </li>
                 <!--  
                 <li><label>应付手续费：</label><input type="text" class="input-txt" id="poundageAmount" name="poundageAmount" value="" readonly="readonly"><span class="left hbf">元</span>
                 </li>
                 -->
                 <li><label>收款人姓名：</label><input type="text" class="input-txt" id="accountName" name="accountName" value="">
                 </li>
                 <li><label>收款人账号：</label><input type="text" class="input-txt" id="accountCode" name="accountCode" value="">
                 </li>
                 <li><label>开户行：</label><input type="text" class="input-txt" id="accountBank" name="accountBank" value="">
                 </li>
            </form>
       </ul>
       <div class="btnsubmint"><a href="javascript:void(0)" id="insertBtn" class="btnOrage">提  交</a></div>
     </div>
  </div>
  <!--右侧模块 end-->
</div>
<!--主题内容 end-->
</body>
<script type="text/javascript">
$(document).ready(function() {
	$("#orderForm").validate({
		success:function(label){
			label.remove();
		},
		rules:{
			"applyAmount":{
				required:true
			},
			"accountName":{
				required:true
			},
			"accountCode":{
				required:true
			},
			"accountBank":{
				required:true
			}	
		},
		messages:{
			"applyAmount":{
				required:"申请金额不能为空"
			},
			"accountName":{
				required:"收款人不能为空"
			},
			"accountCode":{
				required:"收款账号不能为空"
			},
			"accountBank":{
				required:"开会行不能为空"
			}
		},
		errorPlacement: function(error, element) {
			var span = $("<span class='errorInfo'></span>").append(error);
			span.appendTo(element.parent());
		}
	});
	
	$("#insertBtn").click(function(e){
		$("#insertBtn")
		if($('#orderForm').valid()){
			$.post(
					"order/createOrder",
					$("#orderForm").serialize(),
					function(data){
						if(data.msg == "1"){
							alert("提交成功");
							window.location.href="${pageContext.request.contextPath}/order/toPageOrders";
						}else{
							alert(data.msg);
						}
					},
					"json"
				)
		}
	});
	
	$("#applyAmount").blur( function () {
		var applyAmount = $("#applyAmount").val();
		var rate = $("#rate").val();
		var payAmount = applyAmount * rate/100;
		$("#payAmount").val(payAmount); 
	});
})
</script>
</html>
