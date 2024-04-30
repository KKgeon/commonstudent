package days14;

/**
 * @author geon
 * @date 2024. 1. 18. - 오전 10:25:11
 * @subject Tv클래스 선언 -> 객체 생성 후 사용
 * @content
 */
public class Ex02 {
	public static void main(String[] args) {
		//지역변수
		//int i = 100;
		
		// 지역변수, 참조변수, 배열명
		//int [] m;
		
		
		//[자바의 자료형]
		//1) 기본형 : 8가지
		//2) 참조형 : 배열, 클래스, 인터페이스
		
		//지역변수, 참조변수, 객체명
		//객체 tv1 선언
		Tv tv1 = null;
		
		// 객체를 생성하는 코딩, 인스턴스화
		tv1 = new Tv();
		
		//필드가 초기화 X

		/*
		System.out.println(tv1.color);
		System.out.println(tv1.channel);
		System.out.println(tv1.power);
		*/
		
		// 객체명.필드명으로 필드에 접근할 수 있다.
		// 배열명[index] 를 통해 배열값에 접근할수있는 것 처럼
		
		tv1.power();
		System.out.println("Tv : "+(tv1.power?"ON":"OFF"));
		
		tv1.channelUp();
		tv1.channelUp();
		tv1.channelUp();
		System.out.println("현재 채널 : " + tv1.channel);
		tv1.power();
		System.out.println("Tv : "+(tv1.power?"ON":"OFF"));
		System.out.println("end");
		
	}//m
}//c
