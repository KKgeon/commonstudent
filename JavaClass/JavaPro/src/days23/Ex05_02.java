package days23;

import java.util.SortedSet;
import java.util.TreeSet;

public class Ex05_02 {
	public static void main(String[] args) {

		TreeSet<String> ts = new TreeSet<>();
		ts.add("abc");      ts.add("alien");      ts.add("bat");
		ts.add("car");      ts.add("Car");      ts.add("disc");
		ts.add("dance");      ts.add("dzzz");      ts.add("dzzzz");
		ts.add("elephant");      ts.add("elevator");      ts.add("fan");
		ts.add("flower");

		
		System.out.println(ts);
		
		
		SortedSet<String> ss = ts.subSet("a", "d");
		System.out.println(ss);
		
		System.out.println(ts.subSet("c", "dzzz"));
	}//m
}//c
