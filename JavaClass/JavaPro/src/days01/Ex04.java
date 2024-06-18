package days01;

/**
 * @author geon
 * @date 2023. 12. 29. - 오후 4:04:47
 * @subject
 * @content 이름, 나이를 저장할 변수를 선언하고
 * 			출력하는 코딩.
 */
public class Ex04 {
	
	public static void main(String[] args) {
		//1. 이름을 저장할 변수 선언
		// 문자열 String 실수형 Double 정수형 int
			String name= "이시은";
		//2. 나이를 저장할 변수 선언 "28" , 28
			int age=27;	
		// 복사 : 컨트롤 알트 방향키
		//3. 이름/나이 출력
		//3-2. 출력형식 : 이름은 "이시은"이고 나이는 27이다.
			//String literal is not properly closed by a double-quote
			System.out.println("이름은\"" + name 
					+ "\"이고, 나이는" + age + "살이다.");
			System.out.println(age);
	}//main

}//class
