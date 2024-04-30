package days11;

import java.util.Arrays;

public class Ex03 {
	public static void main(String[] args) {


		int [] m =  {3,5,2,4,1};
		int foundIndex = indexOf( m, 4 );
//		System.out.println(foundIndex);		

		int [] temp = new int [m.length+5];
//		Arrays.copyOfRange(null, foundIndex, foundIndex)
//		System.arraycopy(m,1,temp,2,3);
		System.arraycopy(m,0,temp,0,m.length);
		
		System.out.println(Arrays.toString(temp));
		
		for (int i = m.length; i < temp.length; i++) {
			
		}
	}//m
	//	순차검색(Sequence Search)
	private static int indexOf(int[] m, int n) {
		for (int i = 0; i < m.length; i++) {
			if (m[i] == n) return i;
		}
		return -1;
	}
}//c
