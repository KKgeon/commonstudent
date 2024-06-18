package days26;

import java.io.File;

public class Ex02_02 {
	public static void main(String[] args) {
		//C:\E\Class\WorkSpace\JavaClass\javaPro 폴더
		String currentDirectory = System.getProperty("user.dir");
		//System.out.println(currentDirectory);
		File p = new File(currentDirectory);
		//f.isDirectory();//true
		//f.isFile();//false
		/*
		String [] list = p.list();//폴더 안에 어떤 파일이 있는지 목록으로 돌려주는 함수
		for (int i = 0; i < list.length; i++) {
			//System.out.println(list[i]);
			File c = new File(p, list[i]);
			System.out.printf("%s\t%s\t%d\n"
				, c.isFile()?"파일":"폴더"
				, c.getName()
				, c.length());
		}//for
		 */		
		System.out.println("-".repeat(50));

		File [] list = p.listFiles(); //파일 객체를 배열로 얻어오는 함수
		
		for (int i = 0; i < list.length; i++) {
			System.out.printf("%s\t%s\t%d\n"
					, list[i].isFile()?"파일":"[폴더]"
					, list[i].getName()
					, list[i].length());
		}//for

	}//m
}//c
