package days24;

import java.util.ArrayList;

public class Ex06_07 {
	public static void main(String[] args) {
		//제네릭 클래스
		//ArrayList<Integer> list = new ArrayList<Integer>();


		//일반 클래스
		ArrayList list = new ArrayList();


		Box05<String> box1 = new Box05<>();

		//Box<Object> bow = new Box05<>();
		Box05 box2 = new Box05();

		
		//원시타입과 제네릭타입 간의 형변환
		// - 경고만 발생시키고 자동으로 사용가능하더라
		// - <T>가 없으면 Object타입으로 컴파일시키더라~
		
	}//m
}//c
