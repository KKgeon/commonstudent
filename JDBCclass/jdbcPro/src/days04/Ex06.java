package days04;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

import com.util.DBConn;

import domain.DeptVO;
import oracle.jdbc.internal.OracleTypes;

/**
 * @author user
 * @date 2024. 3. 20. - 오후 3:09:25
 * @subject	자바 리플렉션(reflection)
 * @content	반사, 상, 반영
 * 		JDBC 리플렉션 ? 결과물(rs)에 대한 정보를 추출해서 사용할 수 있는 기술
 */
public class Ex06 {
	public static void main(String[] args) {
		String sql ="SELECT table_name FROM tabs";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String> tnList = new ArrayList<String>();
		String tableName = null;



		conn = DBConn.getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();


			while (rs.next()) {
				tableName = rs.getString(1);
				tnList.add(tableName);
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//tbList 출력
		System.out.println(tnList.toString());


		//[2]
		Scanner sc = new Scanner(System.in);
		System.out.println("> 테이블명을 입력 ? ");
		tableName = sc.next();
		//(기억) 테이블명, 컬럼명은 pstmt의 매개변수로 사용X
		//sql = "SELECT * FROM ?";
		sql = "SELECT * FROM " + tableName;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			ResultSetMetaData rsmd = rs.getMetaData();
			//			System.out.println("> 컬럼 수 : " + rsmd.getColumnCount());
			int columnCount = rsmd.getColumnCount();

			System.out.println("-".repeat(columnCount*7));

			/*
			for (int i = 1; i < columCount; i++) {
				String columName = rsmd.getColumnName(i);
				String columnType = rsmd.getColumnTypeName(i);

				if (columnType.equals("NUMBER")) {
					//NUMBER(p,s)
					//NUMBER(p)
					int precision = rsmd.getPrecision(i);
					int scale = rsmd.getScale(i);
					System.out.printf("%s %s(%d,%d)\n",columName,columnType,precision,scale);
				} else {
					System.out.printf("%s %s\n" , columName, columnType);
				}

			}//for

			 */


			for (int i = 1; i < columnCount; i++) {
				String columName = rsmd.getColumnName(i);

				System.out.printf("%s\t" , columName);
			}
			System.out.println();//개행

			System.out.println("-".repeat(columnCount*7));
			//rs레코드 출력
			//2-NUMBER
			//12-VARCHAR2
			//93-DATE
			while (rs.next()) {
				for (int i = 1; i < columnCount; i++) {
					int columnType = rsmd.getColumnType(i);
					if (columnType==2) {
						int scale = rsmd.getScale(i);
						if (scale == 0 ) {//정수
							System.out.printf("%d \t", rs.getInt(i));	
						} else {//실수
							System.out.printf("%.2f \t", rs.getDouble(i));	
						}
					} else if (columnType == 12) {
						System.out.printf("%s \t", rs.getString(i));	
					} else if (columnType == 93) {
						System.out.printf("%tF \t", rs.getDate(i));	
					}

				}//for
				System.out.println();
			}//while

			System.out.println("-".repeat(columnCount*7));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}


















		//[3]
		DBConn.close();
		System.out.println("end");

	}//m
}//c
