package tennis_team_1;

import java.util.Scanner;

public class Player {
	String team1;
	String team2;
	static String team1player =""; //***************
	static String team2player =""; //***************

	public static String[][] Inputplayer(boolean mode) {

		Scanner scanner = new Scanner(System.in);
		int playernum=1;               //단식 복식에 따른 플레이어 수 선언
		if(mode) {
			playernum=1;//mode가 true면 단식
			System.out.println("\t     *** 팀당 1명 입력 ***");
			System.out.println();
		}

		else {
			playernum=2;//mode가 false면 복식
			System.out.println("\t     *** 팀당 2명 입력 ***");
			System.out.println();
		}

		String [][] playername= new String [2][playernum];   	//플레이어 이름을 2차원 배열로 1행에는 team1 2행에는 team2 저장

		for(int i=0;i<playernum*2;i++) {
			System.out.printf(" → %d팀 선수 이름 : ", i < playernum ? 1 : 2);
			if(i<playernum)    playername[0][i]=scanner.next();                 //1팀 입력
			else    playername[1][i-playernum]=scanner.next();                  //2팀 입력
		}
		System.out.println();
		System.out.println();
		System.out.println();
		
		try {
			int count = 3;
			for (int i = 3; i >= 1; i--) {
				System.out.printf("%d초뒤 게임을 시작합니다.\n", count--);
				System.out.println();
				System.out.println();
				Thread.sleep(1000);
			}
			System.out.println();
			System.out.println();
			System.out.println();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return playername;   //선수 이름 저장한 배열을 리턴
	}

	public static String getteam1player(String[][] playername) { //팀1의 선수를 가져오는 메서드
		for(int i = 0; i < playername[0].length; i++) { 	//playername의 배열 수 만큼
			if(i == 1) team1player += ", ";   				//복식경기에서 두번째 선수 입력 시 ,를 추가하여 이름을 구분해준다.
			team1player+=playername[0][i];					//team1의 첫번째 선수는 playername 0행에 있는 이름 저장
		}
		System.out.print("\t\t");
		System.out.println("▒".repeat(65));
		System.out.println();
		System.out.print("\t\t");
		System.out.println("▒\t\tTeam1 : "+team1player+ "\t\t\t\t▒");
		System.out.println();
		return team1player;
	}

	public static String getteam2player(String[][] playername) { 	//팀2의 선수를 가져오는 메서드
		for(int i = 0; i < playername[1].length; i++) {   
			if(i == 1) team2player += ", "; 						
			team2player+=playername[1][i];
		}
		System.out.print("\t\t");
		System.out.println("▒\t\t\tVS"+ "\t\t\t\t\t▒");
		System.out.println();
		System.out.print("\t\t");
		System.out.println("▒\t\tTeam2 : "+team2player + "\t\t\t\t▒");
		System.out.println();
		System.out.print("\t\t");
		System.out.println("▒".repeat(65));
		System.out.println();
		System.out.println();

		try {
			Thread.sleep(2000);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return team2player;
	}
}

