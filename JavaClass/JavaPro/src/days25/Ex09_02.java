package days25;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

public class Ex09_02 {
	public static void main(String[] args) {
		String name;
		int kor,eng,mat;
		int tot;
		double avg;
		boolean gender;


		//첫번째 학생의 정보를 student.txt파일로부터 읽어와서 출력


		String fileName = ".\\src\\days25\\student.txt";

		try (FileReader fr = new FileReader(fileName);
				BufferedReader br = new BufferedReader(fr)) {

			br.readLine();

			String data = br.readLine();

			String [] datas = data.split(",");
			name = datas[0];
			kor = Integer.parseInt(datas[1]);
			eng = Integer.parseInt(datas[2]);
			mat = Integer.parseInt(datas[3]);
			tot = Integer.parseInt(datas[4]);
			avg =Double.parseDouble(datas[5]);
			gender = Boolean.parseBoolean(datas[6]);


			System.out.printf("%s,%d,%d,%d,%d,%02f,%b\n", name,kor,eng,mat,tot,avg,gender);




		} catch (Exception e) {
			e.printStackTrace();
		}
	}//m

}//c
