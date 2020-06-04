package buy;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrderDAO {
	private String id = "project", pwd = "1234";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private Connection con;
	private ResultSet rs;
	private PreparedStatement ps;

	public OrderDAO() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection(url, id, pwd);
	}
	
	// 로그인한 사람이 주문완료한 주문목록 출력 
	public ArrayList<BuyDTO> OrderList(String cus_id) {
		ArrayList<BuyDTO> list = new ArrayList<BuyDTO>();
		String sql = "select * from ordertable where cus_id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, cus_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				BuyDTO bd = new BuyDTO();
				bd.setCus_id(rs.getString("cus_id"));
				bd.setPro_id(rs.getInt("pro_id"));
				bd.setPro_count(rs.getInt("pro_count"));
				bd.setPrice(rs.getInt("price"));
				bd.setPro_name(rs.getString("pro_name"));
				list.add(bd);
			}
		} catch (SQLException e) {
			System.out.println("주문내역이 없습니다.");
		}
		return list;
	}

	// 결제 상품들을 주문한 목록(orderTable)에 집어넣기
	public void inBasket(String cus_id, int pro_id, int pro_count,int price, String pro_name) {
		String sql = "insert into ordertable values(?,?,?,?,?)";
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
}
