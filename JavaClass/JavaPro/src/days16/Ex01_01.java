package days16;

import javax.xml.stream.util.StreamReaderDelegate;

public class Ex01_01 {
	public static void main(String[] args) {
		String n = "keNik";   
		String m= "kKnie";   

		n = n.toUpperCase().chars().sorted().collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append).toString();


	}//m
}//c
