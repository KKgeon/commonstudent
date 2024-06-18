package days06.mvc.persistence;

import java.sql.SQLException;
import java.util.ArrayList;

import days06.mvc.domain.BoardDTO;
import days06.mvc.domain.proDTO; 

public interface proDAO {
	
	// 1. 게시글 목록 조회 + 페이징 처리 X
	ArrayList<proDTO> select() throws SQLException;
	// 1-2. 게시글 목록 조회 + 페이징 처리 O
	ArrayList<proDTO> select(int currentPage, int numberPerPage) throws SQLException;
	
	// 총 페이지 수 
	int getTotalPages( int numberPerPage ) throws SQLException;
	// 검색된  총 페이지 수   
	int getTotalPages(int numberPerPage
			, int searchCondition, String searchWord) throws SQLException;
	
}





