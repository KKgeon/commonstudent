package days04;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * @author geon
 * @date 2024. 1. 4. - 오전 11:45:27
 * @subject	이름, 국, 영, 수 한번에 입력받아서
 * @content	총,평
 * 			BufferedReader 사용한 예제 [내일 복습문제로 나온다]
 * 
 * 			배열 사용
 */
public class Ex03 {

	public static void main(String[] args) throws IOException {
		String name;
		byte kor, eng, mat;
		short tot; //0~300
		double avg;

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		System.out.print(" 이름, 국어, 영어, 수학 입력?");
		String data = br.readLine(); //출력방식 : "홍길동,89,78,56"
		// 콤마를 구분자로 data 문자열을 잘라내기 => "홍길동" "89" "78" "56"
		// 리턴타입은 String  //String.format()
		// 리턴타입은 boolean //String.equals(비교할문자열)
		// String [] String.split() <= 구분자를 잘라내는 메서드
		String regex = ",";
		String [] datas = data.split(regex);
		
		name = datas[0].trim(); //"홍길동"
		kor = Byte.parseByte(datas[1].trim()); //"89"
		eng = Byte.parseByte(datas[2].trim()); //"78"
		mat = Byte.parseByte(datas[3].trim()); //"56"
		
		
		/*
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
		*/



		//강제형변환을 해야하는 첫번째 경우
		tot = (short)(kor + eng + mat); //int보다 작은 자료형은 연산할때 CPU가 int자료형으로 처리해서 연산함.
		avg = (double)tot /3;


		System.out.printf(
				"%s님은 국:%d\s영:%d\s수:%d 총점:%d 평균:%.2f 이다."
				, name, kor, eng, mat, tot, avg);


	}

}
