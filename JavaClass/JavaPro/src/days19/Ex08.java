package days19;

import java.io.IOException;
import java.util.Arrays;
import java.util.Objects;
import java.util.Random;

import days15.Point;
import lombok.ToString;

public class Ex08 {
	public static void main(String[] args) {
		//Arrays 클래스 -> 배열 래퍼클래스	toString(); sort(); binarySearch();
		//Object 클래스 : 모든 메서드가 static이다. Objects.메서드()
		//객체의 비교 또는 null체크에 유용

		Point p1 = null;



		// p1 객체생성 유무 체크
		/*		
		if (p1==null) {

		}
		if (p1!=null) {

		}
		 */
		//if (Objects.isNull(p1)) { //p1이 null 일 때 true 반환	}


		/*
		if (!Objects.nonNull(p1)) { //p1이 null이 아닐 때 true 반환

		}
		 */


		/*
		if (p1==null) {
			new IOException("예외 메시지..");
		}
		Point pCopy = p1;
		 */
		//		Point pCopy = Objects.requireNonNull(p1, "예외메세지~");

		//	if (p1 != null && p1.equals(pCopy)) 
		//	if (Objects.equals(p1, pCopy)) ;



		System.out.println("-".repeat(30));


		Random rnd = new Random();
		System.out.println(rnd.nextInt());	//-21억~ 21억
		System.out.println(rnd.nextInt(10));	//0<=   <10
		System.out.println(rnd.nextBoolean());	// true/false
		//		rnd.nextXXX()


	}//m
}//c
