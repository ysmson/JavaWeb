package tw.shawn.apis;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;

public class ShawnUtils {
	public static String LoadView(String view) throws Exception {
		String source = 
			"C:\\Users\\ysmso\\git\\JavaWeb\\ShawnWeb\\src\\main\\webapp\\views\\view1.html";
		String sfile = String.format(source, view);
		File html = new File(sfile);
		BufferedInputStream bin = 
			new BufferedInputStream(new FileInputStream(html));
		byte[] buf = bin.readAllBytes();
		bin.close();
		
		return new String(buf);
	}
}