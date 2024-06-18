package days03;

/**
 * @author geon
 * @date 2024. 1. 3. - 오후 2:39:31
 * @subject	비트논리연산자
 * @content	& ^ | ~
 */
public class Ex04_05 {

	public static void main(String[] args) {
		//0000 0011
		/*

		System.out.println(Integer.toBinaryString(3));

		System.out.printf("%08d\n", Integer.parseInt(Integer.toBinaryString(3)));		
		 */

		//		int no = 15;
		//		System.out.printf("%08d\n", no);
		//			00000011
		System.out.println(3);
		//			00000001
		System.out.println(1);
		// & 비트 논리 AND 연산자
		// 상응되는 비트 값을 비교
		//	00000011
		//	00000001
		
		// 1 & 1	1
		// 1 & 0	0
		// 0 & 1	0
		// 0 & 0	0
		// 1이 일치해야 1을 출력
		System.out.println( 3 & 1 ); //1
		// 1 | 1	1
		// 1 | 0	1
		// 0 | 1	1
		// 0 | 0	1
		// 총 비트 중 1의 갯수만큼 출력
		System.out.println( 3 | 1 ); //3
		//  ^ XOR 연산자
		//  eXclusive OR 연산자
		//	배타적인
		// 1 ^ 1	0
		// 1 ^ 0	1
		// 0 ^ 1	1
		// 0 ^ 0	0
		System.out.println( 3 ^ 1 ); //2
		
		
		
		// ~ 틸드 연산자
		// 1=>0
		// 0=>1
		
		System.out.println(~3); // 0000 0011 => 1111 1100 = -4
		// 1111 1100 	2의 보수법
		//
		// 1111 1011
		// 0000 0100
		//			-4
		
		
		
	}

}
