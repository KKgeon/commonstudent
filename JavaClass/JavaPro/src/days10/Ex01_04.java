package days10;

public class Ex01_04 {
	public static void main(String[] args) {
		String s1 = "admin";
		s1 += "...";
		System.out.println(s1);
		
		StringBuilder sb = new StringBuilder("admin");
		sb.append("...");
		
		System.out.println(sb.toString());
		System.out.println(sb);
		
		System.out.println(sb.reverse());
	}
}
