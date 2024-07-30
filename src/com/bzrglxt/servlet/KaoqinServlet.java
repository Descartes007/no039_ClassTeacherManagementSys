package com.bzrglxt.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bzrglxt.utils.DateUtils;
import com.bzrglxt.utils.DbUtil;
import com.bzrglxt.vo.TKaoqin;
import com.bzrglxt.vo.TLeixing;
import com.bzrglxt.vo.TXuesheng;

public class KaoqinServlet extends HttpServlet{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		String type=req.getParameter("type");
		if(type.endsWith("kaoqinAdd"))
		{
			kaoqinAdd(req, res);
		}
		if(type.endsWith("kaoqinQuery"))
		{
			kaoqinQuery(req, res);
		}
		if(type.endsWith("kaoqinToAdd"))
		{
			kaoqinToAdd(req, res);
		}
	}
	
	public void kaoqinAdd(HttpServletRequest req,HttpServletResponse res){
		String[] arrKqqk = req.getParameterValues("kqqk");
		
		String nowDate = DateUtils.getShortStrDate();
		
		DbUtil mydb=new DbUtil();
		try
		{
			for(int i=0;i<arrKqqk.length;i++){
				String[] kqqk = arrKqqk[i].split("_");
				
				String sql = "select * from t_kaoqin where xsid="+kqqk[0]+" and kqrq = ?";
				Object[] params={nowDate};
				mydb.doQuery(sql, params);
				ResultSet rs=mydb.getRs();
				
				if(!(rs.next())){
					//插入操作
					sql = "insert into t_kaoqin values (null,"+kqqk[0]+",'"+nowDate+"',"+kqqk[1]+",now())";
				}else{
					//更新操作
					sql = "update t_kaoqin set kqlx="+kqqk[1]+",lrsj=now() where xsid="+kqqk[0]+" and kqrq = '"+nowDate+"'";
				}
				mydb.doUpdate(sql, null);
				rs.close();
			}
			
			mydb.closed();
			
			req.setAttribute("message", "操作成功");
			req.setAttribute("path", "kaoqin?type=kaoqinToAdd");
			
	        String targetURL = "/showMsg.jsp";
			dispatch(targetURL, req, res);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
	}
	public void kaoqinQuery(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException{
		List kqqkList = new ArrayList();
		
		String kqrq = req.getParameter("kqrq")==null?"":req.getParameter("kqrq");
		String xm = req.getParameter("xm")==null?"":req.getParameter("xm");
		
		String sql = "select tb.xingming,ifnull(tc.ms,'正常')ms,kqrq from t_kaoqin ta " +
					 "left join t_xuesheng tb on ta.xsid = tb.id left join t_leixing tc " +
					 "on ta.kqlx = tc.id where 1=1 ";
		
		if(!(kqrq.trim().equals(""))){
			sql += " and ta.kqrq='"+kqrq+"' ";
		}
		if(!(xm.trim().equals(""))){
			sql += " and xingming  like '%"+xm+"%'";
		}
		
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
				
				kqqkList.add(kaoqin);
			}
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("kqqkList", kqqkList);
		req.setAttribute("kqrq", kqrq);
		req.setAttribute("xm", xm);
		req.getRequestDispatcher("/kaoqin/kaoqinQuery.jsp").forward(req, res);		
	}
	public void kaoqinToAdd(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException{
		List xsxxList = new ArrayList();
		List kqlxList = new ArrayList();
		String nowDate = DateUtils.getShortStrDate();
		
		String sql = "select ta.id,xingming,ifnull(kqlx,-1)kqlx from t_xuesheng ta "+
					 "left join t_kaoqin tb on ta.id = tb.xsid and kqrq='"+nowDate+"' where ta.del = 0 ";
		
		Object[] params={};
		DbUtil mydb=new DbUtil();
		try
		{
			mydb.doQuery(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TXuesheng xuesheng=new TXuesheng();
				xuesheng.setId(rs.getInt("id"));
				xuesheng.setXingming(rs.getString("xingming"));
				xuesheng.setKqlx(rs.getString("kqlx"));
				
				xsxxList.add(xuesheng);
			}
			
			TLeixing kqlx=new TLeixing();
			kqlx.setId(-1);
			kqlx.setMs("正常");
			kqlxList.add(kqlx);
			
			sql = "select id,ms from t_leixing where del = ?";
			Object[] params1={0};
			mydb.doQuery(sql, params1);
			rs=mydb.getRs();
			while(rs.next())
			{
				kqlx=new TLeixing();
				kqlx.setId(rs.getInt("id"));
				kqlx.setMs(rs.getString("ms"));
				kqlxList.add(kqlx);
			}
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("xsxxList", xsxxList);
		req.setAttribute("kqlxList", kqlxList);
		req.getRequestDispatcher("/kaoqin/kaoqinAdd.jsp").forward(req, res);
	}
	
	public void dispatch(String targetURI,HttpServletRequest request,HttpServletResponse response) 
	{
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
		try 
		{
		    dispatch.forward(request, response);
		    return;
		} 
		catch (ServletException e) 
		{
                    e.printStackTrace();
		} 
		catch (IOException e) 
		{
			
		    e.printStackTrace();
		}
	}
}
