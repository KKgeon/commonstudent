package days04;

/**
 * @author geon
 * @date 2024. 1. 4. - 오후 2:00:53
 * @subject	[제어문]
 * @content	1. 정의: 프로그램의 실행 순서를 제어하는 문
 * 			2. 제어문의 종류
 * 				1) 조건문 : if문 if, if~else, if~ elseif, elsif~if 
 * 				2) 분기문 : switch문
 * 				3) 반복문 : for문, foreach문
 * 				4) 조건반복문 : while문, do~while문
 * 				5) 기타 : break문, continue문
 */			
public class Ex05 {
	public static void main(String[] args) {
		
		// 1) 조건문 中 if문 예제.
		//		if문의 선언 형식
		
		/*
		
			condition : 조건식, (참/거짓 판가름할 수 있는 식)
			 			변수( boolean )
		if (condition <- 참/거짓) {
		
			
			
		}
		if문은 condition 조건이 참인 경우이만 {}코딩블럭을 실행한다.
		*/
		
		boolean b = false;
		
//		if(b==false) {
//		if(b) {
		if(!b) {
			System.out.println("1");
			}
		System.out.println(" end");
		
		
		
	}

}
