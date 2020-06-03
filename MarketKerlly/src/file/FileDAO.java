package file;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;

public class FileDAO {
	private String id = "jsp";
	private String pwd = "1234";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private Connection con;
	private ResultSet rs;
	private PreparedStatement ps;
	private String b64 ;

	public FileDAO() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url, id, pwd);
	}

	public int[] getRandom(Connection con) throws SQLException {
		int maxID = 0;
		Statement stmt = con.createStatement();
		ResultSet result = stmt.executeQuery("select max(pro_id) from productinfo");
		while (result.next()) {
			maxID = result.getInt(1);
		}
		System.out.println(maxID);
		result.close();
		stmt.close();
		int cntarr[] = new int[4];
		for (int i = 0; i < 4; i++) {
			int cnt = (int) ((Math.random() * maxID) + 1);
			cntarr[i] = cnt;
			for(int j = 0 ; j < i ; j++) {
				if (cntarr[j] == cnt)
					i--;
			}
		}
		return cntarr;
	}

	// 쿼리문
	public List<FileDTO> getRandomFile() throws SQLException {
		int[] cnt = getRandom(con);
		List<FileDTO> list = new ArrayList<FileDTO>();
		try {
			String sql = "select * from productinfo where pro_id = ? or pro_id = ? or pro_id = ? or pro_id = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, cnt[0]);
			ps.setInt(2, cnt[1]);
			ps.setInt(3, cnt[2]);
			ps.setInt(4, cnt[3]);
			rs = ps.executeQuery();
			while (rs.next()) {
				FileDTO dto = new FileDTO();
				InputStream in = rs.getBinaryStream("img");
				BufferedImage bimg = ImageIO.read(in);
				in.close();

				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				ImageIO.write(bimg, "jpg", baos);
				baos.flush();
				byte[] imageInByteArray = baos.toByteArray();
				baos.close();
				dto.setImg(javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray));
				dto.setPrice(rs.getInt("pro_price"));
				dto.setPro_name(rs.getString("pro_name"));
				dto.setPro_id(rs.getInt("pro_id"));
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<FileDTO> getRecentFile() {
		List<FileDTO> list = new ArrayList<FileDTO>();
		try {
			String sql = "select * from PRODUCTINFO where pro_id > (select max(pro_id) from productinfo)-4";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				FileDTO dto = new FileDTO();
				InputStream in = rs.getBinaryStream("img");
				BufferedImage bimg = ImageIO.read(in);
				in.close();

				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				ImageIO.write(bimg, "jpg", baos);
				baos.flush();
				byte[] imageInByteArray = baos.toByteArray();
				baos.close();
				dto.setImg(javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray));
				dto.setPrice(rs.getInt("pro_price"));
				dto.setPro_name(rs.getString("pro_name"));
				dto.setPro_id(rs.getInt("pro_id"));
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<String> getHotFile() {
		List<String> list = new ArrayList<String>();
		try {
			String sql = "select * from pds";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				InputStream in = rs.getBinaryStream("files");
				BufferedImage bimg = ImageIO.read(in);
				in.close();

				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				ImageIO.write(bimg, "jpg", baos);
				baos.flush();
				byte[] imageInByteArray = baos.toByteArray();
				baos.close();
				list.add(javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
