package customer;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

public class CustomerDAO {
	private String id = "jsp", pwd = "1234";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private Connection con;
	private ResultSet rs;
	private PreparedStatement ps;

	public CustomerDAO() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url, id, pwd);
	}

	public CustomerDTO getById(String id) throws SQLException {
		CustomerDTO dto = new CustomerDTO();
		ps = con.prepareStatement("select * from customer where id=?");
		ps.setString(1, id);
		rs = ps.executeQuery();
		if (rs.next()) {
			dto.setId(rs.getString(1));
			dto.setPwd(rs.getString(2));
			dto.setName(rs.getString(3));
			dto.setAddr(rs.getString(4));
			dto.setTel(rs.getString(5));
		}
		return dto;
	}

	public ArrayList<CustomerDTO> getMemArr() throws SQLException {
		ArrayList<CustomerDTO> arr = new ArrayList<CustomerDTO>();
		ps = con.prepareStatement("select * from customer");
		rs = ps.executeQuery();
		while (rs.next()) {
			CustomerDTO dto = new CustomerDTO();
			dto.setId(rs.getString("id"));
			dto.setPwd(rs.getString("pwd"));
			dto.setName(rs.getString("name"));
			dto.setAddr(rs.getString("addr"));
			dto.setTel(rs.getString("tel"));
			arr.add(dto);
		}
		return arr;
	}
	public int join(CustomerDTO dto) throws SQLException {
		int result = 0;
		ps = con.prepareStatement("insert into customer values (?,?,?,?,?)");
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getPwd());
		ps.setString(3, dto.getName());
		ps.setString(4, dto.getAddr());
		ps.setString(5, dto.getTel());
		try {
		result =  ps.executeUpdate();
		}catch(SQLIntegrityConstraintViolationException e){
	
		}
		return result;
	}
}
