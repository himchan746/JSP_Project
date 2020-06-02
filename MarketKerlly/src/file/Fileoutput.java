package file;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

public class Fileoutput {
	private String id = "jsp";
	private String pwd = "1234";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private Connection con;
	private ResultSet rs;
	private PreparedStatement ps;

	public Fileoutput() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection(url, id, pwd);
	}

	// 쿼리문
	public List<String> getfile() {
		String b64 = null;
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
