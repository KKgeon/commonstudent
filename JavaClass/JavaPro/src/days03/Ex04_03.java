package days03;

/**
 * @author geon
 * @date 2024. 1. 3. - 오후 12:39:39
 * @subject	[비교 연산자] 크다, 작다, 같거나 크다, 같거나 작다,
 * 						같다, 다르다.
 * @content	비교연산자의 처리결과는 항상 true / false (boolean)
 * 		[ instanceof 라는 비교연산자가 있다.]
 * 		클래스 수업때 객체를 비교할때 사용하는 연산자.
 */
public class Ex04_03 {

	public static void main(String[] args) {

		int i = 10, j = 3;
		System.out.println( i > j );//true
		System.out.println( i < j );//false
		System.out.println( i >= j );//true
		System.out.println( i <= j );//false


		// (주의할 점) 
//		System.out.println( i = j );//3 대입연산자이기때문에 t/f값이 안나옴
		System.out.println( i == j );//
		System.out.println( i != j );//
		//System.out.println( i =! j ); 
		// ! <-논리 연산자 중에 부정(not)연산자이기때문에 순서 헷갈리면 안됨
	}

}
