package days17;

/**
 * @author geon
 * @date 2024. 1. 23. - 오전 11:04:48
 * @subject	싱글톤(Singleton) 패턴
 * @content 장점, 단점
 * 			오직 1개의 객체를 생성해서 사용하는 패턴.
 */
public class Ex05 {
	public static void main(String[] args) {
		//A 작업자 BoardDAO 객체를 사용해서 DB처리(CRUD)
		//The constructor BoardDAO() is not visible
		BoardDAO dao1 = BoardDAO.getInstance();//new BoardDAO();
		System.out.print(dao1.hashCode() + " ");
		dao1.insert();
		//B 작업자			"
		BoardDAO dao2 = BoardDAO.getInstance();//new BoardDAO();
		System.out.print(dao2.hashCode() + " ");
		dao2.delete();
		//C 작업자			"
		BoardDAO dao3 = BoardDAO.getInstance();//new BoardDAO();
		System.out.print(dao3.hashCode() + " ");
		dao3.update();
		//D 작업자			"
		BoardDAO dao4 = BoardDAO.getInstance();//new BoardDAO();
		System.out.print(dao4.hashCode() + " ");
		dao4.select();

	}//m

}//c

//[Data Access Object] DAO
//DataBase <-> data CRUD
//싱글톤패턴
class BoardDAO{
	//생성자의 접근지정자를 public->private로 수정
	//해당 클래스 외에서는 생성자를 호출할 수 없기에 객체생성은 못한다
	private BoardDAO() {}

	private static BoardDAO boardDAO = null;
	//객체선언
	
	//synchronized 키워드는 동기화처리하고싶은 메서드에 붙인다.
	public synchronized static BoardDAO getInstance() {
		if (boardDAO==null) {
			boardDAO = new BoardDAO();
		}
		
		return boardDAO;
	}

	void insert() {
		System.out.println("추가");	
	}
	void update() {
		System.out.println("수정");	
	}
	void delete() {
		System.out.println("삭제");	
	}
	void select() {
		System.out.println("조회");	
	}

}

//생성자 프라이빗
//겟인스턴스만들기 퍼블릭으로
//자기자신을 저장할수잇는 boardDAO만들기
//getInstance메서드 만들어서 if문 넣고 리턴값돌리기

//동기화 -> 하나의 작업이 끝나야만 다음 작업을 하도록 하는것 ex)무전기
//비동기화 -> 동시에 작업하는것 ex)전화기