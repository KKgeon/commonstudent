package days24;

import java.util.ArrayList;
import java.util.Iterator;

public class Ex06 {
	public static void main(String[] args) {
		/*
		 * [제네릭 (Generics)]
		 * 1. 	jdk1.5-제네릭
		 * 		jdk1.8-람다식
		 * 2. 제네릭?
		 * 	[다양한 타입]의 객체를 다루는 메서드, 컬렉션 클래스에서 컴파일시에 타입을 체크해주는 기능
		 * 3. 객체의 타입을 컴파일시에 체크하는 이유
		 * 	1) 객체의 타입 안정성을 높인다.
		 * 	2) 형변환의 번거로움이 줄어든다. -> 코드가 간결해진다
		 * 	(제네릭의 장점)
		 */
		/*
		ArrayList list = new ArrayList();
		list.add(100);
		list.add(3.14);
		list.add('A');
		list.add("홍길동");
		list.add(true);
		list.add(new MemberVO());

		int i = list.get(0);



		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));

		}
		 */


		//[첫번째 장점] - 타입 안정성
		// 제네릭 + 클래스 = 제네릭 클래스
		ArrayList<String> list = new ArrayList();
		list.add("홍길동");
		list.add("김길동");
		list.add("박길동");
		//컴파일러가 타입 체크 :	list.add(100);
		
		//두번째 장점 - 형변환이 필요없어서 코드가 간결해진다.
		String name = list.get(0);
		name = list.get(1);
		name = list.get(2);
		
		Iterator<String> ir = list.iterator();
		while (ir.hasNext()) {
			name = ir.next();
			System.out.println(name);
		}


	}//m
}//c
