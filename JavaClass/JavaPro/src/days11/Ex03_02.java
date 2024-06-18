package days11;

import java.util.Arrays;

public class Ex03_02 {
	public static void main(String[] args) {


		int [] m =  {3,5,2,4,1};
		int foundIndex = indexOf( m, 4 );

		int [] temp = new int [m.length+5];
		/*
		for (int i = 0; i < m.length; i++) {
			if(i<foundIndex)	temp[i] =m[i];
			else if (i>=foundIndex) { temp [i+1] = m[i];

			}
		}
		temp[foundIndex] = 100;
		 */
		System.arraycopy(m, 0, temp, 0, foundIndex);
		System.arraycopy(m, foundIndex, temp, foundIndex+1, m.length - foundIndex);
		
		temp[foundIndex] = 100;


		System.out.println(Arrays.toString(temp));

	}//m
	//	순차검색(Sequence Search)
	private static int indexOf(int[] m, int n) {
		for (int i = 0; i < m.length; i++) {
			if (m[i] == n) return i;
		}
		return -1;
	}
}//c
