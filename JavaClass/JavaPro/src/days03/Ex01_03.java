package days03;

import java.util.Scanner;

/**
 * @author geon
 * @date 2024. 1. 3. - 오후 12:08:56
 * @subject
 * @content
 */

// ctrl+ shift+ o 필요한 임포트 자동추가제거
public class Ex01_03 {
	public static void main(String[] args){
		String name;
		byte kor, eng, mat;
		short tot; //0~300
		double avg;

		Scanner scanner = new Scanner(System.in);

		//Scanner 구분자를 콤마(,) 사용하고 싶다. (검색) 홍길동,90,78,38
		// nextXXX() 메서드 사용
		System.out.print("이름_국어_영어_수학 입력?"); //_ 언더바는 공백을 뜻함
		name = scanner.next();//scanner.nextLine()
		kor = scanner.nextByte();
		eng = scanner.nextByte();
		mat = scanner.nextByte();
		//총점, 평균 평균 계산 코딩 추가
		//Type mismatch: cannot convert from int to short
		// 형변환 설명 아직x 일단은 해결만


		//강제형변환을 해야하는 첫번째 경우
		tot = (short)(kor + eng + mat); //int보다 작은 자료형은 연산할때 CPU가 int자료형으로 처리해서 연산함.
		avg = (double)tot /3;


		System.out.printf(
				"%s님은 국:%d영:%d수:%d 총점:%d 평균:%.2f 이다."
				, name, kor, eng, mat, tot, avg);

	}
}