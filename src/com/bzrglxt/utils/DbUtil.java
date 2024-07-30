package com.bzrglxt.utils;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class DbUtil
{
	private Connection con;

	private PreparedStatement pstm;

	private String user;

	private String password;
	
	private String ip;
	
	private String port;
	
	private String dbName;

	private String url;

	public DbUtil()
	{
		try
		{
			getDbConnProp();
			//Class.forName(className);
		} catch (Exception e)
		{
			System.out.println("加载数据库驱动失败！");
			e.printStackTrace();
		}
	}

	private void getDbConnProp()
	{
		try{
			
		}catch(Exception e){
			e.printStackTrace();
		}

	}
	
	/** 创建数据库连接 */
	public Connection getCon()
	{
		try
		{
			String driver="com.mysql.jdbc.Driver";
			String url="jdbc:mysql://127.0.0.1:3306/no039_bzrglxt?useUnicode=true&characterEncoding=utf8";
			String user="root"; //数据库的连接名
			String password="root"; //数据库的连接密码，需要改成你自己的
			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			con = DriverManager.getConnection(url,user,password);
		} 
		catch (SQLException e)
		{
			System.out.println("创建数据库连接失败！");
			con = null;
			e.printStackTrace();
		}
		return con;
	}

	/**执行查询*/
	public void doQuery(String sql, Object[] params)
	{
		if (sql != null && !sql.equals(""))
		{
			if (params == null)
				params = new Object[0];
			
			getCon();
			if (con != null)
			{
				try
				{
					System.out.println(sql);
					pstm = con.prepareStatement(sql,
							ResultSet.TYPE_SCROLL_INSENSITIVE,
							ResultSet.CONCUR_READ_ONLY);
					for (int i = 0; i < params.length; i++)
					{
						pstm.setObject(i + 1, params[i]);
					}
					pstm.execute();
				} catch (SQLException e)
				{
					System.out.println("doPstm()方法出错！");
					e.printStackTrace();
				}
			}
		}
	}
	
	/**执行更新*/
	public void doUpdate(String sql,Object[] params){
		if (sql != null && !sql.equals(""))
		{
			if (params == null)
				params = new Object[0];
			
			getCon();
			if (con != null)
			{
				try
				{
					System.out.println(sql);
					pstm = con.prepareStatement(sql,
							ResultSet.TYPE_SCROLL_INSENSITIVE,
							ResultSet.CONCUR_READ_ONLY);
					for (int i = 0; i < params.length; i++)
					{
						pstm.setObject(i + 1, params[i]);
					}
					pstm.executeUpdate();
				} catch (SQLException e)
				{
					System.out.println("doPstm()方法出错！");
					e.printStackTrace();
				}
			}
		}
	
	}

	/**执行更新并返回自动标识值*/
	public int doUpdateGetId(String sql, Object[] params)
	{
		int num = -1;
		if (sql != null && !sql.equals(""))
		{
			if (params == null)
				params = new Object[0];

			getCon();
			if (con != null)
			{
				try
				{
					pstm = con.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
					for (int i = 0; i < params.length; i++)
					{
						pstm.setObject(i + 1, params[i]);
					}
					pstm.executeUpdate();
					ResultSet results = pstm.getGeneratedKeys();
		            
		            if(results.next())
		            {
		                num = results.getInt(1);
		            }
				} catch (SQLException e)
				{
					System.out.println("doPstm()方法出错！");
					e.printStackTrace();
				}
			}
		}
		return num;
	}

	/**获取结果集*/
	public ResultSet getRs() throws SQLException
	{
		return pstm.getResultSet();
	}

	/**关闭连接*/
	public void closed()
	{
		try
		{
			if (pstm != null)
				pstm.close();
		} catch (SQLException e)
		{
			System.out.println("关闭pstm对象失败！");
			e.printStackTrace();
		}
		try
		{
			if (con != null)
			{
				con.close();
			}
		} catch (SQLException e)
		{
			System.out.println("关闭con对象失败！");
			e.printStackTrace();
		}
	}
}
