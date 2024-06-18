package days11;

import java.io.IOException;
import java.util.Arrays;
import java.util.Scanner;

public class Ex02 {
	public static void main(String[] args) throws IOException {
		int [] m = new int [3];

		m = appendArray(m);
		dispArray(m);
	}//m

	private static int[] appendArray(int[] m) throws IOException {
		Scanner sc = new Scanner(System.in);
		int index = 0;
		char con = 'y';
		do {
			if (index == m.length) {
				int [] temp = new int [m.length];
				for (int i = 0; i < m.length; i++) {
					temp[i]=m[i];
					}
			}




			System.out.printf("> m[%d] 입력 ? ", index);
			m[index++] = sc.nextInt();

			System.out.printf("> 입력 계속 ? ");
			con = (char) System.in.read();
			System.in.skip(System.in.available());

		} while (Character.toUpperCase(con) == 'Y');
		System.out.println();
		return m;

	}

	private static void dispArray(int [] m) {
		System.out.println(" > m " + Arrays.toString(m));

	}
}//c
