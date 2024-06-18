package days21;

import java.util.ArrayList;
import java.util.Iterator;

public class Ex12_02 {
	public static void main(String[] args) {

		//[ArrayList 컬렉션 클래스]
		// <E>제네릭
		ArrayList list = new ArrayList(3);
		list.add("주강민");
		list.add("정하영");
		list.add("임경재");

		System.out.println(list);
		System.out.println(list.size());

		list.add("헝길떵");
		System.out.println(list);

		System.out.println(list.contains("정하영"));//true
		System.out.println(list.indexOf("정하영"));//1



		list.add(2, "권맑음");
		System.out.println(list);
		int index = -1;

		if ((index = list.indexOf("임경재")) != -1) {
			list.remove(index);
		}

		System.out.println(list);

		//"주강민" -> "주강미" 수정
		if ((index = list.indexOf("주강민")) != -1) {
			/*
			list.remove(index);
			list.add(index, "주강미");
			 */
			list.set(index, "주강미");

		}

		System.out.println(list);

		/*
		System.out.println(list.isEmpty());//false
		list.clear();
		System.out.println(list.isEmpty());//true
		 */

		//모든 요소를 출력...
		//get(index)
		//		System.out.println(list.get(0));
		//		System.out.println(list.get(1));
		//		System.out.println(list.get(2));
		//		System.out.println(list.get(3));


		//		for (int i = 0; i < list.size(); i++) {
		//			System.out.println(list.get(i));
		//		}

		//요소를 출력(가져올때는)iterator 반복자
		//요소를 순차적으로 처리할 수 있는 반복자 : iterator
		Iterator ir =  list.iterator();
		while (ir.hasNext()) { //hasNext() 요소를 가지고있니? true, false
			String name = (String) ir.next(); //next() 요소를 얻어온다.
			System.out.println(name);
		}
		
		//ArrayList 메서드
		// 1) add()
		// 2) set()
		// 3) contains()
		// 4) indexOf()
		// 5) clear()
		// 6) remove()
		// 7) iterator()
		// 8) isEmpty()
		// 9) it. hasNext()/ next()
		// 10)
		

	}//m
}//c
