package days02;

/**
 * @author geon
 * @date 2024. 1. 2. - 오전 10:49:51
 * @subject
 * @content
 */
public class Ex03 {

	public static void main(String[] args) {
				// Alt + Shift + Y
		String name = "이창익";
		int age = 20;
		final double PI = 3.141592;
		char grade = 'A';
		
		System.out.printf("이름:%s, 나이:%d, PI:%f, 등급:%c\n", name, age, PI, grade);

		
		/*
		 * [ 식별자 명명 규칙]
		 * 1. 자바는 대소문자구분을 한다.
		 * 		String name;
		 * 		Sysout(Name); X
		 * 2. 키워드(예약어)를 사용X
		 * 		int char; X
		 * 3. $ _ 특수문자 사용 O 가능
		 * 		int $age, _age;
		 * 4. 숫자로 시작할 수 없다.
		 * 		int 1kor; X
		 * 		int kor1; O
		 */
		
		int kor1;
		//int 1kor; 얘는 숫자로시작해서안됨.
		
		
		int $age, a$ge;
		int _height, h_eight;
		
		//String first name; 식별자 명명할때 중간에 공백있으면 안됨
		//String first_name;
		//String FirstName;
		//int #age; X 샵은안됨
	}

}
