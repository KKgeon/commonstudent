package days04;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Scanner;

import com.util.DBConn;

public class Ex04 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println(" 삭제할 empno 입력 ?");
		int id = sc.nextInt();// 7369, 8888

		Connection conn = null;
		CallableStatement cstmt = null;

		String sql = "{call up_delete (?)}";
		//		String sql = "{call UP_IDCHECK (pid=>?,pcheck=>?)}";


		conn = DBConn.getConnection();

		try {
			cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, id); //IN
			cstmt.executeQuery();

			int rowCount = cstmt.executeUpdate();

			if (rowCount == 1) {
				System.out.println("삭제 성공");
			} else {
				System.out.println("삭제 실패");
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
	}//m
}//c
/*
 * 예) 로그인
 * 아이디 empno
 * 비밀번호 ename
 * <로그인> <회원가입>
 * 
 * 
 *  로그인 성공
 *  로그인 실패
 *  
 *  up_login 저장프로시저
 *  OUT 매개변수
 *  
 *  
 *  
 *  CREATE OR REPLACE PROCEDURE up_login
(
    pid IN emp.empno%TYPE
    , ppwd IN emp.ename%TYPE
    , pcheck OUT NUMBER --1(성공), 0(실패)
)
IS
    vpwd emp.ename%TYPE;
BEGIN
    SELECT COUNT(*) INTO pcheck
    FROM emp
    WHERE empno = pid;

    IF pcheck = 1 THEN -- ID 존재 0
        SELECT ename INTO vpwd
        FROM emp
        WHERE empno = pid;
        IF vpwd = ppwd THEN --PWD일치
        pcheck :=0;
        ELSE
        pcheck :=1;
        END IF;


    ELSE -- ID 존재 X
        pcheck := -1;
    END IF;
END;
 */
