package days26;

import java.io.File;

public class Ex02_05 {
	public static void main(String[] args) {
		String pathname = ".\\src\\days26";
		//days26 폴더 안에 upload 폴더 생성.
		
		File upload = new File(pathname, "upload");
		if (!upload.exists()) {
			//upload.mkdir(); // mk == make
			System.out.println(upload.mkdir());
			
			// mkdirs() : [days26] 다른 서브 디렉토리도 모두 만들겠다.
			
		}else {
			//폴더가 존재하면 삭제해보자.
			System.out.println(upload.delete());
			//deleteOnExit() : 응용 프로그램이 종료될 때 파일 삭제
		}
		
	}//m
}//c
