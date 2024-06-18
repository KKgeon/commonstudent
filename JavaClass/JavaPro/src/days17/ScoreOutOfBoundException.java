package days17;
// 사용자 정의한 예외클래스
//	ㄴ checked 예외
//	ㄴ [unchecked 예외]


public class ScoreOutOfBoundException extends RuntimeException {

	//예외 코드 번호 : 필드
	private final int ERROR_CODE;

	public int getERROR_CODE() {
		return ERROR_CODE;
	}


	public ScoreOutOfBoundException(String messege) {
		this(1000, messege);
	}


	public ScoreOutOfBoundException(int error_code, String messege) {
		super(messege);
		this.ERROR_CODE = error_code;
	}
}//c
