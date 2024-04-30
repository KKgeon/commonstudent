package days02;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import com.util.DBConn;

/**
 * @author user
 * @date 2024. 3. 19. - 오전 10:12:10
 * @subject	PreparedStatement 사용해서 코딩 수정
 * @content
 */
public class Ex03 {

	public static int selectedNumber;
	public static Connection conn;
	public static Scanner sc = new Scanner(System.in);

	public static void main(String[] args) throws IOException {
		conn = DBConn.getConnection();
		//6명
		//7명
		//1 추가
		//2 수정
		//3 삭제
		//4 검색
		//5 조회
		//6 

		직원수정();


	}//m

	private static void editemp() throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		//	      Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//	         stmt = conn.createStatement();
			String sql = "SELECT * FROM emp WHERE 1 != 0";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			String [] columnName = new String[rsmd.getColumnCount() - 1];
			String [] updateColumn = new String[rsmd.getColumnCount() -1 ];
			// 컬럼의 인덱스가 1부터 시작하기 때문에 for-loop도 1부터 시작하도록 함
			for(int i = 2; i <= rsmd.getColumnCount(); i++) {
				// columnType은 java.sql.Types 에 선언되어있다.
				int columnType = rsmd.getColumnType(i);
				columnName[i - 2] = rsmd.getColumnName(i);
			}  
			System.out.println("사원 번호를 입력하세요.");
			int empno = Integer.parseInt(br.readLine());

			for (int i = 0; i < columnName.length; i++) {
				System.out.printf("%s 정보를 입력하세요 ", columnName[i]);
				updateColumn[i] = br.readLine();
			}


			for (int i = 0; i < updateColumn.length; i++) {
				if ( updateColumn[i].isEmpty() ) {
					sql = String.format("SELECT %s FROM emp WHERE empno = ? ", columnName[i]);
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, empno);
					rs = pstmt.executeQuery();
					rs.next();
					updateColumn[i] = rs.getString(columnName[i]);
					System.out.println(updateColumn[i]);
				}
			}

			int rowCount = 0 ;
			sql = "UPDATE emp SET ";
			for (int i = 0; i < updateColumn.length; i++) {
				if (columnName[i].equals("HIREDATE")) {
					String hiredate = updateColumn[i];
					hiredate = hiredate.replaceAll("-", "/");
					hiredate = hiredate.substring(0,10);
					sql += String.format("%s = '%s', ", columnName[i],  hiredate);
				} else 
					sql += String.format("%s = '%s', ", columnName[i],  updateColumn[i] == null ? "0" : updateColumn[i]);
			}
			sql = sql.substring(0,sql.length()-2);
			sql += "WHERE empno = " + empno;


			pstmt = conn.prepareStatement(sql);

			rowCount = pstmt.executeUpdate();
			System.out.println(rowCount + "행의 정보가 수정되었습니다.");


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				br.close();
				pstmt.close();
				rs.close();
				conn.close();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}


	}




	private static void 직원수정() {
		System.out.print("> 수정할 직원번호 입력하세요 ? ");
		int empno = sc.nextInt();
		sc.nextLine();  
		System.out.print("> 수정할 직원명 입력하세요 ? ");
		String ename = sc.nextLine(); 
		System.out.print("> 수정할 직무 입력하세요 ? ");
		String job  = sc.nextLine(); 
		System.out.print("> 수정할 상사의 사원번호를 입력하세요 ? ");
		int mgr = sc.nextInt();
		sc.nextLine(); 
		System.out.print("> 수정할 입사일을 입력하세요 ? (yyyy-MM-dd 형식으로 입력하세요) ");
		String hiredate = sc.nextLine(); 
		System.out.print("> 수정할 급여를 입력하세요 ? ");
		int sal = sc.nextInt();
		sc.nextLine(); 
		System.out.print("> 수정할 보너스를 입력하세요 ? ");
		int comm = sc.nextInt();
		sc.nextLine(); 
		System.out.print("> 수정할 부서번호를 입력하세요 ? ");
		int deptno = sc.nextInt();
		sc.nextLine(); 

		String sql = null;


		sql = " UPDATE emp SET"
				+ " ename = ? ,job = ?, mgr = ?, hiredate = TO_DATE(?, 'YYYY-MM-DD'), sal = ?, comm = ?, deptno = ? "
				+ " WHERE empno = ?";

		System.out.println(sql); 

		PreparedStatement pstmt = null;
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ename);
			pstmt.setString(2, job);
			pstmt.setInt(3, mgr);
			pstmt.setString(4, hiredate);
			pstmt.setInt(5, sal);
			pstmt.setInt(6, comm);
			pstmt.setInt(7, deptno);
			pstmt.setInt(8, empno);


			int rowCount = pstmt.executeUpdate();

			if (rowCount==1) {
				System.out.println("부서 수정 성공!!!");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}//c
