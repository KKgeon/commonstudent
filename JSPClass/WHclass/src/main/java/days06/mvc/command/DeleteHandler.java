package days06.mvc.command;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import days06.mvc.persistence.BoardDAOImpl;

public class DeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String currentpage = request.getParameter("currentpage");
		String searchCondition = request.getParameter("searchCondition");
		String searchWord = request.getParameter("searchWord");
		if (searchWord==null) searchWord="";
		String method = request.getMethod();
	    
	    
		if (method.equals("GET")) {
			long pseq  = Long.parseLong(request.getParameter("seq"));
			return "/days06/board/delete.jsp"; // + cp,cs,sw
		} else {
			request.setCharacterEncoding("UTF-8");

			//삭제할글번호
			long pseq  = Long.parseLong(request.getParameter("seq"));
			String ppwd = request.getParameter("pwd");
			


			
			Connection conn = ConnectionProvider.getConnection();
			BoardDAOImpl dao = new BoardDAOImpl(conn);
			int rowCount = 0;
			String originalPwd;
			String location = "/jspPro/board/";

			try {
				originalPwd = dao.getOriginalPwd(pseq);
				
				if (originalPwd.equals(ppwd)) {
					rowCount=dao.delete(pseq);
					location += "list.do?currentpage="+currentpage+
			                  "&searchCondition="+searchCondition+
			                  "&searchWord="+ URLEncoder.encode(searchWord, "UTF-8") +"&delete=success";
				}else {
//					location +="delete.htm?seq=" + pseq + "&delete=fail";			
					location +="view.do?seq=" + pseq + "&delete=fail";			
					
					}
			} catch (SQLException e) { 
				System.out.println("> DeleteHandler.doPost() Exception...");
				e.printStackTrace();
			}

			conn.close();

			// 포워딩, [ 리다이렉트 ]

			response.sendRedirect(location);

			
		}//else
		
		return null;
	}//process

}//interface
