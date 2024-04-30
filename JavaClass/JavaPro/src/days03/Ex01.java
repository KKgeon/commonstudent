package days03;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Ex01 {public static void main(String[] args) throws IOException {
	String name;
	byte kor, eng, mat;
	short tot; //0~300
	double avg;

	BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

	// 홍길동 89 78 56
	System.out.print("1. 이름 입력?");
	name = br.readLine();

	System.out.print("2. 국어 입력?");
	kor = Byte.parseByte( br.readLine() );

	System.out.print("3. 영어 입력?");
	eng = Byte.parseByte( br.readLine() );

	System.out.print("4. 수학 입력?");
	mat = Byte.parseByte( br.readLine() );
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