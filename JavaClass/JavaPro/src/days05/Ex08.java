package days05;

/**
 * @author geon
 * @date 2024. 1. 5. - 오후 4:25:59
 * @subject	if, switch, for, while, do~while
 * @content	break
 * 
 * 			[foreach문 == 확장for문]
 */
public class Ex08 {
	public static void main(String[] args) {
		int [] m = new int [10];

		//m배열의 각 요소에 0~100사이의
		// 임의의 정수를 채워넣자
		// 0 <- (int) (Math.random() * 101) < 101


		for (int i = 0; i < m.length; i++) {
			m[i] = (int) (Math.random() * 101);
			System.out.printf("[%d]", m[i]);
		}
		int sum = 0;
		for (int n : m) {
			System.out.println(n);
			sum =+ n;
			
		}
		
		
//		for (자료형 변수명 : 배열 또는 컬렉션) {
//			
//		}

		 
			
		
		
	}//main
}//class
