package days18;

public class Ex04_02 {

	public static void main(String[] args) {
		//String todo = "TODO Auto-generated method Auto stub";




		//		System.out.println(todo.codePointAt(0)); 'T'에 해당되는 코드값 출력해주는 스트링메서드 84

		//		todo.equals(""); 				true/false		boolean
		//		todo.compareTo("");				양수/음수/0		int
		//		todo.compareToIgnoreCase("");	양수/음수/0		int			대소문자를 구분하지않고

		/*
		System.out.println("ABC".compareToIgnoreCase("AbC"));	//0
		System.out.println("ABC".compareTo("AcC"));				//-33
		System.out.println("CBC".compareTo("AcC"));				//2
		 */

		//todo.endsWith(suffix);	//접미사
		//todo.startsWith(prefix);	//접두사

		/*
		String url = "https://www.naver.com";
		System.out.println(url.startsWith("https://"));
		System.out.println(url.endsWith(".com"));
		 */	

		/*
		//[문제]
		String directory = "C:\\spring\\src";
		String fileName = "Sample.java";

		//		String path = directory+"\\" + fileName;
		//		String path = directory + fileName;
		String path = directory 
								+ (directory.endsWith("\\") ? "" : "\\") 
								+ fileName;

		//	C:\spring\src\Sample.java

		System.out.println(path);
		// 
		 */

		//boolean todo.equals(todo);
		//boolean todo.equalsIgnoreCase(todo);

		/*
		byte [] todoByteArray = todo.getBytes();
		System.out.println(Arrays.toString(todoByteArray));
		 */

		//		todo.indexOf(0);		앞에서부터 찾아서 찾은 인덱스값을 리턴
		//		todo.lastIndexOf(0);	뒤에서부터 찾은 인덱스값을 리턴

		//		System.out.println(todo.indexOf("Auto"));	//5
		//		System.out.println(todo.lastIndexOf("Auto"));	//5


		//		todo.matches(regex);

		//		System.out.println("-".repeat(30));
		String todo = "TODO Auto-generated method Alert stub";


		//	String.valueOf() 각 자료형의 값을 문자열 변환하는 메서드
		// 3.14 + ""
		// true + ""
		// 100 + ""
		/*
		char [] m = {'a','2','x'};
		String s = String.valueOf(m);
		System.out.println(s); "a2x"
		 */

		/*
		char [] m = {'a','2','x'};
		String s = new String(m);
		System.out.println(s);
		 */
		//		Stirng.format(" ")

		//		System.out.println("<ul><li>" + todo.join("</li><li>", "권맑음", "구본혁", "한재호" ) + "</li></ul>");
		//		System.out.println(todo.toLowerCase());	//todo auto-generated method alert stub
		//		System.out.println(todo.toUpperCase());	//TODO AUTO-GENERATED METHOD ALERT STUB

		//		System.out.println(todo.toString());
		//		String -> byte[]	getByte()
		//		String -> char[]	toCharArray()
		//		char [] todoCharArray = todo.toCharArray();


		//System.out.println( todo.substring(2, 7));	//String
		//System.out.println( todo.subSequence(2, 7));	//CharSequence		//둘의 차이점은 리턴타입.

		//todo.substring(0);
		//todo.substring(0,2);

		//todo.subSequence(beginIndex, endIndex);
		// 1)기능
		// 2) subString() 차이점?

		//		todo.strip();				//trim() <- 앞뒤공백제거
		//		todo.stripLeading();		//leading 이끄는		앞 공백제거
		//		todo.stripTrailing();		//trailing			뒤 공백제거
		/*
		System.out.println("[" + "	홍길동	".trim() + "]");
		System.out.println("[" + "	홍길동	".strip() + "]");
		System.out.println("[" + "	홍길동	".stripLeading() + "]");
		System.out.println("[" + "	홍길동	".stripTrailing() + "]");
		 */
		/*
		String regex = " ";
//		String [] todoArr = todo.split(regex);					//[TODO, Auto-generated, method, Alert, stub]
//		String [] todoArr = todo.split(regex, 3); //limit		//[TODO, Auto-generated, method Alert stub]
//		System.out.println(Arrays.toString(todoArr));
		 */

		/*
		System.out.println(todo.replace('e', '*'));		
		System.out.println(todo.replace("method", "방법"));		//TODO Auto-g*n*rat*d m*thod Al*rt stub
		//									regex 정규표현식		//TODO Auto-generated 방법 Alert stub
		System.out.println(todo.replaceAll("[Aa]\\.*", "*"));	//TODO *uto-gener*ted method *lert stub
		System.out.println(todo.replaceFirst("[Aa]\\.*", "*")); //TODO *uto-generated method Alert stub
		 */


	}//m

}//c
