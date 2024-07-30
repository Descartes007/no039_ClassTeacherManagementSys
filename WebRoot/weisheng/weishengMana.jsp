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
           function weishengDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/weisheng?type=weishengDel&id="+id;
               }
           }
           
           function weishengAdd()
           {
                 var url="<%=path %>/weisheng/weishengAdd.jsp";
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="4" background="<%=path %>/img/tbg.gif">&nbsp;宿舍卫生管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="15%">宿舍号</td>
					<td width="15%">检查日期</td>
					<td width="15%">分数</td>
					<td width="*">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.weishengList}" var="weisheng">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${weisheng.sushe}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${weisheng.riqi}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${weisheng.fenshu}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<form action="<%=path %>/weisheng/weishengEdit.jsp" method="post">
						        <input type="hidden" name="id" value="${weisheng.id}"/>
						        <input type="hidden" name="sushe" value="${weisheng.sushe}"/>
						        <input type="hidden" name="riqi" value="${weisheng.riqi}"/>
						        <input type="hidden" name="fenshu" value="${weisheng.fenshu}"/>
						        <input type="hidden" name="shuoming" value="${weisheng.shuoming}"/>
						    <input type="submit" value="编辑"/>
						    <input type="button" onclick="weishengDel(${weisheng.id})" value="删除"/>
						</form>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="weishengAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
