package days04;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Scanner;

import com.util.DBConn;

import oracle.jdbc.internal.OracleTypes;

public class Ex03 {
	public static void main(String[] args) {
		// https://docs.oracle.com/cd/E17781_01/appdev.112/e18805/addfunc.htm#TDPJD209
		// CallableStatement - 저장프로시저, 저장함수
		// [저장 프로시저]		입력받은 ID를 사용 여부 체크하는 프로시저
		//		ㄴ 회원가입
		//			아이디 : [hong]<중복확인>
		//			비밀번호
		//			이메일
		//			주소
		//			연락처
		//			등등
		Scanner sc = new Scanner(System.in);
		System.out.println("> 중복 체크할 ID(empno)를 입력 ? ");
		int id = sc.nextInt();// 7369, 8888
		
		Connection conn = null;
		CallableStatement cstmt = null;
		int check = 0;
		
		String sql = "{call UP_IDCHECK (?,?)}";
//		String sql = "{call UP_IDCHECK (pid=>?,pcheck=>?)}";
		
		
		conn = DBConn.getConnection();
		
		try {
			cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, id); //IN
			// OUT 설정 X cstmt 출력용 매개변수
			cstmt.registerOutParameter(2, OracleTypes.INTEGER);
			cstmt.executeQuery();
			
			check = cstmt.getInt(2);
			
			if (check == 0) {
				System.out.println("사용 가능한 ID입니다");
			} else {
				System.out.println("사용 안돼용 힝");
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
 * // JDBC syntaxCallableStatement cs1 = conn.prepareCall
                        ( "{call proc (?,?)}" ) ; // stored proc
CallableStatement cs2 = conn.prepareCall
                        ( "{? = call func (?,?)}" ) ; // stored func

// Oracle PL/SQL block syntax
CallableStatement cs3 = conn.prepareCall
                        ( "begin proc (?,?); end;" ) ; // stored proc
CallableStatement cs4 = conn.prepareCall
                        ( "begin ? := func(?,?); end;" ) ; // stored func
/**/