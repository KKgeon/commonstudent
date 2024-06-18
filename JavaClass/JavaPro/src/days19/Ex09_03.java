package days19;

import java.io.FileReader;
import java.util.Arrays;

public class Ex09_03 {
	public static void main(String[] args) {
		// days18.Ex01.java 자바파일 안에 있는 
		//대문자 소문자 숫자가 총 몇개인지 배열에 저장 후 ### 막대그래프 그리기?
		//
		//
		//A~Z 26문자
		int [][] counts = new int [2] ['Z'-'A' +1];


		String fileName = "\\src\\days18\\Ex01.java";


		String key = "user.dir";
		String userDir = System.getProperty(key);

		String path = String.format( "%s%s", userDir, fileName);


		try(FileReader fr = new FileReader(path);	){
			int code;
			char one;
			//EndOfFile == EOF
			//read(); EOF -1 리턴
			while ((code = fr.read()) != -1) {
				one = (char)code;
				//one = Character.toUpperCase(one);
				if (Character.isUpperCase(one)) {
					counts[0][one - 'A']++;
				}else if (Character.isLowerCase(one)) {
					counts[1][one - 'a']++;

				}

			}//while

			System.out.println(Arrays.toString(counts));

			for (int i = 0; i < counts.length; i++) {//행
				System.out.println(i==0?"[대문자출력]":"[소문자출력]");
				for (int j = 0; j < counts[i].length; j++) {

					System.out.printf("'%c'  %s(%d)\n"
							,i==0?'A'+j:'a'+j 
									, "#".repeat(counts[i][j]), counts[i][j]);

				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}//m
}//c
