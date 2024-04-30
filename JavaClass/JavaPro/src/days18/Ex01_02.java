package days18;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 * @author geon
 * @date 2024. 1. 24. - 오전 9:40:21
 * @subject	한 문자가 아니라 한 라인씩 처리
 * @content	버퍼 기능 O 버퍼란? 임시기억공간 
 * 
 * [A][B[][][\r][\n][A][B[][][\r][\n]
 * 
 *  BuffueredReader 클래스 (보조스트림)
 *  
 *  		라인번호를 붙이기
 */
public class Ex01_02 {
	public static void main(String[] args) {
		//FileReader/FileWriter 클래스 사용
		FileReader fr = null;
		BufferedReader br = null;

		String fileName = "C:\\Setup.log";

		String line = null;
		int lineNumber = 0;
		try {
			fr = new FileReader(fileName );
			br = new BufferedReader(fr);
			//
			/*
			while ((one = fr.read()) != -1) {
				System.out.printf("%c", (char)one);
			}
			 */
			while ((line = br.readLine()) != null) {
				System.out.printf("%d: %s\n", ++lineNumber, line);
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {//다중캐치문
			e.printStackTrace();
		} finally {//예외가 발생하든 안하든 finally는 실행된다.
			if (fr != null) {
				try {
					fr.close();
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		}
	}//m
}//c
