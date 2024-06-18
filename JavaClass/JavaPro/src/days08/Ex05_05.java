package days08;

import java.util.Random;

public class Ex05_05 {
	public static void main(String[] args) {
		//람다와 스트림. 우린 시간없어서 설명 못하니까 알아서 공부해야함.
		//젼내효율적인거같음 잘쓰면고수
		new Random()//랜덤발생
		.ints(1,46)	//1~45 정수 중에
		.distinct() //중복제거
		.limit(6)	//몇개까지 제한
		.sorted()	//정렬
		.forEach(System.out::println);//출력 ::는 참조하는코딩
		
		
		//로또 발생 람다와스트림 이용하면 한줄에 가능.
		//그게먼대,,
		
	}//m
}//c
