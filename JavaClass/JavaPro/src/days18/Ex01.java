package days18;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 * @author geon
 * @date 2024. 1. 24. - 오전 9:40:21
 * @subject	어제복습
 * @content	파일읽기작업
 */
public class Ex01 {
	public static void main(String[] args) {
		//FileReader/FileWriter 클래스 사용
		FileReader reader = null;

		String fileName = "C:\\Setup.log";
		int one = -1;
		try {
			reader = new FileReader(fileName );
			//
			
			while ((one = reader.read()) != -1) {
				System.out.printf("%c", (char)one);
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {//다중캐치문
			e.printStackTrace();
		} finally {//예외가 발생하든 안하든 finally는 실행된다.
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		}
	}//m
}//c
