package days04;

/**
 * @author geon
 * @date 2024. 1. 4. - 오후 4:23:31
 * @subject
 * @content
 */
public class Ex06_03 {
//조건문은 아무리 길어도 상관없다 참인지 거짓인지만 구분되면 된다..
	public static void main(String[] args) {
			int sum = 0;
			int i = 1;
		for (;;) {
			if( i>10) break;
			System.out.printf("%d+", i++);
			//sum = sum + i;			
		}
		//Unreachable code
		System.out.printf("=%d", sum);
	}

}
