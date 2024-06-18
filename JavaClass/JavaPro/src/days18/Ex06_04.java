package days18;

public class Ex06_04 {
	public static void main(String[] args) {
		/*
	      문제 설명
	      길이가 n이고, "수박수박수박수...."와 같은 패턴을 유지하는 문자열을 리턴하는 함수, 
	      solution을 완성하세요. 예를들어 n이 4이면 "수박수박"을 리턴하고 3이라면 "수박수"를 리턴하면 됩니다.

	      제한 조건
	      n은 길이 10,000이하인 자연수입니다.
	      입출력 예
	      n   return
	      3   "수박수"
	      4   "수박수박"
		 */
		System.out.println(solution(14));
		System.out.println(solution(3));
		
		
	

	}//m
	/*
	   private static void solution() {

		      int n = 150;
		      StringBuilder sb = new StringBuilder("");
		      for (int i = 0; i < n; i++) {
		         if (n>10000) {
		            System.out.println("10,000 이하의 자연수를 입력해야합니다"); break;
		         }else if (sb.length() % 2 == 0) {
		            sb.append("수");
		         }else {
		            sb.append("박");
		         }

		      }//for
		      System.out.println(sb);
		   }//solution
	 */

	public static String solution(int n) {

		String answer = "";
		StringBuilder sb = new StringBuilder();

		int 몫 = n/2;
		int 나머지 = n%2;
		
//		for (int i = 0; i < 몫; i++) sb.append("수박");
		sb.append("수박".repeat(몫));
		if (나머지==1) sb.append('수');

		answer = sb.toString();
		return answer;

	}//solution



}//c
