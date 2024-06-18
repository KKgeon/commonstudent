package days26;

import java.io.FileInputStream;
import java.io.ObjectInputStream;

public class Ex04_02 {
	public static void main(String[] args) {

		String path = ".\\src\\days26\\Child.ser";
		try (FileInputStream fis = new FileInputStream(path);
				ObjectInputStream ois = new ObjectInputStream(fis)){

			
			Child c = (Child) ois.readObject();
			String name = c.name;
			int age = c.age;
			
			System.out.printf("name=%s, age=%d\n",name,age);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//m
}//c
