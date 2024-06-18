package tennisScoreView;

// 테니스 경기 득점 계수기 클래스
public  class TennisSetting {
	// 경기 방식
	public enum GameType {
		SINGLES, DOUBLES
	}

	// 경기 진행 세트 수
	private int numSets;

	// 생성자
	public TennisSetting(int numSets) {
		this.numSets = numSets;
	}

	// 경기 진행 메서드
	public void playGame(TennisPlayer player1, TennisPlayer player2, GameType gameType) {
		if (gameType == GameType.SINGLES) {
			playSinglesGame(player1, player2);
		} else if (gameType == GameType.DOUBLES) {
			playDoublesGame(player1, player2);
		}
	}

	// 단식 경기 메서드
	private void playSinglesGame(TennisPlayer player1, TennisPlayer player2) {
		int setsToPlay = player1.gender ? 5 : 3;
		System.out.println(player1.name + " vs " + player2.name + " (단식, " + setsToPlay + " 세트)");

		// 단식 경기 로직 추가
		// 여기에 득점 계산 및 경기 진행 코드를 추가하세요
	}

	// 복식 경기 메서드
	private void playDoublesGame(TennisPlayer player1, TennisPlayer player2) {
		int setsToPlay = player1.gender ? 5 : 3;
		System.out.println(player1.name + "/" + player2.name + " vs " + player2.name + "/" + player2.name + " (복식, " + setsToPlay + " 세트)");

		// 복식 경기 로직 추가
		// 여기에 득점 계산 및 경기 진행 코드를 추가하세요
	}

	// 혼성팀 경기 메서드
	private void playMixedDoublesGame(TennisPlayer malePlayer, TennisPlayer femalePlayer) {
		int setsToPlay = 5; // 혼성팀 경기는 무조건 5세트로 진행

		System.out.println(malePlayer.name + "/" + femalePlayer.name + " vs " + malePlayer.name + "/" + femalePlayer.name + " (혼성복식, " + setsToPlay + " 세트)");

		// 혼성팀 경기 로직 추가
		// 여기에 득점 계산 및 경기 진행 코드를 추가하세요
	}


	// 예시 실행 코드
	public static void main(String[] args) {
		TennisPlayer malePlayer1 = new TennisPlayer("김테니스", true);
		TennisPlayer malePlayer2 = new TennisPlayer("강테니스", true);
		TennisPlayer malePlayer3 = new TennisPlayer("박테니스", true);
		TennisPlayer malePlayer4 = new TennisPlayer("최테니스", true);
		TennisPlayer femalePlayer1 = new TennisPlayer("김샤라포바", false);
		TennisPlayer femalePlayer2 = new TennisPlayer("이샤라포바", false);
		TennisPlayer femalePlayer3 = new TennisPlayer("최샤라포바", false);
		TennisPlayer femalePlayer4 = new TennisPlayer("신샤라포바", false);

		TennisSetting scoreCounter = new TennisSetting(5);

		// 단식 경기
		scoreCounter.playGame(malePlayer1, malePlayer2, TennisSetting.GameType.SINGLES);

		// 복식 경기
		scoreCounter.playGame(malePlayer1, malePlayer2, TennisSetting.GameType.DOUBLES);

		// 혼성팀 경기
		scoreCounter.playMixedDoublesGame(malePlayer1, femalePlayer1);
	}//m
}//c