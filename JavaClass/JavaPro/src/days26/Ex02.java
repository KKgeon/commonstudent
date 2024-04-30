package days26;

import java.io.File;
import java.io.IOException;

public class Ex02 {
	public static void main(String[] args) throws IOException {
		/*
		 * [File 클래스]
		 * - 파일 + 디렉토리
		 *  
		 */
		
		String pathname = ".\\src\\days26\\Ex01.java";
		//String pathname = ".\\src\\days26";
		
		File f = new File(pathname);
		
		System.out.println(f.getParent());//부모 ".\src\days26"
		System.out.println(f.getParentFile());// 부모 File
		
		System.out.println(f.getPath());			//경로
		//.\src\days26\Ex01.java
		System.out.println(f.getAbsolutePath());	//절대경로
		//C:\E\Class\WorkSpace\JavaClass\javaPro\.\src\days26\Ex01.java
		System.out.println(f.getCanonicalPath());   //표준경로
		//C:\E\Class\WorkSpace\JavaClass\javaPro\src\days26\Ex01.java
		
		System.out.println(f.isFile());//true 파일이니?
		System.out.println(f.isDirectory());//false 폴더니?
		System.out.println(f.length());//2495 byte 용량
		System.out.println(f.exists());//true 실제존재하는가?
		
		//OS에서 사용하는 경로 구분자		;
		System.out.println(f.pathSeparator);
		//OS에서 사용하는 이름 구분자		\
		System.out.println(f.separator);
		//전체 경로 속에서 파일 이름만을 얻어오는 메서드 		Ex01.java
		
		String fileName = f.getName();
		System.out.println(fileName);
		
		//Ex01.java
		//확장자 (.java)를 제외한 파일명 'Ex01'
		//확장자만 ...
		
		int pos = fileName.indexOf(".");
		
		System.out.println(fileName.substring(0, pos));//Ex01
		System.out.println(fileName.substring(pos));//.java

	}//m
}//c

