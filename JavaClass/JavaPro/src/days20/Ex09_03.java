package days20;

import java.text.MessageFormat;
import java.text.ParseException;

public class Ex09_03 {
	public static void main(String[] args) throws ParseException {
		String output = "이름:권맑음, 나이:26살, 성별:남자, 키:178.67 입니다.";

		String pattern = "이름:{0}, 나이:{1}, 성별:{2}, 키:{3} 입니다.";
		MessageFormat mf = new MessageFormat(pattern);
		
		Object [] obj = mf.parse(output);
		for (Object o : obj) {
			System.out.println(o);
		}
	}//m
}//c
