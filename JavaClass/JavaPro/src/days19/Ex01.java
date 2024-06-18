package days19;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Arrays;
import java.util.Collections;

/*
3. "SS20_Team.txt"  파일을 읽어서 본인의 팀원들만의 이름을 teamMember 배열에 
저장한 후 팀장명을 제외한 나머지 팀원들의 이름을  
내림차순으로 정렬해서 아래와 같이 출력하는 코딩을 하세요.
[실행결과]  예 : 
[ 2조 ]
<ul>
	<li class="leader">박우현</li>
	<li>이동찬</li>
	<li>윤형준</li>
	<li>유진</li>
	<li>원대안</li>
</ul>
 */
public class Ex01 {
	public static void main(String[] args) {

		String fileName = "SS20_Team.txt";
		String [] teamMember = null;	//나의 팀원들을 저장

		String key = "user.dir";
		String userDir = System.getProperty(key);

		String path = String.format( "%s\\src\\days19\\%s", userDir, fileName);
		//		System.out.println(path);


		String myName = "강명건";
		String teamLine = null;
		String teamMemberLine = null;
		String teamLeader = null;
		String regex = "\\s*,\\s*";//여기서 뭔가 잘못한듯

		try(FileReader fr = new FileReader(path);
				BufferedReader br = new BufferedReader(fr);) {

			while ((teamLine=br.readLine()) != null ) {
				teamMemberLine = br.readLine();
				//System.out.printf("[%s]: [%s]\n", teamLine, teamMemberLine);
				if (teamMemberLine.contains(myName)) {
					System.out.printf("[%s]: [%s]\n", teamLine, teamMemberLine);

					teamMember =  teamMemberLine.split(regex);

					teamLeader = teamMember[0].replace("(팀장)", "");

					//나머지 팀원 내림차순 정렬
					String [] temp = new String[teamMember.length-1];

					System.arraycopy(teamMember, 1, temp, 0, teamMember.length-1);
					//					System.out.println("temp : " + Arrays.toString(temp));
					Arrays.sort(temp, Collections.reverseOrder());

					System.arraycopy(temp, 0, teamMember, 1, temp.length);
					System.out.println(Arrays.toString(teamMember));

					break;
				}//if
			}//while

			//출력
			String output = "<ul>\n"
					+ "<li class=\"leader\">";
			System.out.printf("[%s]\n", teamLine);
			output +=	String.join("</li>\n <li>", teamMember);
			output += "<li>\n"
					+"</ul>";
			System.out.println(output);


		} catch (Exception e) {

		}

	}//m
}//c
