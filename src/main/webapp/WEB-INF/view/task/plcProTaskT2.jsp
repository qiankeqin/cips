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
<title>代办事项</title>
</head>

<body>
<!--header start-->
<div class="header">
  <div class="w1200">
    <span class="layout">
       <a href="" class="btnLayout">退出</a>
    </span>
     <span class="logo"></span>
     <div class="welcomeWord">
        <span class="avatar">
          <span class="avatar-shade"></span>
          <span class="avatar-img"><img src="resource/images/head.gif" width="43" height="43" /></span>
        </span>
        <span class="word">豆沙包欢迎您！</span>
     </div>
  </div>
</div>
<!--header end-->

<!--主题内容 start-->
<div class="w1200">
<jsp:include page="../header/header.jsp"></jsp:include>
  <!--右侧模块 start-->
  <div class="part-right">
     <div class="r-tit">
         <h2 class="icon-db">待办事项</h2>
     </div>
     <div class="content">
       <div class="wtcon">
               <h2>订单信息</h2>
               <div class="wtbox">
                 <div class="clearFix">
                     <div class="w470"><label>订  单  号：</label> <span>${order.orderNo}</span> </div>
                     <div class="w235"><label></label> <span></span> </div>
                     <div class="w235"><label>提  交  人：</label> <span>${user.userName}</span> </div>
                     <div class="w235"><label>提交时间：</label> <span><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.applyDate}" type="both"/></span> </div>
                     <div class="w235"><label>订单状态：</label> <span>${order.statusDesc}</span> </div>
					 <div class="w235"><label>申请金额：</label> <span class="color_orange font18">${order.applyAmount}$</span> </div>
                     <div class="w470"><label>应付金额：</label> <span class="color_orange font18">${order.payAmount}￥</span> </div>
                 </div>
                 <div class="clearFix">
                 <div class="wt-t">海外账户信息</div>
                 <div class="clearFix">
                     <div class="w235"><label>收款人姓名： </label> <span>${hwAcc.accountName}</span> </div>
                     <div class="w235"><label>收款人账号：</label> <span>${hwAcc.accountCode}</span> </div>
                     <div class="w235"><label>开户行：</label> <span>${hwAcc.accountBank}</span> </div>
                 </div>
                 </div>
               </div>
               
               <div class="wtbox mt10">
 			   <div class="wt_skzh clearFix">
 					 <div class="wt-t">海外用户账户信息</div>
	                 <div class="clearFix">
	                     <div class="w235"><label>收款人姓名： </label> <span>doushabao</span> </div>
	                     <div class="w235"><label>收款人账号：</label> <span>doushabao</span> </div>
	                     <div class="w235"><label>开户行：</label> <span>doushabao</span> </div>
	                 </div>
               </div>
               </div>
               <div class="btnDiv tac"><a href="" class="btnGrey">返回</a><a href="" class="btnOrage">确认</a> <a href="" class="btnOrage">驳回</a></div>
           </div>
     </div>
  </div>
  <!--右侧模块 end-->
</div>
<!--主题内容 end-->

<div class="bg"></div>

</body>
</html>
