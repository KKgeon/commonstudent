package days25;

import java.io.DataOutputStream;
import java.io.FileOutputStream;

public class Ex10 {
	public static void main(String[] args) {
		String name = "김길동";
		int kor=92,eng=90,mat=80;
		int tot=kor+eng+mat;
		double avg=(double)tot/3;
		boolean gender=false;


		//한 학생의 정보를 student.txt파일에 저장

		//문자스트림 + 파일

		String fileName = ".\\src\\days25\\student.dat";

		try (FileOutputStream fos = new FileOutputStream(fileName);
				DataOutputStream dos = new DataOutputStream(fos)) {

			dos.writeUTF(name);
			dos.writeInt(kor);
			dos.writeInt(eng);
			dos.writeInt(mat);
			dos.writeInt(tot);
			dos.writeDouble(avg);
			dos.writeBoolean(gender);
			
			dos.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("end");
	}//m
}
