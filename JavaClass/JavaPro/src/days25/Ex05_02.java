package days25;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

public class Ex05_02 {
	public static void main(String[] args) {
		//버퍼 기능 있는 보조스트림을 사용해서 파일 복사
		String sourceFile = ".\\src\\days25\\Ex01.java";
		String codeFile = ".\\src\\days25\\Ex01_Copy.java";

		//>복사 처리 시간 105645200(ns)
		//>복사 처리 시간 1087100(ns)
		fileCopyTextStream(sourceFile, codeFile);



	}//m

	private static void fileCopyTextStream(String sourceFile, String codeFile) {

		long start = System.nanoTime();

		final int BUFFER_SIZE = 1024;
		try (FileReader fr = new FileReader(sourceFile);
				FileWriter fw = new FileWriter(codeFile);
				BufferedReader br = new BufferedReader(fr, BUFFER_SIZE);
				BufferedWriter bw = new BufferedWriter(fw, BUFFER_SIZE);) {
			/*
			int code;
			while ((code = fr.read() )!= -1) {
				System.out.printf("%c", (char)code);
				fw.write(code);
				//fw.flush();
			}//while
			fw.flush();
			 */

			/*
			// 한 라인 단위로 처리..
			String line = null;
			while ((line= br.readLine()) != null) {
				bw.write(line);

			}
			 */
			
			//1035
			//1024
			
			//	11
			char [] cbuf = new char[BUFFER_SIZE];
			int readCharNumber;
			while (  (readCharNumber=br.read(cbuf))  != -1) {
				bw.write(cbuf, 0, readCharNumber);
			}
			System.out.println("파일 복사 완료!!!");

			long end = System.nanoTime();
			System.out.printf(">복사 처리 시간 %d(ns)\n", end-start);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}//c
