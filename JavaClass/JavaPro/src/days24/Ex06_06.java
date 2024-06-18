package days24;

import java.util.ArrayList;

/**
 * @author geon
 * @date 2024. 2. 1. - 오후 3:22:17
 * @subject [와일드 카드]
 * @content
 * 	static Juice makeJuice(FruitBox<? extends Fruit> box) { 이해하기.
 */
public class Ex06_06 {
	public static void main(String[] args) {

		FruitBox<Fruit> fruitBox = new FruitBox();
		FruitBox<Apple> appleBox = new FruitBox();
		FruitBox<Grape> grapeBox = new FruitBox();

		Juice juice = Juicer.makeJuice(fruitBox);
		juice = Juicer.makeJuice(appleBox);
		//juice = Juicer.makeJuice(grapeBox);
		juice = Juicer.<Grape>makeJuice(grapeBox);

		//		ArrayList<Fruit> list = new  
	}//m
}//c


class Fruit extends Object {
	public String toString() {
		return "Fruit";

	}
}

class Apple extends Fruit{
	public String toString() {
		return "Fruit";

	}
}

class Grape extends Fruit{
	public String toString() {
		return "Fruit";

	}
}
class Toy {
	public String toString() {
		return "Toy";

	}
}


class Box05<T>{
	ArrayList<T> list = new ArrayList<T>();
	void add(T item) {	this.list.add(item);	}
	int size() { return this.list.size();}
	T get(int i) {return this.list.get(i);}
	public String toString() {return this.list.toString();}

}


class FruitBox<T extends Fruit> extends Box05<T>{

}
//쥬스 클래스
class Juice{

}
//[쥬스만드는기계]
//과일(사과,포도) 재료 -> Juice 생산
class Juicer{
	/*
	static Juice makeJuice(FruitBox<? extends Fruit> box) {
		return new Juice();
	}
	 */
	//위의 일반 static 메서드를 제네릭 메서드로 변경
	//[제네릭 메서드]
	//	ㄴ 메서드의 선언부에 제네릭 타입이 선언된 메서드를 제네릭 메서드라고 한다.
	//	ㄴ 선언 혀식
	// 	접근지정자 static <T> 리턴자료형 제네릭메서드명 (매개변수){}
	static <T extends Fruit> Juice makeJuice(FruitBox<T> box) {
		return new Juice();
	}
}
/*
	static Juice makeJuice(FruitBox<Fruit> box) {
		return new Juice();
	}

	static Juice makeJuice(FruitBox<Apple> box) {
		return new Juice();
	}
	static Juice makeJuice(FruitBox<Grape> box) {
		return new Juice();
	}
 */
/*
	//메서드 오버로딩 조건 ... 확인
	// 이유 ? 제네릭 타입의 매개변수는 오버로딩이 성립되지않는다.

	// 그래서 해결책으로 고안된 것이 와일드카드( 기호 =  ?) 사용한다
									? = 모든 타입 == Object와 같은 의미

									<?> == <? extend Object> 모든 타입, 타입 제한 없음,
									<? extend T> T와 그 자손만 가능
									<? super T> T와 그 조상만 가능



 */	