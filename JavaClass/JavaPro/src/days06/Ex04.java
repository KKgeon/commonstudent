package days06;

/**
 * @author geon
 * @date 2024. 1. 8. - 오후 2:44:12
 * @subject
 * @content
 */
public class Ex04 {

	public static void main(String[] args) {

		for (int i = 'A'; i <= 'Z'; i++) {
			System.out.printf("%c(%03d)", (char)i, i);
			if ( i % 10 == 4) System.out.println();

		}//for

		for (int i = 'a'; i <= 'z'; i++) {
			System.out.printf("%c(%03d)", (char)i, i);
			if ( i % 10 == 0) System.out.println();

		}//for

	}//m

}//c
