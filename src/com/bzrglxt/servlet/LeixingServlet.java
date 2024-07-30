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

import com.bzrglxt.utils.DbUtil;
import com.bzrglxt.vo.TLeixing;

public class LeixingServlet extends HttpServlet{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		String type=req.getParameter("type");
		if(type.endsWith("leixingAdd"))
		{
			leixingAdd(req, res);
		}
		if(type.endsWith("leixingMana"))
		{
			leixingMana(req, res);
		}
		if(type.endsWith("leixingDel"))
		{
			leixingDel(req, res);
		}
		if(type.endsWith("leixingEdit"))
		{
			leixingEdit(req, res);
		}
	}
	public void leixingAdd(HttpServletRequest req,HttpServletResponse res){
		String ms=req.getParameter("ms");
		String sql="insert into t_leixing values(null,?,?)";
		Object[] params={ms,0};
		DbUtil mydb=new DbUtil();
		mydb.doUpdate(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "leixing?type=leixingMana");
		
        String targetURL = "/showMsg.jsp";
		dispatch(targetURL, req, res);
	}
	public void leixingMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException{
		List leixingList = new ArrayList();
		String sql="select id,ms from t_leixing where del = ?";
		Object[] params={0};
		DbUtil mydb=new DbUtil();
		try
		{
			mydb.doQuery(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TLeixing leixing=new TLeixing();
				leixing.setId(rs.getInt("id"));
				leixing.setMs(rs.getString("ms"));
				leixingList.add(leixing);
			}
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("leixingList", leixingList);
		req.getRequestDispatcher("/leixing/leixingMana.jsp").forward(req, res);
	}
	public void leixingDel(HttpServletRequest req,HttpServletResponse res){
		int id = Integer.parseInt(req.getParameter("id"));
		String sql="update t_leixing set del = ? where id=?";
		Object[] params={1,id};
		DbUtil mydb=new DbUtil();
		mydb.doUpdate(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "leixing?type=leixingMana");
		
        String targetURL = "/showMsg.jsp";
		dispatch(targetURL, req, res);
	}
	public void leixingEdit(HttpServletRequest req,HttpServletResponse res){
		int id = Integer.parseInt(req.getParameter("id"));
		String ms=req.getParameter("ms");
		String sql="update t_leixing set ms = ? where id=?";
		Object[] params={ms,id};
		DbUtil mydb=new DbUtil();
		mydb.doUpdate(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "leixing?type=leixingMana");
		
        String targetURL = "/showMsg.jsp";
		dispatch(targetURL, req, res);
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
