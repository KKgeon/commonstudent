package days02;

import java.util.Calendar;

/**
 * @author geon
 * @date 2024. 1. 2. - 오후 3:04:33
 * @subject
 * @content
 */
public class Ex07_02 {

	public static void main(String[] args) {
		int i =10;
		System.out.printf("%d\t%o\t%x\t%X\n",i,i,i,i);
		System.out.printf("%1$d\t%1$o\t%1$x\t%1$X\n",i);
		System.out.printf("%1$d\t%1$#o\t%1$#x\t%1$#X\n",i);
		
		// 날짜 클래스 
		Calendar c = Calendar.getInstance();
		System.out.printf("%1$tY - %1$tm - %1$te \n",c);
		
		//출력서식 사용할 때 형식(문법)
		//%[argument_index$][flags][width][.precision]conversion
		boolean gender = true;
		System.out.printf("%b \n", gender);
		
		int tot = 277;
		double avg = 92.33333333333;
		
		System.out.printf("총점 : [%10d] \n", tot);
		System.out.printf("총점 : [%-10d] \n", tot);

		System.out.printf("평균 : [%10.2f] \n", avg);
		
		int money = 123456;
		System.out.printf("머니 : [%,d] \n", money);
		
		int no = 15;
		// 15를 0015로 출력하고싶을때에는?
		System.out.printf("no : [%04d] \n", no);
	}
}
