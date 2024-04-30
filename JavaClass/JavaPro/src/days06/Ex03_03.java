package days06;

import java.io.IOException;

public class Ex03_03 {

	public static void main(String[] args) throws IOException {

		char one;
		int code;


		//			read(): 표준 입력장치의 입력스트림으로부터
		//					다음 byte를 읽어서
		//					0~255까지의 int 정수를 반환하는 
		//					함수(메서드)
		//					스트림의 끝을 만나면 -1 값을 반환..
		System.out.print("> 한 문자 입력 ? ");
		code = System.in.read();
		one = (char) code;
		System.out.printf("%c\n", one);
		/*
		System.in.read();
		System.in.read();
		 */

		System.in.skip(System.in.available());// 이 코딩 할일 앞으로 많음. 유의하기.
												
		System.out.print("> 한 문자 입력 ? ");
		code = System.in.read();
		one = (char) code;
		System.out.printf("%c\n", one);


		System.out.println("end");
	}//m

}//c
