package days18;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;


/**
 * @author geon
 * @date 2024. 1. 24. - 오전 10:22:05
 * @subject try~resources문
 * @content
 */
public class Ex01_03 {
	public static void main(String[] args) {
		//FileReader/FileWriter 클래스 사용


		String fileName = "C:\\Setup.log";

		String line = null;
		int lineNumber = 0;
		try {
			FileReader fr = new FileReader(fileName );
			BufferedReader br = new BufferedReader(fr);
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
		} finally {
			//try~resources문에 의해서 자동으로 close(); 시킨다
		}


	}//m
}//c
