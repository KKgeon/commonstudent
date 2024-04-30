package days25;

import java.io.FileInputStream;
import java.io.FileOutputStream;

public class Ex06 {
	public static void main(String[] args) {
		//실행파일 복사 -> 바이트(이진)스트림
		//FileInputStream / FileOutputStream
		String sourceFile = "C:\\Program Files (x86)\\Kakao\\KakaoTalk\\EULA_ko.txt";
		String codeFile = "C:\\Users\\user\\Documents\\kakao";

		//>복사 처리 시간 105645200(ns)
		//>복사 처리 시간 1087100(ns)
		fileCopyBinaryStream(sourceFile, codeFile);
	}//m

	private static void fileCopyBinaryStream(String sourceFile, String codeFile) {
		long start = System.nanoTime();
		
		try (FileInputStream fis = new FileInputStream(sourceFile);
				FileOutputStream fos = new FileOutputStream(codeFile);) {

			int code;
			while ((code = fis.read() )!= -1) {
				 System.out.printf("%08d\n"
		                  , Integer.parseInt(Integer.toBinaryString(code)));
				fos.write(code);

			}//while
			fos.flush();
			System.out.println("파일 복사 완료!!!");
			
			long end = System.nanoTime();
			System.out.printf(">복사 처리 시간 %d(ns)\n", end-start);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//fileCopyBinaryStream
}//c
