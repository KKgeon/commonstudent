package days01;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;

import domain.EmpVO;
import domain.DeptEmpSalgrade;

public class Ex04 {
	public static void main(String[] args) throws SQLException {
		// 문제
		// 부서 정보를 입력받아서
		// emp 테이블에서 SELECT하는 코딩...
		// EmpVO
		// dispEmp(ArrayList<EmpVO> list)
		String className  = "oracle.jdbc.driver.OracleDriver";
		String url  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user = "scott";
		String password = "tiger";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		int empno;    
		String ename; 
		String job;   
		int mgr;      
		Date hiredate;
		int sal;      
		int comm;     
		int deptno;   
		ArrayList<EmpVO> list = new ArrayList<EmpVO>();
		try {
			Class.forName(className);
			conn = DriverManager.getConnection(url, user, password);
			String sql = " SELECT * FROM emp WHERE deptno = 30 "; 
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while ( rs.next()) {

				empno = rs.getInt("empno"); 
				ename = rs.getString("ename");
				job = rs.getString("job");
				mgr = rs.getInt("mgr");
				hiredate = rs.getDate("hiredate");
				sal = rs.getInt("sal");
				comm = rs.getInt("comm");
				deptno = rs.getInt("deptno");




				EmpVO vo = new EmpVO(empno, ename, job, mgr, hiredate, sal, comm, deptno);
				list.add(vo);
			}//w

			dispDept(list);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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

	private static void dispDept(ArrayList<EmpVO> list) {
		Iterator<EmpVO> ir = list.iterator();
		while (ir.hasNext()) {
			EmpVO vo = ir.next();
			System.out.println(vo.toString());
		}//w


	}//disp
}//c
