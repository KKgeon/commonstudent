package days02;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

import domain.DeptEmpSalgrade;

public class Ex01 {
	public static void main(String[] args) throws SQLException {
		//		 - emp,dept,salgrade 테이블을 사용해서
		//		   ename으로 검색하여 
		//		   ArrayList<> 에 저장하여 
		//		   dispEmpList(ArrayList<> list) 메서드를 선언하여 출력하는 코딩을 하세요.
		//		 - empno, dname, ename, hiredate, pay, salgrade 컬럼 출력.   
		//		 - 검색결과가 없는 경우 
		//		    "사원이 존재하지 않습니다." 라고 출력


		
		Scanner sc = new Scanner(System.in);
		String searchWord;
		System.out.println("> 검색할 사원명 입력 ?");
		searchWord = sc.next();
		String sql = String.format(
				"SELECT e.empno, d.dname, e.ename, e.hiredate, e.sal + NVL(e.comm,0) pay, s.grade "
				+ "FROM emp e "
				+ "JOIN dept d ON e.deptno = d.deptno "
				+ "JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal "
				+ "WHERE REGEXP_LIKE (ename, '%s', 'i')", searchWord);
		
		
		String classname = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user = "scott";
		String pasword = "tiger";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		DeptEmpSalgrade vo = null;
		ArrayList<DeptEmpSalgrade> list = new ArrayList<DeptEmpSalgrade>();
		
		int empno;
		String dname;
		String ename;
		Date hiredate;
		double pay;
		int grade;

		try {
			Class.forName(classname);
			conn = DriverManager.getConnection(url,user,pasword);
			
			stmt = conn.createStatement();

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				empno = rs.getInt("empno");
				dname = rs.getString("dname");
				ename = rs.getString("ename");
				hiredate = rs.getDate("hiredate");
				pay = rs.getDouble("pay");
				grade = rs.getInt("grade");

				vo = new DeptEmpSalgrade(empno, dname, ename, hiredate, pay, grade);
				list.add(vo);

			}//w
			dispQ(list);
		} catch (ClassNotFoundException e) {

		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}






	}//m
	private static void dispQ(ArrayList<DeptEmpSalgrade> list) {
		Iterator<DeptEmpSalgrade> ir = list.iterator();
		if (list.isEmpty()) {
			System.out.println("사원이 존재하지 않습니다.");
		} else {
			while (ir.hasNext()) {
				DeptEmpSalgrade vo = ir.next();
				System.out.println(vo.toString());
			}//w
		}//if


	}//disp
}//c
  