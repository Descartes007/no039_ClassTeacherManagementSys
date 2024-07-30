<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.jspsmart.upload.*" %>
<%@ page import="org.apache.poi.hssf.usermodel.*" %>
<%@ page import="java.io.*" %>
<jsp:directive.page import="com.bzrglxt.utils.DbUtil"/>
<jsp:directive.page import="java.sql.ResultSet"/>
<jsp:directive.page import="com.bzrglxt.vo.TKaoqin"/>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body> 
      <% 
      
            List kaoqinList=new ArrayList();
			String sql="select tb.xingming,isnull(tc.ms,'正常')ms,kqrq from t_kaoqin ta " +
					   "left join t_xuesheng tb on ta.xsid = tb.id left join t_leixing tc " +
					   "on ta.kqlx = tc.id";
			Object[] params={};
			DbUtil mydb=new DbUtil();
			try
			{
				mydb.doQuery(sql, params);
				ResultSet rs=mydb.getRs();
				while(rs.next())
				{
					TKaoqin kaoqin=new TKaoqin();
					kaoqin.setXsxm(rs.getString("xingming"));
					kaoqin.setLxms(rs.getString("ms"));
					kaoqin.setKqrq(rs.getString("kqrq"));
					
					kaoqinList.add(kaoqin);
			    }
				rs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			mydb.closed();
			
            HSSFWorkbook wb = new HSSFWorkbook();
			HSSFSheet sheet = wb.createSheet("new sheet");
			
			HSSFRow row = sheet.createRow(0);
			HSSFCell cell=row.createCell((short)0);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("考勤日期");
					
			cell=row.createCell((short)1);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("姓名");
					
			cell=row.createCell((short)2);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("考勤情况");
			
			for(int i=0;i<kaoqinList.size();i++)
			{
				TKaoqin kaoqin=(TKaoqin)kaoqinList.get(i);
				
				row=sheet.createRow(i+1);
				cell=row.createCell((short)0);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(kaoqin.getKqrq());
						
				cell=row.createCell((short)1);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(kaoqin.getXsxm());
				
				cell=row.createCell((short)2);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(kaoqin.getLxms());
				
			}
			
			
			String fujianPath="c:\\考勤信息.xls";
			try
			{
				FileOutputStream fileOut = new FileOutputStream(fujianPath);
				wb.write(fileOut);
				fileOut.close();
			} 
			catch (Exception e)
			{
			       e.printStackTrace();
			}
			
          
      
          
          SmartUpload su = new SmartUpload(); // 新建一个SmartUpload对象 

          su.initialize(pageContext); // 初始化 

          su.setContentDisposition(null); 
          // 设定contentDisposition为null以禁止浏览器自动打开文件， 
          //保证点击链接后是下载文件。若不设定，则下载的文件扩展名为 
          //doc时，浏览器将自动用word打开它。扩展名为pdf时，将用acrobat打开

          //su.downloadFile("/uploadPath/file/liu.doc"); // 下载英文文件
          su.downloadFile(fujianPath, null, new String(java.net.URLDecoder.decode("考勤信息.xls","UTF-8").getBytes(), "ISO8859-1")); // 下载中文文件
          //downloadFile(String sourceFilePathName, String contentType, String destFileName)
          out.clear();
          out=pageContext.pushBody(); 
      %> 

      
  </body>
</html>
