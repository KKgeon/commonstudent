package days05;

import java.sql.Connection;

import com.util.DBConn;

import days05.board.controller.BoardController;
import days05.board.persistence.BoardDAO;
import days05.board.persistence.BoardDAOImpl;
import days05.board.service.BoardService;

public class Ex01 {
	public static void main(String[] args) {
		//[1] 게시판 패키지 선언
		//days05
		//	board
		//		ㄴ domain
		//			BoardDTO.java
		//		ㄴ persistence
		//			BoardDAO.java 인터페이스
		//			BoardDAOImpl
		//		ㄴ service
		//		ㄴ controller
	//[2]
	/*
	 * 
  create table cstVSBoard (
  seq int identity (1, 1) not null primary key clustered,
  writer varchar (20) not null ,
  pwd varchar (20) not null ,
  email varchar (100) null ,
  title varchar (200) not null ,
  writedate smalldatetime not null default (getdate()),
  readed int not null default (0),
  mode tinyint not null ,
  content text null
)
	 */
	
		
		
		/*									BoardDTO
		 * 사용자(user) -> BoardController.java -> BoardService.java
		 * 				*[게시글 쓰기] : 작성		ㄴ  게시글쓰기()	BoardDTO
		 * 				수정							1) DB처리			-> BoardDAOImpl.java	-> 오라클 DB서버 연동
		 * 				삭제							2) 로그기록				ㄴ intsert(dto)		
		 * 				보기							3)  ? 
		 * 				상세보기						1+2+3) 논리적인처리작업
		 * 				BoardDAO 인터페이스
		 * 					ㄴ 
		 * 
		 * 				메뉴선택						커밋, 롤백(트랜잭션처리)
		 * 
		 * 
		 */
		
		// 목록,쓰기,삭제,수정,[검색]
		//BoardDAO, BoardDAOImpl, BoardService, BoardController
		Connection conn = DBConn.getConnection();
		BoardDAO dao = new BoardDAOImpl(conn);
		BoardService service = new BoardService(dao);
		BoardController controller = new BoardController(service);
		
		controller.boardStart();
		
	}//m
}//c
