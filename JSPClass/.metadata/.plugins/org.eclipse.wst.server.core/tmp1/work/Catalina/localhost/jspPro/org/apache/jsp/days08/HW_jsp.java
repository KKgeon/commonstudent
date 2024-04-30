/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.88
 * Generated at: 2024-04-29 07:55:26 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.days08;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Date;
import java.util.Iterator;
import java.sql.SQLException;
import java.util.ArrayList;
import domain.DeptVO;
import domain.EmpVO;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import com.util.DBConn;
import java.sql.Connection;

public final class HW_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(3);
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.LinkedHashSet<>(10);
    _jspx_imports_classes.add("domain.DeptVO");
    _jspx_imports_classes.add("java.sql.SQLException");
    _jspx_imports_classes.add("java.sql.Connection");
    _jspx_imports_classes.add("java.util.Iterator");
    _jspx_imports_classes.add("java.util.Date");
    _jspx_imports_classes.add("java.sql.ResultSet");
    _jspx_imports_classes.add("com.util.DBConn");
    _jspx_imports_classes.add("java.sql.PreparedStatement");
    _jspx_imports_classes.add("java.util.ArrayList");
    _jspx_imports_classes.add("domain.EmpVO");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

   Connection conn = DBConn.getConnection();
   
   PreparedStatement pstmt = null;
   ResultSet rs = null;   
   String sql = "SELECT deptno, dname, loc FROM dept";
      
   int deptno = 0;
   String dname =  null; 
   String loc =   null;
   
   DeptVO dvo = null;
   ArrayList<DeptVO> dlist = null;
   
   try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      
      if( rs.next() ) {
         dlist = new ArrayList<>();
         do {
            deptno = rs.getInt("deptno");
            dname = rs.getString("dname");
            loc = rs.getString("loc");   
            
            dvo = new DeptVO(deptno, dname, loc);   
            
            dlist.add(dvo);
         } while (rs.next());            
      } // if 
      
      
   } catch (SQLException e) { 
      e.printStackTrace();
   } finally {
      try {
         pstmt.close();
         rs.close();
         // DBConn.close();
      } catch (SQLException e) { 
         e.printStackTrace();
      }
   }

      out.write('\r');
      out.write('\n');

   
    String pDeptno = request.getParameter("deptno");
    
    if( pDeptno == null || pDeptno.equals("")  ) pDeptno = "10";

   deptno = Integer.parseInt(pDeptno);
   
   sql =  "SELECT empno, ename, job, mgr, to_char(hiredate,'yyyy-MM-dd') hiredate, sal, comm , deptno "
            + " FROM emp "
            + " WHERE deptno = ? ";
   
   int empno;
   String ename;
   String job;
   int mgr;
   // String hiredate; 
   Date hiredate;
   double sal;
   double comm;
   
   EmpVO evo = null;
   ArrayList<EmpVO> elist = null;
   
   try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, deptno);
      rs = pstmt.executeQuery();
      
      if ( rs.next() ) { 
         elist = new ArrayList<EmpVO>();
         
         do { 
             empno = rs.getInt("empno");
             ename = rs.getString("ename");
             job = rs.getString("job");
             mgr = rs.getInt("mgr");
             // hiredate = rs.getString("hiredate");
             hiredate = rs.getDate("hiredate");
             
             sal = rs.getDouble("sal");
             comm = rs.getDouble("comm");
             
             evo = new EmpVO(empno, ename, job, mgr, hiredate, sal, comm, deptno);
             
            elist.add(evo);
             
         } while ( rs.next() );
         
      } // if 
      
      
   } catch (SQLException e) { 
      e.printStackTrace();
   } finally {
      try {
         pstmt.close();
         rs.close();
         DBConn.close();
      } catch (SQLException e) { 
         e.printStackTrace();
      }
   } 

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link rel=\"shortcut icon\" href=\"http://localhost/jspPro/images/SiSt.ico\">\r\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/jspPro/resources/cdn-main/example.css\">\r\n");
      out.write("<script src=\"/jspPro/resources/cdn-main/example.js\"></script>\r\n");
      out.write("<style>\r\n");
      out.write(" span.material-symbols-outlined{\r\n");
      out.write("    vertical-align: text-bottom;\r\n");
      out.write(" }\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<header>\r\n");
      out.write("  <h1 class=\"main\"><a href=\"#\" style=\"position: absolute;top:30px;\">kenik HOme</a></h1>\r\n");
      out.write("  <ul>\r\n");
      out.write("    <li><a href=\"#\">로그인</a></li>\r\n");
      out.write("    <li><a href=\"#\">회원가입</a></li>\r\n");
      out.write("  </ul>\r\n");
      out.write("</header>\r\n");
      out.write("<h3>\r\n");
      out.write("  <span class=\"material-symbols-outlined\">view_list</span> jsp days00\r\n");
      out.write("</h3>\r\n");
      out.write("<div>\r\n");
      out.write("  <xmp class=\"code\">  \r\n");
      out.write("  </xmp> \r\n");
      out.write("  \r\n");
      out.write("  <select id=\"deptno\" name=\"deptno\">\r\n");
      out.write("    ");

       Iterator<DeptVO> ir = dlist.iterator();
      while (ir.hasNext()) {
         dvo = ir.next();
   
      out.write("\r\n");
      out.write("   <option value=\"");
      out.print( dvo.getDeptno() );
      out.write("\" data-loc=\"");
      out.print( dvo.getLoc() );
      out.write('"');
      out.write(' ');
      out.write('>');
      out.print( dvo.getDname() );
      out.write("</option>\r\n");
      out.write("   ");
      
      } // while
    
      out.write("  \r\n");
      out.write("  </select>\r\n");
      out.write("  <br>\r\n");
      out.write("  <br>\r\n");
      out.write("  <h2>emp list</h2>\r\n");
      out.write("  <table>\r\n");
      out.write("    <thead>\r\n");
      out.write("      <tr>\r\n");
      out.write("        <td><input type=\"checkbox\"  id=\"ckbAll\" name=\"ckbAll\"></td>\r\n");
      out.write("        <td>empno</td>\r\n");
      out.write("        <td>ename</td>\r\n");
      out.write("        <td>job</td>\r\n");
      out.write("        <td>mgr</td>\r\n");
      out.write("        <td>hiredate</td>\r\n");
      out.write("        <td>sal</td>\r\n");
      out.write("        <td>comm</td>\r\n");
      out.write("        <td>deptno</td>\r\n");
      out.write("      </tr>\r\n");
      out.write("    </thead>\r\n");
      out.write("    <tbody>\r\n");
      out.write("      ");

      if(elist == null){
       
      out.write("\r\n");
      out.write("       <tr>\r\n");
      out.write("         <td colspan=\"9\">사원 존재 X</td>\r\n");
      out.write("       </tr>\r\n");
      out.write("       ");
     
      }else{
        Iterator<EmpVO> eir = elist.iterator();
        while( eir.hasNext() ){
           evo = eir.next();
      
      out.write("\r\n");
      out.write("        <tr>\r\n");
      out.write("        <td><input type=\"checkbox\"  data-empno=\"");
      out.print( evo.getEmpno() );
      out.write("\" \r\n");
      out.write("         value=\"");
      out.print( evo.getEmpno() );
      out.write("\"></td> \r\n");
      out.write("        <td>");
      out.print( evo.getEmpno() );
      out.write("</td>\r\n");
      out.write("        <td>");
      out.print( evo.getEname() );
      out.write("</td>\r\n");
      out.write("        <td>");
      out.print( evo.getJob() );
      out.write("</td>\r\n");
      out.write("        <td>");
      out.print( evo.getMgr() );
      out.write("</td>\r\n");
      out.write("        <td>");
      out.print( evo.getHiredate() );
      out.write("</td>\r\n");
      out.write("        <td>");
      out.print( evo.getSal() );
      out.write("</td>\r\n");
      out.write("        <td>");
      out.print( evo.getComm() );
      out.write("</td>\r\n");
      out.write("        <td>");
      out.print( evo.getDeptno() );
      out.write("</td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      ");
       
        } // while
      }
      
      out.write("\r\n");
      out.write("    </tbody>\r\n");
      out.write("    <tfoot>\r\n");
      out.write("      <tr>\r\n");
      out.write("        <td colspan=\"9\">\r\n");
      out.write("          <span class=\"badge left red\">");
      out.print(  elist==null ? 0 : elist.size() );
      out.write("</span> 명.  \r\n");
      out.write("          <a href=\"javascript:history.back()\">뒤로 가기</a>\r\n");
      out.write("          <button>선택한 empno 확인</button>\r\n");
      out.write("        </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("    </tfoot>\r\n");
      out.write("  </table>\r\n");
      out.write("  \r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("  $(function (){\r\n");
      out.write("     $(\"#deptno\").change(function(event) {\r\n");
      out.write("        let deptno = $(this).val();\r\n");
      out.write("        let url = `http://localhost/jspPro/days02/ex01.jsp?deptno=${deptno}`;\r\n");
      out.write("        location.href = url;\r\n");
      out.write("     }); \r\n");
      out.write("     \r\n");
      out.write("  });\r\n");
      out.write("</script>\r\n");
      out.write("<script>\r\n");
      out.write("   ");
      out.write("\r\n");
      out.write("   /* $(\"#deptno\").val('");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ param.deptno}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("'); */\r\n");
      out.write("   $(\"#deptno\").val(");
      out.print( pDeptno );
      out.write(");\r\n");
      out.write("</script>\r\n");
      out.write("<script>\r\n");
      out.write("   // 모두 선택 체크 박스 \r\n");
      out.write("   $(\"#ckbAll\").on(\"click\", function (event){\r\n");
      out.write("      $(\"table tbody tr\")\r\n");
      out.write("          .find(\"td:first-child :checkbox\")\r\n");
      out.write("          .prop(\"checked\", $(this).prop(\"checked\"));\r\n");
      out.write("   });\r\n");
      out.write("   \r\n");
      out.write("   // 각 사원 체크박스를 체크할 때 모두 선택 체크 처리.\r\n");
      out.write("   /*\r\n");
      out.write("   $(\":checkbox.all\").click(function(event) {\r\n");
      out.write("         $(\":checkbox:not(.all)\").prop(\"checked\", $(this).prop(\"checked\"));\r\n");
      out.write("\r\n");
      out.write("   })\r\n");
      out.write("   \r\n");
      out.write("      $(\":checkbox:not(.all)\").click(function(event) {\r\n");
      out.write("         let count = $(\":checkbox:not(.all)\").length;\r\n");
      out.write("         let checkedCount = $(\":checkbox:not(.all):checked\").length;\r\n");
      out.write("         $(\":checkbox.all\").prop(\"checked\", count == checkedCount );\r\n");
      out.write("      });\r\n");
      out.write("   */\r\n");
      out.write("   $(\"table tbody tr\")\r\n");
      out.write("   .find(\"td:first-child :checkbox\").on(\"click\", function (){\r\n");
      out.write("      let ck = $(\"tbody :checkbox\").length == $(\"tbody :checkbox:checked\").length;\r\n");
      out.write("      $(\"#ckbAll\").prop(\"checked\", ck );\r\n");
      out.write("   });\r\n");
      out.write("   \r\n");
      out.write("   // 10:02 수업시작~\r\n");
      out.write("   /* 풀이 1\r\n");
      out.write("   $(\"tfoot button\").on(\"click\", function (event){\r\n");
      out.write("      \r\n");
      out.write("      // ex01_ok.jsp?empnos=1111/2222/3333 \r\n");
      out.write("      \r\n");
      out.write("       let empnos = [];\r\n");
      out.write("      // 체크된 체크박스\r\n");
      out.write("      $(\"tbody :checkbox:checked\").each(function(i, element) { \r\n");
      out.write("       // DOM 탐색  \r\n");
      out.write("       // empno = element.parentElement.nextElementSibling.innerText;\r\n");
      out.write("       // data-empno=\"7569\"\r\n");
      out.write("          let empno = $(element).data(\"empno\");\r\n");
      out.write("       empnos.push(empno);\r\n");
      out.write("      }); \r\n");
      out.write("      location.href = \"ex01_ok.jsp?empnos=\" + empnos.join(\"/\"); \r\n");
      out.write("   });\r\n");
      out.write("   */\r\n");
      out.write("   \r\n");
      out.write("    // 풀이 2\r\n");
      out.write("   $(\"tfoot button\").on(\"click\", function (event){\r\n");
      out.write("      \r\n");
      out.write("      // ex01_ok.jsp?empno=1111&empno=2222&empno=3333  *** \r\n");
      out.write("      \r\n");
      out.write("       let empnos = []; \r\n");
      out.write("      $(\"tbody :checkbox:checked\").each(function(i, element) { \r\n");
      out.write("       \r\n");
      out.write("          let empno = $(element).data(\"empno\");\r\n");
      out.write("       empnos.push(empno);\r\n");
      out.write("      }); \r\n");
      out.write("      location.href = \"ex01_ok_02.jsp?empno=\" + empnos.join(\"&empno=\"); \r\n");
      out.write("   });\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" ");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
