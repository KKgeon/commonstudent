package days17;

/**
 * @author geon
 * @date 2024. 1. 23. - 오전 9:34:58
 * @subject	final 키워드 설명
 * @content
 */
public class Ex01 {
	public static void main(String[] args) {

	}//m
}//c
/*
class Parent{
	
	void test1() {}
	
	//메서드 앞에 final이 붙었을때의 기능.
	//상속된 후 자식 클래스에서 재정의 할 수 없는 메서드
	final void test2() {}

}

class child extends Parent{
	@Override
	void test1() {System.out.println("재정의 test1");}
	@Override
	void test2() {System.out.println("재정의 test2");}

}

*/


//최종(마지막) 클래스
//더이상 이 클래스의 자식 클래스를 만들 수 없다
//어제 배운내용.

final class FinalTest{
	// 2.인스턴스 변수(상수)
	//public final int MAX_SIZE = 10; //명시적 초기화
	public final int MAX_SIZE;
	// 3. 클래스 + 상수 변수
	public final static int MIN_SIZE = 1;

	public FinalTest(int maxSize) {//생성자초기화
		this.MAX_SIZE = maxSize;
	}


	void test1() {
		// 1.지역변수 앞의 final은 (상수)
		final double PI = 3.14;
		test2(100);
	}
	//매개변수, 지역변수
	void test2(final int size) {
		//size = 200;
	}
}//c

