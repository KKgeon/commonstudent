package days03;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;

import com.util.DBConn;

import domain.DeptEmpSalgrade;
import domain.DeptEmpSalgradeVO;
import domain.SalgradeVO;

public class Ex03 {
	public static void main(String[] args) {
		String sql = "SELECT grade, losal, hisal, COUNT(*) cnt "
				+ "FROM salgrade s JOIN emp e ON e.sal BETWEEN s.losal AND s.hisal "
				+ "GROUP BY grade, losal, hisal "
				+ "ORDER BY grade ASC ";

		String empSql = "SELECT d.deptno, dname, empno, ename, sal, grade "
				+ "FROM dept d RIGHT JOIN emp e ON d.deptno = e.deptno "
				+ "JOIN salgrade s ON sal BETWEEN losal AND hisal "
				+ "WHERE grade = ?";
		Connection conn = null;
		PreparedStatement empPstmt = null;
		ResultSet rs = null, empRs = null;
		SalgradeVO vo = null;//key
		ArrayList<DeptEmpSalgradeVO> empList = null;//value
//		ArrayList<SalgradeVO> list = null;
		
		DeptEmpSalgradeVO empVo = null;
		LinkedHashMap<SalgradeVO, ArrayList<DeptEmpSalgradeVO>> map = null;
		
		conn = DBConn.getConnection();


		try {
			empPstmt = conn.prepareStatement(sql);
			rs = empPstmt.executeQuery();
			if (rs.next()) {
				do {
					int grade =  rs.getInt("grade");
					vo = new SalgradeVO(
							grade
							, rs.getInt("losal")
							, rs.getInt("hisal")
							, rs.getInt("cnt")
							);
					
					empPstmt = conn.prepareStatement(empSql);
					empPstmt.setInt(1,grade);
					empRs=empPstmt.executeQuery();
					
					if (empRs.next()) {
						empList = new ArrayList<DeptEmpSalgradeVO>();
						do {
							  empVo = DeptEmpSalgradeVO
			                           .builder()
			                           .empno(empRs.getInt("empno"))
			                           .dname(empRs.getString("dname"))
			                           .ename(empRs.getString("ename"))
			                           .pay(empRs.getDouble("sal"))
			                           .build();
			                     empList.add(empVo);

						} while (empRs.next());
					}
					
					map.put(vo, empList);
					empRs.close();
					empPstmt.close();
				} while (rs.next());
			}//if
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				empPstmt.close();
				DBConn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}


	}//m

	private static void dispSalgrade(ArrayList<SalgradeVO> list) {
		Iterator<SalgradeVO> ir = list.iterator();
		while (ir.hasNext()) {
			SalgradeVO vo =  ir.next();
			System.out.printf("%d등급 (%d~%d) - %명\n"
					, vo.getGrade()
					, vo.getLosal()
					, vo.getHisal()
					, vo.getCnt());
		}

	}
}//c
