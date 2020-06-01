package exam;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class memberDAO {
	private String id = "jsp", pwd = "1234";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private Connection con;
	private ResultSet rs;
	private PreparedStatement ps;

	public memberDAO() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url, id, pwd);
	}

	public memberDTO getById(String id) throws SQLException {
		memberDTO dto = new memberDTO();
		ps = con.prepareStatement("select * from exam where id=?");
		ps.setString(1, id);
		rs = ps.executeQuery();
		while (rs.next()) {
			dto.setId(rs.getString(1));
			dto.setPwd(rs.getString(2));
			dto.setName(rs.getString(3));
			dto.setDepart(rs.getString(4));
			dto.setRank(rs.getString(5));
		}
		return dto;
	}

	public ArrayList<memberDTO> getMemArr() throws SQLException {
		ArrayList<memberDTO> arr = new ArrayList<memberDTO>();
		ps = con.prepareStatement("select * from exam");
		rs = ps.executeQuery();
		while (rs.next()) {
			memberDTO dto = new memberDTO();
			dto.setId(rs.getString("id"));
			dto.setName(rs.getString("name"));
			dto.setDepart(rs.getString("depart"));
			dto.setRank(rs.getString("rank"));
			arr.add(dto);
		}
		return arr;
	}
	public int join(String id,String pwd, String name, String depart, String rank) throws SQLException {
		int result = 0;
		ps = con.prepareStatement("insert into exam values (?,?,?,?,?)");
		ps.setString(1, id);
		ps.setString(2, pwd);
		ps.setString(3, name);
		ps.setString(4, depart);
		ps.setString(5, rank);
		result =  ps.executeUpdate();
		return result;
	}
}
