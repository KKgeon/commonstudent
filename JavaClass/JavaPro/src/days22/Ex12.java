package days22;

import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.ToString;

public class Ex12 {
	public static void main(String[] args) {
		// 

		Person3 p1 = new Person3("111111-1111111", "권맑음", 35);
		System.out.println(p1.hashCode());
		//System.out.println(p1);
		Set<Person3> s = new LinkedHashSet<Person3>();

		s.add(p1);
		s.add(new Person3("222222-2222222", "홍길동", 20));
		s.add(new Person3("333333-3333333", "김길동", 21));

		//System.out.println(s.size());
		//주민등록번호가 같으면 같은 Person 객체로 인식해서 
		//LinkedHashSet 추가X
		//방법? hashCode(), equals() 오버라이딩...

		Person3 p4 = new Person3("111111-1111111", "유진", 25);
		System.out.println(p4.hashCode());
		s.add(p4);

		Iterator<Person3> ir = s.iterator();
		while (ir.hasNext()) {
			Person3 p = ir.next();
			System.out.println(p);
		}

	}//m
}//c
@NoArgsConstructor
@AllArgsConstructor
@ToString
class Person3 {
	String rrn;
	String name;
	int age;
	@Override
	public int hashCode() {

		return this.rrn.hashCode();
	}
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Person3) {
			Person3 p = (Person3)obj;

			return this.rrn.equals( p.rrn);
		}//if
		return false;
	}//eq

}//c