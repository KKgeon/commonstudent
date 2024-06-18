package days26;

import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.util.ArrayList;

public class Ex03_02 {
	public static void main(String[] args) {
		String name = ".\\src\\days26\\UserInfo.ser";

		try( FileInputStream fis = new FileInputStream(name);
				ObjectInputStream ois = new ObjectInputStream(fis);	) {

			UserInfo u1 = (UserInfo) ois.readObject();
			UserInfo u2 = (UserInfo) ois.readObject();
			ArrayList<UserInfo> list = (ArrayList<UserInfo>) ois.readObject();

			System.out.println( u1 );			
			System.out.println( u2 );
			System.out.println( list );

		} catch (Exception e) {
			e.printStackTrace();
		}

	}//m
}//c
