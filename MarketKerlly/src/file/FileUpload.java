package file;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class FileUpload {

	// 전역변수선언
	private String id = "jsp", pwd = "1234";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private Connection con;
	private ResultSet rs;
	private PreparedStatement ps;
	

	public FileUpload(String fileName) {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, id, pwd);

			int maxID = getMaxID(con) + 1;
			File file = new File(fileName);
			int fileLength = (int) file.length();
			System.out.println("fileLength : " + fileLength);
			InputStream is = new FileInputStream(file);

			String sql = "insert into productinfo values (?,?,?,?,?,?,?,sysdate)";
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, maxID);
			ps.setString(2, "음식");
			ps.setString(3, "특양");
			ps.setInt(4, 124);
			ps.setInt(5, 22000);
			ps.setBinaryStream(6, is, fileLength);
			ps.setInt(7, 0);
			ps.executeUpdate();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected int getMaxID(Connection con) throws SQLException {

		int maxID = 0;
		Statement stmt = con.createStatement();
		ResultSet result = stmt.executeQuery("select max(pro_id) from productinfo");
		while (result.next()) {
			maxID = result.getInt(1);
		}
		result.close();
		stmt.close();
		return maxID;
	}

	public static void main(String[] args) {
		String fileName = "C:\\평일 자바 안지현\\DBImage\\특양.jpg";
		FileUpload fileup = new FileUpload(fileName);
		
		
		
		
		
		
		

	}

}
