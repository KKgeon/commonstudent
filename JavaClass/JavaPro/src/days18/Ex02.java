package days18;
//import java.lang.*; <- 컴파일할때 자동으로 추가된다
/**
 * @author geon
 * @date 2024. 1. 24. - 오전 10:27:04
 * @subject	java.lang 패키지 - 자바 가장 기본이 되는 클래스
 * @content	유용한 클래스 (java.util 패키지)
 * 			Object.equals() Overriding
 */
public class Ex02 {
	public static void main(String[] args) {
		// [java.lang.Onject 클래스]
		// 1. 모든 클래스의 최상위 부모클래스
		Item item1 = new Item(10);
		Item item2 = new Item(10);
		//객체 == 객체	아래 코딩의 경우 참조주소값을 비교한다.
		System.out.println(item1==item2);
		//Object.equals() 또한 참조주소값을 비교하는 메서드이다.
		System.out.println(item1.equals(item2));

		item2 = item1; //객체 복사
		System.out.println(item1==item2);
		System.out.println(item1.equals(item2));

	}//m
}//c


class Item extends Object{ //보이지 않지만 모든 클래스는 최상위 부모클래스를 참조하고있다
	int value;
	Item(int value) {
		this.value = value;
	}
	//다른 객체들을 비교할 때 value 값만 같으면 같다라고 처리하고싶을때.
	//					item1.equals(item2)
	@Override
	public boolean equals(Object obj) {
		//this.value == Item1.value;
		if (obj instanceof Item) {
			//다운캐스팅하기
			Item item2 = (Item) obj;
			if (this.value == item2.value) return true;
		}
		return false;
	}
	
}//c