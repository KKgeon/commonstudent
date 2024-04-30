package days06.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import days06.mvc.domain.BoardDTO;
import days06.mvc.persistence.BoardDAOImpl;


public class EditHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();

		if (method.equals("GET")) {//Edit.java doGet()복사+붙이기
			long pseq = Long.parseLong(request.getParameter("seq"));


			// [해당 글번호의 내용 가져오기 작업]
			Connection conn = ConnectionProvider.getConnection();
			BoardDAOImpl dao = new BoardDAOImpl(conn);
			BoardDTO dto = null;

			try {
				dto = dao.view(pseq);
			} catch (SQLException e) { 
				System.out.println("> EditHandler.doGet() Exception...");
				e.printStackTrace();
			}
			conn.close();

			// 1.
			request.setAttribute("dto", dto);

			return "/days06/board/edit.jsp";
		} else {//Edit.java doPost() 복사+붙이기
			request.setCharacterEncoding("UTF-8");

			long pseq  = Long.parseLong(request.getParameter("seq"));

			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int tag = Integer.parseInt( request.getParameter("tag") );

			Connection conn = ConnectionProvider.getConnection();
			BoardDAOImpl dao = new BoardDAOImpl(conn);
			int rowCount = 0;
			/*
			BoardDTO dto = 
					new BoardDTO(pseq, null, pwd, email, title, null, 0, tag, content);
			 */
			BoardDTO dto = BoardDTO.builder()
					.seq(pseq)
					.pwd(pwd)
					.email(email)
					.title(title)
					.content(content)
					.tag(tag)
					.build();

			try {
				rowCount = dao.update(dto);
			} catch (SQLException e) { 
				System.out.println("> EditHandler.doPost() Exception...");
				e.printStackTrace();
			}

			conn.close();

			// 포워딩, [ 리다이렉트 ]
			String location = "/jspPro/board/view.do?seq=" +pseq;
			location += rowCount == 1 ? "&edit=success":"&edit=fail";
			response.sendRedirect(location);
		}

		return null;
	}

}
