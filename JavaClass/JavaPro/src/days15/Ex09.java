package days15;

/**
 * @author geon
 * @date 2024. 1. 19. - 오후 4:12:14
 * @subject
 * @content
 */
public class Ex09 {

	//멤버변수(필드) 선언

	//1) 인스턴스변수      
	String name = "홍길동"; //명시적초기화
	int age;
	boolean gender = true;//명시적초기화

	//2) 클래스(static)변수
	static double rate = 0.09;//명시적초기화		이 수업 이전에 초기화하던 방식이 명시적 초기화임

	static{
		//[클래스 초기화 블럭]
		// 클래스 변수를 초기화 하기 위한 블럭.
		// 객체 생성과 상관없이 프로그램이 시작할 때 
		// 한 번 static 초기화 블럭은 실행된다.
		rate = 0.07;
		
		//인스턴스 변수 초기화 X
		System.out.println("클래스 초기화 블럭 호출됨.");
	}


	//[생성자]
	{
		//초기화 블럭
		//오버로딩된 생성자에서 중복되는 초기화 코딩이 있다면
		//그 중복되는 초기화 코딩을 인스턴스 초기화 블럭으로 따로 선언할 때 사용하는 블럭
		this.name = "익명";
		System.out.println("인스턴스 초기화 블럭 호출됨.");
	}
	Ex09(){
		//this.name = "익명";
		System.out.println("디폴트 생성자 호출됨.");

	}

	Ex09(int age){
		this.age = age;

	}
	Ex09(int age, boolean gender){
//		this.name = "익명";
		this.age = age;
		this.gender = gender;



	}

	public static void main(String[] args) {


		Ex09 obj1 = new Ex09();
		Ex09 obj2 = new Ex09(20);
		System.out.println(obj1.name);//익명

		System.out.println(Ex09.rate);
		//[ 변수의 초기화 ]

		/*
		 * 1. 지역변수 : 반드시 초기화해야 사용할 수 있다.
		 * 
		 * 
		 * 
		 * 2. 인스턴스변수
		 * 3. 클래스(static)변수
		 * 
		 * [멤버 변수 초기화 방법]
		 * 1. 명시적 초기화 
		 * 2. 생성자 초기화
		 * 3. 초기화 블럭 
		 * 		ㄴ 인스턴스 초기화 블럭
		 * 		ㄴ 클래스(static) 초기화 블럭
		 */
	}//m
}//c
