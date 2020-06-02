package productInfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductInfoDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ProductInfoDAO() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jsp","1234");
		} catch (ClassNotFoundException e) {
			System.out.println("driver not found");
		} catch (SQLException e) {
			System.out.println("connection failed");
		}
		
	}
	
	public ProductInfoDTO getProduct(String proId) throws SQLException {
		String sql = "select * from productinfo where pro_id =?";
		ProductInfoDTO dto = new ProductInfoDTO();
		ps = con.prepareStatement(sql);
		ps.setString(1, proId);
		rs=ps.executeQuery();
		if(rs.next()) {
			dto.setProId(rs.getString("pro_id"));
			dto.setProName(rs.getString("pro_name").replace("_", " "));
			System.out.println("상품명 :  "+dto.getProName());
			dto.setProCount(rs.getInt("pro_count"));
			dto.setProPrice(rs.getInt("pro_price"));
			dto.setProImg(rs.getBytes("img"));
			dto.setProClick(rs.getInt("click"));
			dto.setProRegTime(rs.getTimestamp("regtime"));
		}
		return dto ;
	}
}
