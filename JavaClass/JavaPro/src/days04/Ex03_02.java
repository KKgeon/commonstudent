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
public class Ex03_02 {

	public static void main(String[] args) throws IOException {
		String name;
		byte kor, eng, mat;
		short tot;
		double avg;

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		System.out.print(" 이름, 국어, 영어, 수학 입력?");
		String data = br.readLine(); 
		String regex = "\\s*,\\s*";
		String [] datas = data.split(regex);
		
		name = datas[0];
		kor = Byte.parseByte(datas[1]);
		eng = Byte.parseByte(datas[2]);
		mat = Byte.parseByte(datas[3]);
		
	



	
		tot = (short)(kor + eng + mat);
		avg = (double)tot /3;


		System.out.printf(
				"%s님은 국:%d\s영:%d\s수:%d 총점:%d 평균:%.2f 이다."
				, name, kor, eng, mat, tot, avg);


	}

}
