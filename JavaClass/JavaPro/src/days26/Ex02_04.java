package days26;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

public class Ex02_04 {
	public static void main(String[] args) {
		String pathname = ".\\src\\days25";
		String keyword = "source";

		File parent = new File(pathname);
		File [] list = parent.listFiles((dir, name) -> name.endsWith(".java"));


		File child = null;
		int lineNumber = 1;
		String line = null;
		for (int i = 0; i < list.length; i++) {
			child = list[i];
			lineNumber = 1;
			String filename = child.getName();
			System.out.printf("-----%s-----\n", filename);


			try (FileReader fr = new FileReader(child);
					BufferedReader br = new BufferedReader(fr)) {
				while ((line = br.readLine())!=null ) {
					if (line.contains(keyword)) {
						line.replaceAll(keyword, "[" + keyword + "]");
							System.out.printf("%d: %s\n", lineNumber, line);
					}//if
					lineNumber++;
				}//while

			} catch (Exception e) {
				e.printStackTrace();
			}
		}




	}//m
}//c
