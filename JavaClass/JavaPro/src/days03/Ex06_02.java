package days03;

/**
 * @author geon
 * @date 2024. 1. 3. - 오후 3:50:45
 * @subject
 * @content
 */
public class Ex06_02 {

	public static void main(String[] args) {
		// 증감연산자 		++	--
		// 복합대입연산자	+= -=
		int x = 10;
		/*
		//x++;	후위형증감연산자
		++x; //전위형증감연산자
		
		//전위형의 경우 계산이 끝나기 전에 증감이 적용된다
		//후위형의 경우 계산이 끝나고 나서 증감이 적용된다

		System.out.printf("> x=%d", x);

		 */
		
		
		int y = x++; // 후위형
		//int y = ++x;  // 전위형
		System.out.printf("> x=%d, y=%d\n", x, y);
		
		int n = 100;
		System.out.println( ++n == 100);
//		System.out.println( n++ == 100);
	}

}
