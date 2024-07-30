<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>密码修改</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
    <script type="text/javascript" src="<%=path %>/commutil.js"></script>
    <script type="text/javascript">
    	function subVai()
    	{
			var varOldPass = document.formAdd.oldPass.value;
			var varNewPass = document.formAdd.newPass.value;
			var varNewPass1 = document.formAdd.newPass1.value;
			
			if(varOldPass.Trim()=="")
			{
				alert("原始密码不能为空!");
				return false;
			}
			
			if(varNewPass.Trim()=="")
			{
				alert("新密码不能为空!");
				return false;
			}
			
			if(varNewPass1.Trim()=="")
			{
				alert("确认密码不能为空!");
				return false;
			}
			
			if(varNewPass.Trim() != varNewPass1.Trim())
			{
				alert("两次输入的密码不一致!");
				return false;
			}
			
			return true;
    	}
    </script>
  </head>
  
  <body>
	<form action="<%=path %>/login?type=changePass" name="formAdd" method="post">
		     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
				<tr bgcolor="#EEF4EA">
			        <td colspan="3" background="<%=path %>/img/wbg.gif" class='title'><span>密码修改</span></td>
			    </tr>
				<tr align='center' bgcolor="#FFFFFF" height="22">
				    <td width="25%" bgcolor="#FFFFFF" align="right">
				         原始密码：
				    </td>
				    <td width="75%" bgcolor="#FFFFFF" align="left">
				        <input type="password" name="oldPass" size="20"/>
				    </td>
				</tr>
				<tr align='center' bgcolor="#FFFFFF" height="22">
				    <td width="25%" bgcolor="#FFFFFF" align="right">
				        新密码：
				    </td>
				    <td width="75%" bgcolor="#FFFFFF" align="left">
				        <input type="password" name="newPass" size="20"/>
				    </td>
				</tr>
				<tr align='center' bgcolor="#FFFFFF" height="22">
				    <td width="25%" bgcolor="#FFFFFF" align="right">
				         新密码确认：
				    </td>
				    <td width="75%" bgcolor="#FFFFFF" align="left">
				        <input type="password" name="newPass1" size="20"/>
				    </td>
				</tr>
				<tr align='center' bgcolor="#FFFFFF" height="22">
				    <td width="25%" bgcolor="#FFFFFF" align="right">
				        &nbsp;
				    </td>
				    <td width="75%" bgcolor="#FFFFFF" align="left">
				       <input type="submit" value="提交" onclick="return subVai();"/> 
				       <input type="reset" value="返回" onclick="javascript:history.back()"/>&nbsp;
				    </td>
				</tr>
			 </table>
	</form>
  </body>
</html>
