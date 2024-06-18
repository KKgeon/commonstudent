package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//싱글톤 (Singlton)
public class DBConn {

	private static Connection conn = null;

	private DBConn() {}

	public static Connection getConnection() {

		if (conn==null) {
			String classname = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			String user = "scott";
			String pasword = "tiger";


			try {
				Class.forName(classname);
				conn = DriverManager.getConnection(url,user,pasword);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
			}


		}//if

		return conn;
	}//getconn


	// [오버로딩], 오버라이딩
	public static Connection getConnection(String url, String user, String password) {

		if (conn==null) {
			String classname = "oracle.jdbc.driver.OracleDriver"; 

			try {
				Class.forName(classname);
				conn = DriverManager.getConnection(url,user,password);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
			}


		}//if

		return conn;
	}//getconn

	public static void close() {
		try {
			if (conn!=null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		conn=null;
	}
}//c
