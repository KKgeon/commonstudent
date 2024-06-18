package days04;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.util.DBConn;

import oracle.net.aso.p;

public class Ex02 {
	public static void main(String[] args) {
		//자바 트랜잭션 처리
		//오라클 트랜잭션 처리
		// 예) 계좌이체
		// A ->인출
		// B ->입금

		// A INSERT dept 50 부서 추가 : 성공
		// B INSERT dept 50 부서 추가 : PK 제약조건 위배 에러

		String sql = " INSERT INTO dept VALUES (?,?,?)";

		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;

		conn = DBConn.getConnection();

		try {
			conn.setAutoCommit(false); //[1]
			pstmt = conn.prepareStatement(sql);

			// insert[1]
			pstmt.setInt(1, 50);
			pstmt.setString(2, "QC");
			pstmt.setString(3, "SEOUL");
			rowCount = pstmt.executeUpdate();
			//첫번째 INSERT문 : 1 성공
			System.out.println("첫번째 INSERT문 : " + rowCount);



			// insert[2]
			pstmt.setInt(1, 50);
			pstmt.setString(2, "QC2");
			pstmt.setString(3, "SEOUL2");

			rowCount = pstmt.executeUpdate();
			System.out.println("두번째 INSERT문 : " + rowCount);

			conn.commit(); //[2]
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();//[3]
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} //try



		DBConn.close();
		System.out.println("end");


	}//m
}//c
