package days18;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;

/**
 * @author geon
 * @date 2024. 1. 24. - 오후 3:18:31
 * @subject
 * @content
 */
public class Ex05 {

	public static void main(String[] args) {

		//String dir = "E:\\Claass\\Workspace\\JavaClass\\javaPro\\src\\days18";
		String key = "user.dir";//user.dir이 뭔지 모르지만 일단 암기

		String userDir = System.getProperty(key);
		//		System.out.println(userDir);

		String readPath = userDir.concat("\\src\\days18\\SS20.txt");
		String writePath = userDir.concat("\\src\\days18\\SS20.html");
		//		System.out.println(path);


		String [] names = new String[15];
		String name = null;
		int index = 0;
		try (FileReader fr = new FileReader(readPath);//읽을파일경로
				BufferedReader br = new BufferedReader(fr);
				FileWriter fw = new FileWriter(writePath);
				){	//저장할파일경로 

			while ( ( name = br.readLine() ) != null ) {
				names[index++] = name;
			}//while
			String namesJoin = "<ol><li>" + String.join("</li><li>", names) + "</li></ol>";
			System.out.println(namesJoin);
			fw.write(namesJoin);

		} catch (Exception e) {
			e.printStackTrace();
		}//try/catch
		System.out.println("end");
		

		
	}//m

}//c
