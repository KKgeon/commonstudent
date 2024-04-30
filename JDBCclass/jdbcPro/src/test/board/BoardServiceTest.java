package test.board;

import java.sql.Connection;
import java.util.ArrayList;

import org.junit.jupiter.api.Test;

import com.util.DBConn;

import days05.board.domain.BoardDTO;
import days05.board.persistence.BoardDAO;
import days05.board.persistence.BoardDAOImpl;
import days05.board.service.BoardService;

class BoardServiceTest {
	@Test
	   void testService() {
	      Connection conn = DBConn.getConnection();
	      BoardDAO dao = new BoardDAOImpl(conn);
	      BoardService service = new BoardService(dao);
	      try {
	         ArrayList<BoardDTO> list = service.selectService();
	         System.out.println("게시글 수  :" + list.size());
	      } catch (Exception e ) {
	         e.printStackTrace();
	      } finally {
	         DBConn.close();
	      }
	   }


	/*
	@Test
	void testInsertService() {
		BoardDTO dto = BoardDTO.builder()
				.title("예비군 훈련")
				.writer("김영진")
				.pwd("1234")
				.email("kim@sist.com")
				.tag(0)
				.content("결석~")
				.build();


		Connection conn = DBConn.getConnection();
		BoardDAO dao = new BoardDAOImpl(conn);
		BoardService service = new BoardService(dao);

		int rowCount = 0;
		try {
			rowCount = service.insertService(dto);
			if (rowCount == 1) {
				System.out.println("게시글 작성 완료");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close();
		}

		System.out.println("end");
	}

	 */
}
