package days06.mvc.command;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import days06.mvc.domain.proDTO;
import days06.mvc.persistence.proDAOImpl;


//list.do(글목록)-> [M]VC
public class ListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		System.out.println("> ListHandler.process()....");

		
		Connection conn = ConnectionProvider.getConnection();
		proDAOImpl dao = new proDAOImpl(conn);
		ArrayList<proDTO> list = dao.select();
		
		conn.close();

		// 1.
		request.setAttribute("list", list);


		return "/days06/board/list.jsp";
	}

}
