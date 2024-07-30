<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.bzrglxt.vo.User"%>
<%
	String path = request.getContextPath();
	User user = (User) request.getSession().getAttribute("user");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>欢迎使用班主任管理系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<STYLE type=text/css>
BODY {
	PADDING-RIGHT: 0px;
	PADDING-LEFT: 0px;
	PADDING-BOTTOM: 0px;
	MARGIN: 0px;
	PADDING-TOP: 0px;
	BACKGROUND-COLOR: #2a8dc8
}

BODY {
	FONT-SIZE: 11px;
	COLOR: #003366;
	FONT-FAMILY: Verdana
}

TD {
	FONT-SIZE: 11px;
	COLOR: #003366;
	FONT-FAMILY: Verdana
}

DIV {
	FONT-SIZE: 11px;
	COLOR: #003366;
	FONT-FAMILY: Verdana
}

P {
	FONT-SIZE: 11px;
	COLOR: #003366;
	FONT-FAMILY: Verdana
}

.mainMenu {
	FONT-WEIGHT: bold;
	FONT-SIZE: 14px;
	CURSOR: hand;
	COLOR: #000000
}

A.style2:link {
	PADDING-LEFT: 4px;
	COLOR: #0055bb;
	TEXT-DECORATION: none
}

A.style2:visited {
	PADDING-LEFT: 4px;
	COLOR: #0055bb;
	TEXT-DECORATION: none
}

A.style2:hover {
	PADDING-LEFT: 4px;
	COLOR: #ff0000;
	TEXT-DECORATION: none
}

A.active {
	PADDING-LEFT: 4px;
	COLOR: #ff0000;
	TEXT-DECORATION: none
}

.span {
	COLOR: #ff0000
}
</STYLE>

<SCRIPT language=javascript>
	function openAll() {
		for (var i = 1; i <= 5; i++) {
			document.getElementById('table_' + i).style.display = 'block';
			document.getElementById('table_' + i + 'Span').innerText = '-';
		}
	}

	function MenuDisplay(obj) {
		if (document.getElementById(obj).style.display == 'none') {
			document.getElementById(obj).style.display = 'block';
			document.getElementById(obj + 'Span').innerText = '－';
		} else {
			document.getElementById(obj).style.display = 'none';
			document.getElementById(obj + 'Span').innerText = '＋';
		}
	}

	function MenuDisplay2(obj) {
		for (var i = 1; i <= 3; i++) {
			document.getElementById('table_' + i).style.display = 'none';
			document.getElementById('table_' + i + 'Span').innerText = '＋';
		}
		if (document.getElementById(obj).style.display == 'none') {
			document.getElementById(obj).style.display = 'block';
			document.getElementById(obj + 'Span').innerText = '－';
		} else {
			document.getElementById(obj).style.display = 'none';
			document.getElementById(obj + 'Span').innerText = '＋';
		}
	}
	
	function logout(){
		window.top.location.href="<%=path%>/login.jsp"
	}
</SCRIPT>
</head>
<body onload="openAll()">
	<%
		if (user.getType() == 0) {
	%>
	<TABLE cellSpacing=0 cellPadding=0 width=210 align=center border=0>
		<TBODY>
			<TR>
				<TD width=15><IMG src="images/new_005.jpg" border=0></TD>
				<TD align=middle width=180 background=images/new_006.jpg height=35><B>管理员
						－功能菜单</B></TD>
				<TD width=15><IMG src="images/new_007.jpg" border=0></TD>
			</TR>
		</TBODY>
	</TABLE>
	<TABLE cellSpacing=0 cellPadding=0 width=210 align=center border=0>
		<TBODY>
			<TR>
				<TD width=15 background=images/new_008.jpg></TD>
				<TD vAlign=top width=180 bgColor=#ffffff>
					<TABLE cellSpacing=0 cellPadding=3 width=165 align=center border=0>
						<TBODY>
							<TR>
								<TD class=mainMenu onClick="MenuDisplay('table_4');"><SPAN
									class=span id=table_4Span>＋</SPAN>考勤类型</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=table_4 style="DISPLAY: none" cellSpacing=0
										cellPadding=2 width=155 align=center border=0>
										<TBODY>
											<TR>
												<TD class=menuSmall><A class=style2
													href="<%=path%>/leixing/leixingAdd.jsp" target=dmMain>－
														考勤类型添加</A></TD>
											</TR>
											<TR>
												<TD class=menuSmall><A class=style2
													href="<%=path%>/leixing?type=leixingMana" target=dmMain>－
														考勤类型管理</A></TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD background=images/new_027.jpg height=1></TD>
							</TR>
							<TR>
							<TR>
								<TD class=mainMenu onClick="MenuDisplay('table_1');"><SPAN
									class=span id=table_1Span>＋</SPAN>学生信息</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=table_1 style="DISPLAY: none" cellSpacing=0
										cellPadding=2 width=155 align=center border=0>
										<TBODY>
											<TR>
												<TD class=menuSmall><A class=style2
													href="<%=path%>/xuesheng/xueshengAdd.jsp" target=dmMain>－
														添加学生信息</A></TD>
											</TR>
											<TR>
												<TD class=menuSmall><A class=style2
													href="<%=path%>/xuesheng?type=xueshengMana" target=dmMain>－
														学生信息查看</A></TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD background=images/new_027.jpg height=1></TD>
							</TR>
							<TR>
								<TD class=mainMenu onClick="MenuDisplay('table_2');"><SPAN
									class=span id=table_2Span>＋</SPAN>考勤信息</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=table_2 style="DISPLAY: none" cellSpacing=0
										cellPadding=2 width=155 align=center border=0>
										<TBODY>
											<TR>
												<TD class=menuSmall><A class=style2
													href="<%=path%>/kaoqin?type=kaoqinToAdd" target=dmMain>－
														当日考勤登记</A></TD>
											</TR>
											<TR>
												<TD class=menuSmall><A class=style2
													href="<%=path%>/kaoqin?type=kaoqinQuery" target=dmMain>－
														考勤信息统计</A></TD>
											</TR>
											<!--                   <TR> -->
											<!--                 <TD class=menuSmall><A class=style2  -->
											<!--                   href="<%=path%>/kaoqin/daochuExc.jsp"  -->
											<!--                   target=dmMain>－ 考勤信息导出</A></TD></TR></TBODY></TABLE></TD></TR> -->
											<TR>
												<TD background=images/new_027.jpg height=1></TD>
											</TR>
											<TR>
												<TD class=mainMenu onClick="MenuDisplay('table_3');"><SPAN
													class=span id=table_3Span>＋</SPAN>宿舍卫生</TD>
											</TR>
											<TR>
												<TD>
													<TABLE id=table_3 style="DISPLAY: none" cellSpacing=0
														cellPadding=2 width=155 align=center border=0>
														<TBODY>
															<TR>
																<TD class=menuSmall><A class=style2
																	href="<%=path%>/weisheng/weishengAdd.jsp"
																	target=dmMain>－ 宿舍卫生检查</A></TD>
															</TR>
															<TR>
																<TD class=menuSmall><A class=style2
																	href="<%=path%>/weisheng?type=weishengMana"
																	target=dmMain>－ 宿舍卫生查询</A></TD>
															</TR>
														</TBODY>
													</TABLE>
												</TD>
											</TR>
											<TR>
												<TD background=images/new_027.jpg height=1></TD>
											</TR>
											<TR>
												<TD class=mainMenu onClick="MenuDisplay('table_5');"><SPAN
													class=span id=table_5Span>＋</SPAN>系统设置</TD>
											</TR>
											<TR>
												<TD>
													<TABLE id=table_5 style="DISPLAY: none" cellSpacing=0
														cellPadding=2 width=155 align=center border=0>
														<TBODY>
															<TR>
																<TD class=menuSmall><A class=style2
																	href="<%=path%>/changePw.jsp" target=dmMain>－ 修改密码</A></TD>
															</TR>
															<TR>
																<TD class=menuSmall><A class=style2
																	href="javascript:void()" onclick="logout()">－ 退出</A></TD>
															</TR>
														</TBODY>
													</TABLE>
												</TD>
											</TR>

										</TBODY>
									</TABLE>
								</TD>
								<TD width=15 background=images/new_009.jpg></TD>
							</TR>
						</TBODY>
					</TABLE>
					<TABLE cellSpacing=0 cellPadding=0 width=210 align=center border=0>
						<TBODY>
							<TR>
								<TD width=15><IMG src="images/new_010.jpg" border=0></TD>
								<TD align=middle width=180 background=images/new_011.jpg
									height=15></TD>
								<TD width=15><IMG src="images/new_012.jpg" border=0></TD>
							</TR>
						</TBODY>
					</TABLE> <%
 	} else {
 %>
					<TABLE cellSpacing=0 cellPadding=0 width=210 align=center border=0>
						<TBODY>
							<TR>
								<TD width=15><IMG src="images/new_005.jpg" border=0></TD>
								<TD align=middle width=180 background=images/new_006.jpg
									height=35><B>教职工 －功能菜单</B></TD>
								<TD width=15><IMG src="images/new_007.jpg" border=0></TD>
							</TR>
						</TBODY>
					</TABLE>
					<TABLE cellSpacing=0 cellPadding=0 width=210 align=center border=0>
						<TBODY>
							<TR>
								<TD width=15 background=images/new_008.jpg></TD>
								<TD vAlign=top width=180 bgColor=#ffffff>
									<TABLE cellSpacing=0 cellPadding=3 width=165 align=center
										border=0>
										<TBODY>
											<TR>
												<TD class=mainMenu onClick="MenuDisplay2('table_1');"><SPAN
													class=span id=table_1Span>＋</SPAN>考勤查询</TD>
											</TR>
											<TR>
												<TD>
													<TABLE id=table_1 style="DISPLAY: none" cellSpacing=0
														cellPadding=2 width=155 align=center border=0>
														<TBODY>
															<TR>
																<TD class=menuSmall><A class=style2
																	href="<%=path%>/kqxx?type=kqxxNowDate" target=dmMain>－
																		当天考勤查询</A></TD>
															</TR>
															<TR>
																<TD class=menuSmall><A class=style2
																	href="<%=path%>/kqxx?type=kqxxQueryByJs" target=dmMain>－
																		历史考勤查询</A></TD>
															</TR>
														</TBODY>
													</TABLE>
												</TD>
											</TR>
											<TR>
												<TD background=images/new_027.jpg height=1></TD>
											</TR>
											<TR>
												<TD class=mainMenu onClick="MenuDisplay2('table_2');"><SPAN
													class=span id=table_2Span>＋</SPAN>考勤统计</TD>
											</TR>
											<TR>
												<TD>
													<TABLE id=table_2 style="DISPLAY: none" cellSpacing=0
														cellPadding=2 width=155 align=center border=0>
														<TBODY>
															<TR>
																<TD class=menuSmall><A class=style2
																	href="<%=path%>/kqtj?type=kqtjDetailByNew"
																	target=dmMain>－ 最新统计查看</A></TD>
															</TR>
															<TR>
																<TD class=menuSmall><A class=style2
																	href="<%=path%>/kqtj?type=kqtjQueryByJs" target=dmMain>－
																		考勤统计查询</A></TD>
															</TR>
														</TBODY>
													</TABLE>
												</TD>
											</TR>

											<TR>
												<TD background=images/new_027.jpg height=1></TD>
											</TR>
											<TR>
												<TD class=mainMenu onClick="MenuDisplay2('table_3');"><SPAN
													class=span id=table_3Span>＋</SPAN>系统管理</TD>
											</TR>
											<TR>
												<TD>
													<TABLE id=table_3 style="DISPLAY: none" cellSpacing=0
														cellPadding=2 width=155 align=center border=0>
														<TBODY>
															<TR>
																<TD class=menuSmall><A class=style2
																	href="<%=path%>/changePw.jsp" target=dmMain>－ 修改密码</A></TD>
															</TR>
														</TBODY>
													</TABLE>
												</TD>
											</TR>

										</TBODY>
									</TABLE>
								</TD>
								<TD width=15 background=images/new_009.jpg></TD>
							</TR>
						</TBODY>
					</TABLE>
					<TABLE cellSpacing=0 cellPadding=0 width=210 align=center border=0>
						<TBODY>
							<TR>
								<TD width=15><IMG src="images/new_010.jpg" border=0></TD>
								<TD align=middle width=180 background=images/new_011.jpg
									height=15></TD>
								<TD width=15><IMG src="images/new_012.jpg" border=0></TD>
							</TR>
						</TBODY>
					</TABLE> <%
 	}
 %>
				
</body>
</html>
