package Prectice;


//문자열 my_string, overwrite_string과 정수 s가 주어집니다. 
//문자열 my_string의 인덱스 s부터 overwrite_string의 길이만큼을 문자열 overwrite_string으로 바꾼 문자열을 return 하는 solution 함수를 작성해 주세요.
class Solution {

public static void main(String[] args) {

	String a = "나는빡빡이다나는빡빡이다나는빡빡이다";
	String b = "뿌오뿌오";
	int c = 5;
	System.out.println(a.substring(0));
}


	public String solution(String my_string, String overwrite_string, int s) {
		String answer = "";
		answer = (answer.substring(0, my_string.length()) + overwrite_string);
		return answer;
	}
}//c