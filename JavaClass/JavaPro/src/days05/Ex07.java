package days05;

/**
 * @author geon
 * @date 2024. 1. 5. - 오후 2:42:22
 * @subject if, switch, for, break
 * @content	while 조건반복문
 */
//		while (condition) {명령코딩;}
//			
//		
public class Ex07 {

	public static void main(String[] args) {
//		int i = 1, sum = 0;
//		while (i<=10) {
//			sum = sum + i;
//			System.out.printf("%d+", i);
//			i = i + 1;
//			System.out.printf("=%d\n", sum);
//		}
//														1번 코딩
		
		
		
		//2번코딩
		//
//		int i = 0, sum = 0;
//	      while ( i < 10 ) {  
//	         i++;  
//	         System.out.printf("%d+", i); 
//	         sum += i;  
//	         
//	      } // while
//	      System.out.printf("=%d\n", sum);

		//3번코딩
//		int i = 0, sum = 0;
//	      while ( ++i <= 10 ) {
//	         System.out.printf("%d+", i); 
//	         sum += i;   
//	         
//	      } // while
//	      System.out.printf("=%d\n", sum);
		
//		4번코딩
//		int i = 10, sum = 0;
//		while (i >= 1) {
//			sum += i;
//			System.out.printf("%d+", i);
//			i--;
//			
//		}
//		System.out.printf("=%d\n", sum);
//		
//		
		//5번코딩
		int i = 10, sum = 0;
		while (true) {	//무한루프
			if( i < 1 ) break;
			sum += i;
			System.out.printf("%d+", i);
			i--;
					}
		System.out.printf("=%d\n", sum);		
		
	



	}//main
}//class
