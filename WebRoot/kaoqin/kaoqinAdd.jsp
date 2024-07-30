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
		
        <script language="javascript">
           function kqlxDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/kqlx?type=kqlxDel&id="+id;
               }
           }
           
           function kqlxAdd()
           {
                 var url="<%=path %>/kqlx/kqlxAdd.jsp";
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
<form action="<%=path %>/kaoqin?type=kaoqinAdd" name="formAdd" method="post">	
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="2" background="<%=path %>/img/tbg.gif">&nbsp;当日考勤登记&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="15%">学生姓名</td>
					<td width="*">考勤情况</td>
		        </tr>	
				<c:forEach items="${requestScope.xsxxList}" var="xsxx">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${xsxx.xingming}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<select name="kqqk">
							<c:forEach items="${requestScope.kqlxList}" var="kqlx">
				        		<c:if test="${xsxx.kqlx==kqlx.id }">
									<option value="${xsxx.id}_${kqlx.id}" selected="selected">${kqlx.ms}</option>
								</c:if>
				        		<c:if test="${xsxx.kqlx!=kqlx.id }">
									<option value="${xsxx.id}_${kqlx.id}">${kqlx.ms}</option>
								</c:if>							
								
							</c:forEach>
						</select>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="submit" value="保存" style="width: 80px;" />
			    </td>
			  </tr>
		    </table>	
</form>		    		
	</body>
</html>
