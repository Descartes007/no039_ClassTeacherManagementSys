<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.bzrglxt.vo.User" %>
<%
String path = request.getContextPath();
User user = (User)request.getSession().getAttribute("user");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>欢迎页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />

  </head>
  
  <body>
    你好<font color="red">[<%=user.getName() %>]</font>,欢迎使用班主任管理系统!
  </body>
</html>
