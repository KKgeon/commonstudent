package days04;

/**
 * @author geon
 * @date 2024. 1. 4. - 오전 10:47:49
 * @subject
 * @content
 */
public class Ex02 {
	public static void main(String[] args) {
		//String[] args	:	[] 인덱스(index) 연산자
		// 1. 한 학생의 국어 점수를 저장할 kor 변수 선언
		//		int kor;
		// 2. 10명 학생의 국어 점수를 저장할 변수 선언
		//		int s1, s2, s3, s4, s5, s6, s7, s8, s9, s10;


		// 배열 정의?
		//  ㄴ동일한 자료형을 메모리 상에 연속적으로 놓이게 한 것.
		// 배열 장점
		//	ㄴ 관리가 용이하다.

		// 배열 선언 및 생성 형식
		//	ㄴ 자료형 [] 배열명;
		//int [] kors;	인덱스연산자를 앞에붙여도 int kors [];  뒤에붙어도 된다	
		
		//int 배열 kors 라고 부르기.
		int [] kors = new int[3];
		// 배열 생성
		//	new 자료형[배열의크기];
		System.out.printf(">배열 크기? : %d\n", kors.length);
		//1번학생의 국어점수 :90
		//int kor = 90;
		//첫 기억공간 : 0번째 요소	배열명[0] kor[0]
		//두 기억공간 : 1번째 요소

		//만약 첫번째 학생에게 90점을 주고싶다면?
		// kors[0] = 90;

		kors[0] = 90;
		kors[1] = 78;
		kors[2] = 89;

		System.out.println(kors[0]);
		System.out.println(kors[1]);
		System.out.println(kors[2]);
		//index 첨자값
		//loweBound 아랫첨자값	0
		//upperBound 윗첨자값	2 = 배열크기 -1 = 배열.length -1
		//java.lang.ArrayIndexOutOfBoundsException 배열값이 3이라서 3
		//kors[3] = 100;
		kors = null;
		//java.lang.NullPointerException
		kors[0] = 90;
	}
}
