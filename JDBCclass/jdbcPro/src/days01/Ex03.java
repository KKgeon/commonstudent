package days01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author user
 * @date 2024. 3. 15. - 오후 3:45:16
 * @subject [내일 복습 문제]
 * @content scott 접속 + dept 테이블 SELECT 
 *  
 * 
 */
public class Ex03 {
	public static void main(String[] args) throws SQLException {
		String className  = "oracle.jdbc.driver.OracleDriver";
		String url  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user = "scott";
		String password = "tiger";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		int deptno;
		String dname;
		String loc;

		try {
			//1. Class.forName() JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2. Connection 객체 생성 DriverManager.gerConnection()
			conn = DriverManager.getConnection(url, user, password);
			//3. 필요한 작업(CRUD)
			String sql = " SELECT * FROM dept"; 
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while ( rs.next()) {
				/*
				deptno = rs.getInt(1);
				dname = rs.getString(2);
				loc= rs.getString(3);

				System.out.printf("%d\t%s\t%s\n"
					, deptno, dname, loc);
				 */
				deptno = rs.getInt("deptno"); //collumnLabel(컬럼명)
				dname = rs.getString("dname");
				loc= rs.getString("loc");

				System.out.printf("%d\t%s\t%s\n"
						, deptno, dname, loc);
			}//w

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//4. Connection 닫기 (close)
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}


		System.out.println(conn.isClosed() ? "DB 닫힘":"DB 연결");
		System.out.println(" end ");
	}//m
}//c
