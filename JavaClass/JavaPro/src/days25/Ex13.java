package days25;

import java.io.IOException;
import java.io.RandomAccessFile;

/**
 * @author geon
 * @date 2024. 2. 2. - 오후 4:13:54
 * @subject PipedReader.PipedWriter
 * @content	ㄴ 스레디 근에 데이터를 입출력 할 때 사용하는 스트림
 * 			RandomAcessFile
 * 			ㄴ 파일의 어느 위치에나 읽기/쓰기가 가능한 장점이 잇는 스트림
 * 			ㄴ getFilePoint() 파일포인트
 * 			ㄴ seek(위치) 이동시키는 메서드
 * 			ㄴ readXXX(), writeXXX()
 */
public class Ex13 {
	public static void main(String[] args) throws IOException {
		String s =  "I Love normal Java";
		String q = "javabook";

		String name = ".\\src\\days25\\random.txt";
		String mode = "rw";
		//[1]
		try(RandomAccessFile raf = new RandomAccessFile(name, mode)) {

			long fp = raf.getFilePointer();
			System.out.println("현재 파일 포인트 : " + fp);
			raf.writeBytes(s);

		} catch (Exception e) {
			e.printStackTrace();
		}//try

		// 일시정지 + 엔터 계속.
		System.out.println("> 엔터치면 진행한다.");
		System.in.read(); 
		System.in.skip( System.in.available() ); // 13,10 제거

		//[2]
		try(RandomAccessFile raf = new RandomAccessFile(name, mode)) {
			raf.seek(7);//위치 이동
			raf.writeBytes(q);

		} catch (Exception e) {
			e.printStackTrace();
		}//try

		// 일시정지 + 엔터 계속.
		System.out.println("> 엔터치면 진행한다.");
		System.in.read();
		System.in.skip( System.in.available() ); // 13,10 제거
		
		
		//[3]
		try(RandomAccessFile raf = new RandomAccessFile(name, mode)) {
			raf.seek(2);//위치 이동
			String line = raf.readLine();
			System.out.println(line);
			
		} catch (Exception e) {
			e.printStackTrace();
		}//try
		System.out.println("end");
	}//m
}//c
