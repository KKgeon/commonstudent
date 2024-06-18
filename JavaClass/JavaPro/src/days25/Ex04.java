package days25;

import java.io.File;
import java.io.FileReader;
import java.util.Date;

public class Ex04 {
	public static void main(String[] args) {

		String parent = ".\\src\\days25";
		String child = "Ex01.java";

		//[파일 정보]
		//File 클래스 - 파일을 다루는 여러 기능(메서드)이 구현된 클래스
		//							생성,파일명변경,삭제,정보등등

		String path = parent + "\\" + child;
		
		File openFile = new File(path); 
		
		System.out.println(openFile.length() + "(bytes)");
		
		//1706836111121
		
		long lm = openFile.lastModified();
		Date d=new Date(lm);
		System.out.println(d.toLocaleString());
		
		
		//File + 읽기 + 문자 스트림 == FileReader

		try (FileReader fr = new FileReader(path);) {

			int code;
			while ((code = fr.read() )!= -1) {
				System.out.printf("%c", (char)code);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}//m
}//c
