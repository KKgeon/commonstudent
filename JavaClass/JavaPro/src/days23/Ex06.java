package days23;

import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

public class Ex06 {
	public static void main(String[] args) {
		//List, Set
		//[	Map 인터페이스를 구현한 컬렉션 클래스	]

		/*
		 * 	1.	한쌍(key+value)으로 관리 == Entry로 관리
		 * 	2. 	key 중복 허용 X
		 *		value 중복 허용 O
		 *	3.	[Hash]Map		(신) - 사용권장
		 *		[Hash]table	(구)
		 *	4.	해싱(Hasing)?
		 *		-	해시함수를 이용해서 데이터를 해시 테이블에 저장하고 검색하는 기법
		 *
		 *		-	해시함수? 데이터가 저장되는 곳을 알려주는 함수
		 *					데이터를 빠르게 검색할 수 있다.
		 *
		 *		-	데이터저장(key+value) 키를 해시 함수에 넣으면
		 *			배열의 한 요소를 얻어오고 다시 그 곳에 연결된 링크드 데이터를 저장
		 *
		 *		-	해싱을 사용하기때문에 많은 양의 데이터를 검색하는 데에 뛰어난 성능
		 *
		 *
		 *			[해시함수]
		 *			[]
		 *			[]
		 *			[]
		 *			[]
		 *			[]
		 *			[]
		 */




		Hashtable<String, String> ht = new Hashtable<>();
		ht.put("admin", "관리자");
		ht.put("hong", "홍길동");
		ht.put("root", "관리자");

		System.out.println(ht);
		System.out.println(ht.size());

		/*
		//[1]
		Enumeration<String> en = ht.keys();
		while (en.hasMoreElements()) {
			String key = en.nextElement();
			System.out.println(key);
		}
		 */

		/*
		//[2] 모든 키 조회
		Set<String> keys = ht.keySet();
		Iterator<String> rs = keys.iterator();
		while (rs.hasNext()) {
			String key = rs.next();
			System.out.println(key);
			}
		 */

		/*
		//[3]모든키조회

		String value = ht.getOrDefault("kenik", "켄익");
		System.out.println(value);
		 */


		//모든밸류조회
		/*
		Collection<String> values = ht.values();
		Iterator<String> ir = values.iterator();
		while (ir.hasNext()) {
			String value = ir.next();
			System.out.println(value);
		}
		 */



		//	[문제]	park	키가 존재하는 지 확인한 후에
		//			park	박철로 엔트리를 추가하세요
		//


		dispHT(ht);

	}//m

	
	
	
	private static void dispHT(Hashtable<String, String> ht) {
		Set<Entry<String, String>> es	= ht.entrySet();
		Iterator<Entry<String, String>> ir =	es.iterator();
		while (ir.hasNext()) {
			Entry<String,String> entry = ir.next();
			String key = entry.getKey();
			String value = entry.getValue();
			System.out.printf("%s : %s\n", key, value);

		}

	}



	/*
	private static void dispHT(Hashtable<String, String> ht) {
		Set<String> keys = ht.keySet();
		Iterator<String> rs = keys.iterator();
		while (rs.hasNext()) {
			String key = rs.next();
			String value = ht.get(key);
			System.out.printf("%s : %s\n", key, value);

		}
	}
	 */
}//c
