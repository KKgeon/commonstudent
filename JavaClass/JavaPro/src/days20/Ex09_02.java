package days20;

public class Ex09_02 {
	public static void main(String[] args) {
		String output = "이름:권맑음, 나이:26살, 성별:남자, 키:178.67, 등급:A 입니다.";
		//output 문자열 속에서 이름, 나이 를 파싱해서
		//String name, int age 변수에 저장 후 출력하세요.

		String name = null;
		int age = 0;

		/* [1]
	      int beginIndex = output.indexOf("이름:")  + "이름:".length();
	      int fromIndex = beginIndex+1;
	      int endIndex = output.indexOf("," , fromIndex);
	        name = output.substring(beginIndex,endIndex);
		 */

		
	
		// [2]
		String [] infos =  output.split(", ");

		for (int i = 0; i < infos.length; i++) {
			if( infos[i].contains("이름") ) {
				name =  infos[i].substring(3);
			}else if( infos[i].contains("나이") ) {
				age = Integer.parseInt( infos[i].replace("살", "").substring(3) );
			}
		} 

		System.out.printf("> 이름: %s, 나이: %d 살\n", name, age);


		/*
	      String output = "이름 :"
	    		  + ", 나이 : 26, 성별 : 남자, 키 : 178.67, 등급 : A 입니다.\n";
		int age = Integer.parseInt(output.substring(15, 17));
		String name = output.substring(5,8);

		System.out.printf("> 이름 %s, 나이 : %d살 \n", name, age);
		 */
	}//m
}//c
