package days06;

import java.io.IOException;

public class Ex03_04 {

	public static void main(String[] args) throws IOException {

		char one, con = 'y';
		int code;

		
		do {
			System.out.print("> 한 문자 입력 ? ");
			code = System.in.read();
			one = (char) code;
			System.out.printf("%c\n", one);
			
			System.in.skip(System.in.available());
			
			System.out.println("\n\n 계속할거냐? ");// 계속할건지 물어보는 작업 앞으로도 나오니 익숙해지기.
			con = (char) System.in.read();
			System.in.skip(System.in.available());
			//System.in.read();를 사용하여 입력받을경우 엔터값을 받을때마다 스킵코딩으로 제거해줘야한다.
		} while (Character.toUpperCase(con) == 'Y');
			


		System.out.println("end");
	}//m

}//c
