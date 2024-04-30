package days05;

public class Ex03_02 {
	public static void main(String[] args) {
		//int currentPage = 1;
		int numberPerPage = 10;
		int numberOfPageBlock = 10;

		//페이징 블럭 : [1] 2 3 4 5 6 7 8 9 10 
		// 1) 총 게시글 수 ? 151
		// 2) 총 페이지 수 ? 16

		//currentPage = 1		 [1] 2 3 4 5 6 7 8 9 10 
		//currentPage = 2		 [1] 2 3 4 5 6 7 8 9 10 
		//currentPage = 3		 [1] 2 3 4 5 6 7 8 9 10 
		//currentPage = 4		 [1] 2 3 4 5 6 7 8 9 10 
		//currentPage = 5		 [1] 2 3 4 5 6 7 8 9 10 
		//currentPage = 6		 [1] 2 3 4 5 6 7 8 9 10 
		//currentPage = 7		 [1] 2 3 4 5 6 7 8 9 10 
		//currentPage = 8		 [1] 2 3 4 5 6 7 8 9 10 
		//currentPage = 9		 [1] 2 3 4 5 6 7 8 9 10 
		//currentPage = 10	 	 [1] 2 3 4 5 6 7 8 9 10

		for (int currentPage = 1; currentPage <= 16; currentPage++) {
			int start = (currentPage-1)/numberOfPageBlock * numberOfPageBlock + 1;
			int end = start + numberOfPageBlock - 1;
			if (end > 16) {
				end = 16;
			}
			System.out.printf("currentPage = %d ",currentPage);

			if (start != 1) System.out.printf(" < ");

			for (int i = start; i <= end; i++) {
				if (i==currentPage) System.out.printf("[%d] ",i); 
				else System.out.printf("%d ",i);
			}
			if (end != 16) {
				System.out.printf(" > ");
			}
			System.out.println();


		}
	}
}
