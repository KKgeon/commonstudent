package days24;

import java.util.ArrayList;

/**
 * @author geon
 * @date 2024. 2. 1. - 오후 2:42:18
 * @subject	[제네릭클래스의 객체 생성과 사용]
 * @content		과일 {사과 포도}
 */
public class Ex06_04 {
	public static void main(String[] args) {
		//Box03<Fruit> fruitBox = new Box03<>();
		//Type mismatch: cannot convert from Box03<Grape> to Box03<Apple>
		//Box03<Apple >box1=new Box03<Grape>();X
		//Box03<Apple >box1=new Box03<Fruit>();X
		//Box03<Fruit >box1=new Box03<Grape>();X
		/*
		Box03<Fruit> fruitBox = new Box03<>();
		fruitBox.add(new Fruit());
		fruitBox.add(new Apple());//사과객체
		fruitBox.add(new Grape());//포도객체
		 */
		//The method add(Fruit) in the type Box03<Fruit> is not applicable for the arguments (Toy)
		//		fruitBox.add(new Toy()); //장난감 객체 X


	}//m
}//c
/*
class Fruit{
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


class Box03<T>{
	ArrayList<T> list = new ArrayList<T>();
	void add(T item) {	this.list.add(item);	}
	int size() { return this.list.size();}
	T get(int i) {return this.list.get(i);}
	public String toString() {return this.list.toString();}

}
 */