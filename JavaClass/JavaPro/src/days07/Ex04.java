package days07;

/**
 * @author geon
 * @date 2024. 1. 9. - 오전 11:38:48
 * @subject
 * @content
 */
public class Ex04 {

	//정규표현식
	// 회원가입 - 주소 우편번호 : 000-000 00000
	public static void main(String[] args) {
		String [] zipCodes = {
				"123-456",
				"12345",
				"123-4a6",
				"123-4567",
				"123456"
		};
		String regex = "\\d{5}|\\d{3}-\\d{3}";
		// 정규표현식 {n} <- 반복횟수 n번 가능
		//			{n,m} <-반복횟수 n~m 번까지 가능
		//			{n,} 반복횟수 n 이상 가능
		//				\\s 공백
		//				* 반복횟수 0~여러개		0 이상
		//				+ 반복횟수 1~여러개		1 이상
		//				? 반복횟수 0, 1
		//boolean String.matches(regex)
		for (int i = 0; i < zipCodes.length; i++) {
			//			System.out.println(zipCodes[i]);
			String zipCode = zipCodes[i];
			if (zipCode.matches(regex)) {
				System.out.printf("올바른 %s 우편번호\n", zipCode);

			} else {
				System.out.printf("잘못된 %s 우편번호\n", zipCode);
			}
		}//for i

	}//m
}//c
