package exam;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BLOBOutputTest {
	private String id = "jsp", pwd = "1234";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private Connection con;
//	private ResultSet rs;
	private PreparedStatement ps;

	protected void doGet() throws ServletException, IOException {


		ResultSet rs = null;

		Blob blob = null; // blob 데이터를 저장할 객체 생성

//		ServletOutputStream sOut = response.getOutputStream(); // 이미지를 출력할 outputStream 객체 생성
//		OutputStream sOut = 
		try {

			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, id, pwd);

			String sql = "select * from pds";

			ps = con.prepareStatement(sql);

			rs = ps.executeQuery();

			if (rs.next()) {

				blob = rs.getBlob(1); // blob 객체에 blob 데이터 저장

			}

//			sOut.write(blob.getBytes(1, (int) blob.length())); // outputStream 객체에 blob 객체를 byte[] 로 만들어서 쓰기

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			try {

//				if (sOut != null)
//					sOut.close();

				if (rs != null)
					rs.close();

			} catch (SQLException e) {

				e.printStackTrace();

			}

		}

	}
//	private String id = "jsp", pwd = "1234";
//	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
//	private Connection con;
//	private ResultSet rs;
//	private PreparedStatement ps;
//
//	public BLOBOutputTest() {
//		try {
//			Class.forName("oracle.jdbc.OracleDriver");
//			con = DriverManager.getConnection(url, id, pwd);
//
//
//			Statement stmt = con.createStatement();
//			ResultSet rs = stmt.executeQuery("SELECT * FROM PDS");
//
//			List<FileVO> fileList = new ArrayList<FileVO>();
//			
//			if (rs.next()) {
//				FileVO file = new FileVO();
//				file.setFileName(rs.getString("filename"));
//				file.setId(rs.getInt("id"));
//				file.setFiles(rs.getBytes("files"));
//				fileList.add(file);
////				String sql = "C:\\Users\\인호\\Desktop\\eclipse\\Jsp-workspace\\dog.gif";
////				FileOutputStream fos = new FileOutputStream(sql);
////				byte[] buff = new byte[10000];
////				int len;
////				while ((len = is.read(buff)) > 0) {
////					fos.write(buff, 0, len);
////				}
////				fos.close();
////				is.close();
////				rs.close();
//				System.out.println(fileList);
//			}
//			con.close();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	public static void main(String[] args) {
//
//		new BLOBOutputTest();
//	}

}
