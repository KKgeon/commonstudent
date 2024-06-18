package days03;

/**
 * @author geon
 * @date 2024. 1. 3. - 오후 3:36:17
 * @subject	[단항연산자] ~ ! (cast)
 * @content				-(뺄셈말고 음수를 나타내는) +(덧셈말고 양수를 나타내는)
 * 						--	++ 증감연산자 : 어떤 값을 1 감소 혹은 증가시키는 연산자
 */
public class Ex06 {

	public static void main(String[] args) {
		//[문제] 어떤 기억 공간의 값을 1증가 시키는 코딩
		//을 하세요
		// [답] n=n+1 또는 n+=1
		//
		int n =10;
		System.out.printf("n = %d\n", n);
		
//		n = 11;
//		n = n + 1;	복합대입연산자 +=
		
		n += 1;
		System.out.printf("n = %d\n", n);
		
		
		
		/*
		System.out.println(-3);	//단항연산자
		System.out.println(5-3);//이항연산자(뺼셈)

		System.out.println(+3);	//단항연산자(양수)
		System.out.println(5+3);//이항연산자(덧셈)
		 */
	}

}
