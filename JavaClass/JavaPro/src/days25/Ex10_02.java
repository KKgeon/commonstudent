
package days25;

import java.io.DataInputStream;
import java.io.FileInputStream;

public class Ex10_02 {
	public static void main(String[] args) {
		String name;
		int kor,eng,mat;
		int tot;
		double avg;
		boolean gender;


		//첫번째 학생의 정보를 student.txt파일로부터 읽어와서 출력


		String fileName = ".\\src\\days25\\student.dat";

		try (FileInputStream fis = new FileInputStream(fileName);
				DataInputStream dis = new DataInputStream(fis)) {

			name=dis.readUTF();
			kor= dis.readInt();
			eng= dis.readInt();
			mat= dis.readInt();
			tot= dis.readInt();
			avg= dis.readDouble();
			gender = dis.readBoolean();
			System.out.printf("%s,%d,%d,%d,%d,%02f,%b\n", name,kor,eng,mat,tot,avg,gender);

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("end");
	}//m

}//c
