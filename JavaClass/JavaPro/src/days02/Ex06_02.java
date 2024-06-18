package days02;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Ex06_02 {

	public static void main(String[] args) throws NumberFormatException, IOException {
		//1.나이를 저장할 변수 선언
		byte age;
		//2. br 객체 선언
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));



		System.out.print(">나이 입력?");
		//				Type mismatch: cannot convert from String to byte
		//				String -> byte
		/*
				String strAge = br.readLine()
				age = Byte.parseByte();
		 */
		age = Byte.parseByte( br.readLine());
		System.out.printf(">나이 : %d\n", age);


		// "23" -> 숫자(정수) byte 형 변환

		//
		//
		//		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		//
		//		System.out.print("> 나이 입력 ?");
		//		byte age;
		//
		//		age = br.readLine();
		//
		//		System.out.printf("> 나이 : %s\n", age);
		//	}
		//}

	}

} 