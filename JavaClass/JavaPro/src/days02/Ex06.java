package days02;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * @author geon
 * @date 2024. 1. 2. - 오후 12:30:48
 * @subject  
 * @content  키보드(표준입력장치)로부터 이름을 입력받아서 출력.
 * 
 * 		키보드-> System.in -> 이진 -> 텍스트 변환 -> 문자열
 * 
 */
public class Ex06 {

	public static void main(String[] args) throws IOException {
		
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("> 이름 입력 ?");
		String name = "강명건";
		
		
//		Unhandled exception type IOException
		name = br.readLine();
		
		System.out.printf("> 이름 : %s\n", name);

	}
}
