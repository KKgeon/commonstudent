package days26;

import java.io.File;
import java.io.FilenameFilter;

public class Ex02_03 {
	public static void main(String[] args) {
		String pathname = ".\\src\\days26";
		//days26 폴더 안에 잇는 자바 파일(.java)만 출력하고싶다.
		//days26 폴더 안에 잇는 파일(.dat)만 출력하고싶다.
		File f = new File(pathname);

		/*
		File [] list = f.listFiles( new FilenameFilter() {
			@Override
			public boolean accept(File d, String n) {
				// 
				return n.endsWith(".dat");
			}
		});
		 */
		
		
		File [] list = f.listFiles((d,n) -> n.endsWith(".dat"));


		for (File c : list) {
			System.out.println(c.getName());
		}

		/* [1]
		File [] list = f.listFiles();
		for (int i = 0; i < list.length; i++) {
			if (list[i].isFile()) {
				String filename =  list[i].getName();
				int pos = filename.indexOf(".");
				String ext = filename.substring(pos);
				if (ext.equals(".java")) {
					System.out.println(filename);
				}
			}//if
		}//for
		 */

	}//m
}//c
