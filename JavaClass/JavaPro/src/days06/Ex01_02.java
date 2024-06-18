package days06;

public class Ex01_02 {
	public static void main(String[] args) {
			// 입력받은 
		char one = '한';
		//래퍼클래스 중 is로 시작하는것은 true false 값을 구분하는 클래스이다.
		if (Character.isDefined( one )) {
			System.out.println("숫자 맞음");
		} else {
			System.out.println("숫자 아님");
			
		}
	}
}
