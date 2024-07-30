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
			System.out.println("�������ݿ�����ʧ�ܣ�");
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
	
	/** �������ݿ����� */
	public Connection getCon()
	{
		try
		{
			String driver="com.mysql.jdbc.Driver";
			String url="jdbc:mysql://127.0.0.1:3306/no039_bzrglxt?useUnicode=true&characterEncoding=utf8";
			String user="root"; //���ݿ��������
			String password="root"; //���ݿ���������룬��Ҫ�ĳ����Լ���
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
			System.out.println("�������ݿ�����ʧ�ܣ�");
			con = null;
			e.printStackTrace();
		}
		return con;
	}

	/**ִ�в�ѯ*/
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
					System.out.println("doPstm()��������");
					e.printStackTrace();
				}
			}
		}
	}
	
	/**ִ�и���*/
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
					System.out.println("doPstm()��������");
					e.printStackTrace();
				}
			}
		}
	
	}

	/**ִ�и��²������Զ���ʶֵ*/
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
					System.out.println("doPstm()��������");
					e.printStackTrace();
				}
			}
		}
		return num;
	}

	/**��ȡ�����*/
	public ResultSet getRs() throws SQLException
	{
		return pstm.getResultSet();
	}

	/**�ر�����*/
	public void closed()
	{
		try
		{
			if (pstm != null)
				pstm.close();
		} catch (SQLException e)
		{
			System.out.println("�ر�pstm����ʧ�ܣ�");
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
			System.out.println("�ر�con����ʧ�ܣ�");
			e.printStackTrace();
		}
	}
}
