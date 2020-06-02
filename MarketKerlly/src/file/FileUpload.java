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

			String sql = "insert into pds (id, filename, files) values (?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, maxID);
			ps.setString(2, fileName);
			ps.setBinaryStream(3, is, fileLength);
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
		ResultSet result = stmt.executeQuery("select max(id) from pds");
		while (result.next()) {
			maxID = result.getInt(1);
		}
		result.close();
		stmt.close();
		return maxID;
	}

	public static void main(String[] args) {
		String fileName = "C:\\Users\\인호\\Desktop\\test.jpg";
		FileUpload fileup = new FileUpload(fileName);
		System.out.println("성공");

	}

}
