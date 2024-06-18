package days11;

/**
 * @author geon
 * @date 2024. 1. 15. - 오후 2:50:19
 * @subject
 * @content 뭔지모르겟는데 안됨..
 */
public class Ex08_02 {

	public static void main(String[] args) {
		//순차검색
		int n = 71;
		int [] m = { 3, 92, 3, 40, 71, 91, 61, 92, 76, 71, 59, 54, 64, 48, 66, 92, 25, 20, 71, 37 };
		
		
		
		System.out.println(indexOf(m, n));
		int beginIndex = 0, foundIndex ;

		//더이상찾는게없을때까지 찾는 코딩.
		while ((foundIndex=indexOf(m, n, beginIndex)) !=-1) {
			System.out.println(foundIndex);
			beginIndex = foundIndex + 1;

		}//while


	}//m
	
	private static int indexOf(int[] m, int n) {
		for (int i = 0; i < m.length; i++) {
			if (m[i] == n) return i;
		}
		return -1;
	}

	
	private static int indexOf(int[] m, int n, int beginIndex) {
		for (int i = beginIndex; i < m.length; i++) {
			if (m[i] == n);{
			
			}
		}
		return -1;
	}

}//c
