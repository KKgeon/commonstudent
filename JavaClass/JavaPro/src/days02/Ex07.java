package days02;

/**
 * @author geon
 * @date 2024. 1. 2. - 오후 2:50:50
 * @subject
 * @content
 */
public class Ex07 {

	public static void main(String[] args) {

		byte b = 10; // %d
		short s = 11; // %d
		int i = 12; // %d
		long l = 13; // %d


		//%d 출력서식 : 10진수 출력
		System.out.printf("b=%d, s=%d, i=%d, l=%d\n"
				,b, s, i, l);
		// %o 출력서식 : 8진수 출력
		System.out.printf("b=%o, s=%o, i=%o, l=%o\n"
				,b, s, i, l);
		// %x 출력서식 : 16진수 출력
		System.out.printf("b=%x, s=%x, i=%x, l=%x\n"
				, b, s, i, l);
	}

}
