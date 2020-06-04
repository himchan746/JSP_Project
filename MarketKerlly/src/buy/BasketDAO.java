package buy;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BasketDAO {
	private String id = "jsp", pwd = "1234";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private Connection con;
	private ResultSet rs;
	private PreparedStatement ps;

	public BasketDAO() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection(url, id, pwd);
	}
	
	//장바구니 목록 출력 cus_id 매개로 받아 그 사람의 장바구니만 출력!!
	public ArrayList<BuyDTO> basketList(String cus_id){
		ArrayList<BuyDTO> list = new ArrayList<BuyDTO>();
		String sql = "select * from basket where cus_id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, cus_id);
			rs=ps.executeQuery();
			while(rs.next()) {
				BuyDTO bd = new BuyDTO();
				bd.setCus_id(rs.getString("cus_id"));
				bd.setPro_id(rs.getInt("pro_id"));
				bd.setPro_count(rs.getInt("pro_count"));
				bd.setPrice(rs.getInt("price"));
				bd.setPro_name(rs.getString("pro_name"));
				list.add(bd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//장바구니에 집어넣기
	public void insertBasket(String cus_id,int pro_id, int pro_count ,int price, String pro_name) {
		String sql = "insert into basket values(?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, cus_id);
			ps.setInt(2, pro_id);
			ps.setInt(3, pro_count);
			ps.setInt(4, price);
			ps.setString(5, pro_name);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	//결제된 상품 장바구니에서 삭제
	public void deleteBasket(String cus_id, int pro_id) {
		String sql = "delete from basket where cus_id=? and pro_ID=?;";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, cus_id);
			ps.setInt(2, pro_id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
