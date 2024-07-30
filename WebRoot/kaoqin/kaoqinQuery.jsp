<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		<script type="text/javascript" src="<%=path %>/datepicker/WdatePicker.js"></script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
<form action="<%=path %>/kaoqin?type=kaoqinQuery" name="formAdd" method="post">	
	考勤日期:<input type="text" name="kqrq" size="20" value="${kqrq}"
			onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true,readOnly:true})"/>
	学生姓名:<input type="text" name="xm" size="20" value="${xm}"/>
	<input type="submit" value="查询"/>
</form>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="3" background="<%=path %>/img/tbg.gif">&nbsp;考勤情况统计&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="15%">考勤日期</td>
					<td width="15%">学生姓名</td>
					<td width="*">考勤情况</td>
		        </tr>	
				<c:forEach items="${requestScope.kqqkList}" var="kqqk">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${kqqk.kqrq}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${kqqk.xsxm}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${kqqk.lxms}
					</td>
				</tr>
				</c:forEach>
			</table>	    		
	</body>
</html>
