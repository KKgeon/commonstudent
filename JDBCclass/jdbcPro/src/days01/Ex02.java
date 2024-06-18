package days01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Ex02 {
	public static void main(String[] args) throws SQLException {
		String className  = "oracle.jdbc.driver.OracleDriver";
		String url  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user = "scott";
		String password = "tiger";
		Connection conn = null;
		//[Ex02.java <--> localhost oracle 서버에 연결]
		try {
			//1. Class.forName() JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2. Connection 객체 생성 DriverManager.gerConnection()
			conn = DriverManager.getConnection(url, user, password);
			//3. 필요한 작업( CRUD)
			System.out.println(conn.isClosed() ? "DB 닫힘":"DB 연결");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//4. Connection 닫기 (close)
		System.out.println(conn.isClosed() ? "DB 닫힘":"DB 연결");
		System.out.println(" end ");
	}//m
}//c
