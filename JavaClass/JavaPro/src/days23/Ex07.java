package days23;

import java.io.FileReader;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

public class Ex07 {
	public static void main(String[] args) {
		// A-Z   a-z  0-9   days19.Ex09_04.java
		// #####
		// ########
		// HashMap<읽어온한문자, 갯수>
		HashMap<Character, Integer> hm =new HashMap<>();
		/*
		for (int i = 'A'; i <='Z' ; i++) {
			hm.put((char)i, 0);
		}
		for (int i = 'a'; i <='z' ; i++) {
			hm.put((char)i, 0);
		}
		for (int i = '0'; i <='9' ; i++) {
			hm.put((char)i, 0);
		}
		*/
		for (int i = '0'; i <='z'; i++) { 
			if( Character.isDigit(i) || Character.isAlphabetic(i)  )
				hm.put((char)i, 0); 
		}
		
		// 
		String fileName = "\\src\\days18\\Ex01.java";		
		String dir = "user.dir";
		String userDir = System.getProperty(dir);		
		String path = String.format("%s%s", userDir, fileName);
		
		try (FileReader fr = new FileReader(path); ){

			int code ;
			char one ;
			// read(): EOF   -1 반환
			while( (code = fr.read() ) != -1 ) {
				one = (char)code;  // Ex01.java   
				
				if(  hm.containsKey(one) ) {
					int count = hm.get(one);
					hm.put(one, count+1);
				}
				
			} // while
			

		} catch (Exception e) {
			e.printStackTrace();
		} // try
		
		
		// [출력코딩]
		// 'l': ######################(22)
		Set<Entry<Character, Integer>> es = hm.entrySet();
		Iterator<Entry<Character, Integer>>  ir =  es.iterator();
		while (ir.hasNext()) {
			Entry<Character, Integer> entry = ir.next();
			char key =  entry.getKey();
			int value = entry.getValue();
			System.out.printf("'%c': %s(%d)\n"
					,  key, "#".repeat(value), value );
		}
		
	}//m

}//c
