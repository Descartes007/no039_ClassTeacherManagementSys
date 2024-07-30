<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>欢迎使用</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<script type="text/javascript" src="<%=path %>/commutil.js"></script>    
<STYLE type=text/css>
BODY {
	FONT-SIZE: 12px; COLOR: #ffffff; FONT-FAMILY: 宋体
}
TD {
	FONT-SIZE: 12px; COLOR: #ffffff; FONT-FAMILY: 宋体
}
</STYLE>
<script type="text/javascript">
	function subVai()
	{
		var varName = document.formLog.name.value;
		var varPass = document.formLog.pass.value;
		
		if(varName.Trim()=="")
		{
			alert("登录名不能为空!");
			return false;
		}
		
		if(varPass.Trim()=="")
		{
			alert("密码不能为空!");
			return false;
		}
		
		return true;
	}
</script>	
  </head>
  <body>
  <form action="<%=path %>/login?type=login" name="formLog" method="post">
<DIV>&nbsp;&nbsp; </DIV>
<DIV>
<TABLE cellSpacing=0 cellPadding=0 width=900 align=center border=0>
  <TBODY>
  <TR>
    <TD style="HEIGHT: 105px"><IMG src="images/login_1.gif" 
  border=0></TD></TR>
  <TR>
    <TD background="images/login_2.jpg" height=300>
      <TABLE height=300 cellPadding=0 width=900 border=0>
        <TBODY>
        <TR>
          <TD colSpan=2 height=35></TD></TR>
        <TR>
          <TD width=360></TD>
          <TD>
            <TABLE cellSpacing=0 cellPadding=2 border=0>
              <TBODY>
              <TR>
                <TD style="HEIGHT: 28px" width=80>登 录 名：</TD>
                <TD style="HEIGHT: 28px" width=150><INPUT id=name 
                  style="WIDTH: 130px" name=name></TD>
                <TD style="HEIGHT: 28px" width=370></TD></TR>
              <TR>
                <TD style="HEIGHT: 28px">登录密码：</TD>
                <TD style="HEIGHT: 28px"><INPUT id=pass style="WIDTH: 130px" 
                  type=password name=pass></TD>
                <TD style="HEIGHT: 28px"></TD></TR>
              <TR style="display: none;">
                <TD style="HEIGHT: 28px">登录身份：</TD>
                <TD style="HEIGHT: 28px">
                	<select name="dlsf">
                		<option value="1">教职工</option>
                		<option value="2" selected="selected">管理员</option>
                	</select>
                </TD>
                <TD style="HEIGHT: 28px">&nbsp;</TD></TR>
              <TR>
                <TD style="HEIGHT: 18px"></TD>
                <TD style="HEIGHT: 18px"></TD>
                <TD style="HEIGHT: 18px"></TD></TR>
              <TR>
                <TD></TD>
                <TD><INPUT id=btn 
                  style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px" 
                  onclick='return subVai()' onfocus="this.blur();"
                  type=image src="images/login_button.gif" name=btn> 
              </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD><IMG src="images/login_3.jpg" 
border=0></TD></TR></TBODY></TABLE></DIV>
</form>
  </body>
</html>
