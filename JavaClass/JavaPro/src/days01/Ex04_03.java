package days01;

/**
 * @author geon
 * @date 2023. 12. 29. - 오후 4:27:09
 * @subject
 * @content
 */
public class Ex04_03 {
	
	public static void main(String[] args) {
		
		//표준 출력
		System.out.println("강명건");
		System.out.println("이시은");
		System.out.println("박우현");
		System.out.println("류영은");

		
		// 알트 쉬프트 A
		System.out.print("강명건");
		System.out.println();//줄바꿈(개행)
		System.out.print("이시은" + '\n');// \n = 개행
		System.out.print("박우현\n");
		System.out.print("류영은");
	
		//				  format=형식 즉 출력형식을 뜻함
		//				  arhs == arguments 인자, 매개변수, 파라미터
		//System.out.printf(null, args);
		// 자바 함수(메서드) 제대로 사용하려면 반드시 3가지 파악
		//1. 함수의 역할(기능) 알아야한다
		//2. 매개변수
		//3. 반환값(리턴자료)
	}

}
