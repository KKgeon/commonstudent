package days01;

import java.sql.Connection;
import java.sql.SQLException;

import oracle.jdbc.pool.OracleDataSource;

public class Ex02_02 {
	public static void main(String[] args) {

		String className  = "oracle.jdbc.driver.OracleDriver";
		String url  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user = "scott";
		String password = "tiger";
		Connection conn = null;

		// Datasource 객체
		OracleDataSource ds;

		try {
			ds = new OracleDataSource();
			ds.setURL(url);
			conn = ds.getConnection(user, password);

			System.out.println(conn.isClosed());

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		System.out.println(" end ");
	}//m
}//c
