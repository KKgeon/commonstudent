package days25;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Set;
import java.util.Map.Entry;

import days24.MemberVO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

/**
 * @author kenik
 * @date 2024. 2. 2. - 오전 7:40:43
 * @subject
 * @content
 */
public class Ex01 {

	public static void main(String[] args) { 
		// Hashtable, HashMap, TreeMap, SortedMap, LinkedHashMap
		String fileName = ".\\src\\days24\\Java 팀 구성.txt";
		HashMap<TeamVO, ArrayList<MemberVO>> teamMap = new LinkedHashMap<>();
		

		String line = null;
		String teamName = null;
		ArrayList<MemberVO> teamList = null;

		try(FileReader fr = new FileReader(fileName);
				BufferedReader br = new BufferedReader(fr)   ) {

			String name = null;

			while (   (line = br.readLine()) != null && !line.equals("") ) {
				teamName = line; // teamName
				line = br.readLine(); // 구본혁(팀장),류영은,윤형준,김영진,강명건,김진성,유진,이동찬
				String [] tNames = line.split("\\s*,\\s*");
				teamList = new ArrayList<>(); // value
				for (int i = 0; i < tNames.length; i++) {
					name = tNames[i];
					if ( name.contains("팀장") ) {  // 팀장
						name = name.replace("(팀장)", "");  // ***
						teamList.add(new MemberVO( name, "팀장"));
					} else {  // 팀원
						teamList.add(new MemberVO( name, "팀원"));
					} // if
				} // for

				int totalNumber = teamList.size();  

				teamMap.put(new TeamVO(teamName, totalNumber, name), teamList); //

			} // while

			// 출력
			dispTeamMember(teamMap);

		} catch (Exception e) {
			e.printStackTrace();
		}

	} // main

	private static void dispTeamMember(HashMap<TeamVO, ArrayList<MemberVO>> teamMap) {

		Set<Entry<TeamVO, ArrayList<MemberVO>>> es = teamMap.entrySet();      
		Iterator<Entry<TeamVO, ArrayList<MemberVO>>> ir = es.iterator();

		while (ir.hasNext()) {
			Entry<TeamVO, ArrayList<MemberVO>> entry = ir.next();
			TeamVO key = entry.getKey();  // "1조"   "2조"
			ArrayList<MemberVO> value = entry.getValue(); 
			System.out.printf("[%s(%d명):%s]\n"
					, key.getName() ,key.getTotalNumber(), key.getLeader()   );
			Iterator<MemberVO> ir2 = value.iterator();
			int seq = 1;         
			ir2.next();   // 팀장은 건너띄기~      
			while (ir2.hasNext()) {
				MemberVO vo =  ir2.next();
				System.out.printf("  [%d] %s\n", seq++,  vo.getName()  );

			} // while
		} // while


		//         [1조(8명):구본혁]
		//           [1] 류영은
		//           [2] 윤형준
		//           [3] 김영진
		//           [4] 강명건
		//           [5] 김진성
		//           [6] 유진
		//           [7] 이동찬
		//         [2조(7명):원대안]
		//           [1] 이동영
		//           [2] 한재호
		//           [3] 권맑음
		//           [4] 박우현
		//           [5] 이시은
		//           [6] 조연화 



	}

} // class


@Data
@AllArgsConstructor
@Builder
class TeamVO{
	private String name;
	private int  totalNumber;
	private String leader;
}











// 25.05
// 