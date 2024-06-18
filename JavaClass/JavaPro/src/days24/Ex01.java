package days24;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.Set;

public class Ex01 {
	public static void main(String[] args) {

		String fileName = ".\\src\\days24\\Java 팀 구성.txt";
		HashMap<String, ArrayList<MemberVO>> teamMap = new LinkedHashMap<>();

		String line = null;
		String teamName = null;
		ArrayList<MemberVO> teamList = null;
		try(FileReader fr = new FileReader(fileName);
				BufferedReader br = new BufferedReader(fr);) {

			while ((line = br.readLine()) != null &&!line.equals("")) {
				teamName = line;
				line = br.readLine();
				String [] tNames=line.split("\\s*,\\s*");
				teamList = new ArrayList<>();
				for (int i = 0; i < tNames.length; i++) {
					String name = tNames[i];
					if (name.contains("팀장")) {
						name = name.replace("(팀장)", "");
						teamList.add(new MemberVO(name, "팀장"));
					} else {
						teamList.add(new MemberVO(name, "팀원"));
					}//else
				}//for
				teamMap.put(teamName, teamList);
			}//while
			dispTeam(teamMap);
		} catch (Exception e) {
			e.printStackTrace();
		}//trycatch


	}//m

	private static void dispTeam(HashMap<String, ArrayList<MemberVO>> teamMap) {
		Set<Entry<String, ArrayList<MemberVO>>> es = teamMap.entrySet();

		Iterator<Entry<String, ArrayList<MemberVO>>> ir = 	es.iterator();

		while (ir.hasNext()) {
			Entry<String, ArrayList<MemberVO>> entry = ir.next();
			String key = entry.getKey();
			ArrayList<MemberVO> value = entry.getValue();
			int teamCount = value.size();
			MemberVO teamReaderVO = value.get(0);
			System.out.printf("[%s(%d명) : %s]\n", key, teamCount, teamReaderVO.getName() );

			Iterator<MemberVO> ir2 =	value.iterator();
			int seq = 1;
			ir2.next();
			while (ir2.hasNext()) {
				MemberVO vo = ir2.next();
				System.out.printf("	[%d] %s \n", seq++, vo.getName() );

			}

		}//while

	}
}//c
