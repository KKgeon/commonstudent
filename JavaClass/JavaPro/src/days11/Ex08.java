package days11;

/**
 * @author geon
 * @date 2024. 1. 15. - 오후 2:50:19
 * @subject
 * @content
 */
public class Ex08 {

	public static void main(String[] args) {
		//순차검색
		int n = 71;
		int [] m = { 3, 92, 3, 40, 71, 91, 61, 92, 76, 71, 59, 54, 64, 48, 66, 92, 25, 20, 71, 37 };

		System.out.println(indexOf(m, n));

	}//m
	private static int indexOf(int[] m, int n) {
		for (int i = 0; i < m.length; i++) {
			if (m[i] == n);{
//				System.out.println(i);
				return i;
			}
		
		}
		return -1;
	}
}//c
