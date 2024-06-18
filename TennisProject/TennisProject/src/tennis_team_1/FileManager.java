package tennis_team_1;

import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Arrays;

public class FileManager {

	public static void txtout(String line) {

		String fileName = ".\\src\\tennis_team_1\\tennis_team_1.txt";
		File f = new File(fileName);

		try(
				FileWriter fw = new FileWriter(fileName);
				BufferedWriter bw = new BufferedWriter(fw);
				) {

			bw.write(line);
			bw.flush(); 

			System.out.println("end");
		} catch(Exception e) {
			e.printStackTrace();
		}

	}
}

