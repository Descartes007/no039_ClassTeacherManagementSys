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
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
        <script language="javascript">
           function xueshengEdit(id)
           {
				window.location.href="<%=path %>/xuesheng?type=xueshengToUpd&id="+id;
           }
           
           function xueshengDele(id)
           {
               if(confirm('您确定删除吗?'))
               {
					window.location.href="<%=path %>/xuesheng?type=xueshengDele&id="+id;
			   }
           }
           
           function xueshengAdd()
           {
                 var url="<%=path %>/xuesheng/xueshengAdd.jsp";
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="10" background="<%=path %>/img/tbg.gif">&nbsp;学生信息管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="10%">学号</td>
					<td width="10%">姓名</td>
					<td width="10%">性别</td>
					<td width="12%">入学日期</td>
					<td width="12%">专业</td>
					<td width="12%">电话</td>
					<td width="12%">籍贯</td>
					<td width="*">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.xueshengList}" var="xuesheng">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${xuesheng.xuehao}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${xuesheng.xingming}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${xuesheng.xingbie}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${xuesheng.ruxueriqi}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${xuesheng.zhuanye}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${xuesheng.dianhua}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${xuesheng.jiguan}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						    <input type="button" onclick="xueshengEdit(${xuesheng.id})" value="编辑"/>
						    <input type="button" onclick="xueshengDele(${xuesheng.id})" value="删除"/>
					</td>
				</tr>
				</c:forEach>
			</table>
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="xueshengAdd()" />
			    </td>
			  </tr>
		    </table>			
	</body>
</html>
