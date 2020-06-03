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

	public FileUpload() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection(url, id, pwd);
	}

	public void fileUpload(String fileName ,String name , int cnt ,int price , String group ) {
		try {
			int maxID = getMaxID(con) + 1;
			File file = new File(fileName);
			int fileLength = (int) file.length();
			System.out.println("fileLength : " + fileLength);
			InputStream is = new FileInputStream(file);
			
			String arr[] = new String[20];
			
			String sql = "insert into productinfo values (?,?,?,?,?,?,?,sysdate,)";
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, maxID);
			ps.setString(2, group);
			ps.setString(3, name);
			ps.setInt(4, cnt);
			ps.setInt(5, price);
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

}
