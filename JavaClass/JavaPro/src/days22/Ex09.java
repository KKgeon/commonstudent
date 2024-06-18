package days22;

import java.util.HashSet;

/**
 * @author geon
 * @date 2024. 1. 30. - 오후 2:19:06
 * @subject
 * @content
 */
public class Ex09 {
	public static void main(String[] args) {
		//Collection
		//	List 	- ArrayList, Vector, Stack, Queue(LinkedList), 
		//	Set 	- 순서유지X 중복허용X
		//				HashSet 컬렉션 클래스
		//				만약) Set 인데 순서가 유지되길 바란다면 -> LinkedHashSet 컬렉션을 사용한다.	
		//													순서유지O중복허용X
		//HashSet hs = new HashSet(16, 0.75);
		HashSet hs = new HashSet();
		//hs.add();		hs.addAll();
		hs.add(9);
		hs.add(1);
		hs.add(15);
		hs.add(10);
		System.out.println(hs);
		
		
		hs.add(1);// 2) 중복 허용 X
		System.out.println(hs);
		

	}//m
}//c
