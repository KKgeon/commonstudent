package days04;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.DBConn;

import domain.DeptVO;
import oracle.jdbc.internal.OracleTypes;

/**
 * @author user
 * @date 2024. 3. 20. - 오후 2:17:38
 * @subject	dept-insert 부서 추가
 * @content up_insertdept
 */
public class Ex05_02 {
	public static void main(String[] args) {

		String sql = "{CALL UP_INSERTDEPT(?,?)}";


		Connection conn = null;
		CallableStatement cstmt = null;
		int rowCount = 0;


		String pdname = "QC" , ploc = "SEOUL";

		conn = DBConn.getConnection();

		try {
			cstmt = conn.prepareCall(sql);

			cstmt.setString(1, pdname);
			cstmt.setString(2, ploc);
			rowCount = cstmt.executeUpdate();

			if (rowCount==1) {
				System.out.println("부서추가성공");
			} else {
				System.out.println("부서추가실패");
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				cstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}




		DBConn.close();
		System.out.println("end");
	}//m
}//c
/*
 * 
 * 
 * 
CREATE OR REPLACE PROCEDURE up_selectdept
(
pdeptcursor OUT SYS_REFCURSOR
)
IS

BEGIN   
   OPEN pdeptcursor FOR SELECT * FROM dept;
END;
 */