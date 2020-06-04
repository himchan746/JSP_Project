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
	
	public int getProductPrice(String proId) throws SQLException {
		String sql = "select pro_price from productinfo where pro_id =?";
		ps = con.prepareStatement(sql);
		ps.setString(1, proId);
		rs=ps.executeQuery();
		rs.next();
		return  rs.getInt(1);
	}
	
	//결재 완료 시 productinfo 에 있는 물품 수량 감소, click +1
		public void updateProduct(int proId,int cnt) {
			String sql = "update productinfo set pro_count=pro_count-?,click=click+? where pro_id=?";
			try {
				ps = con.prepareStatement(sql);
				ps.setInt(1, cnt);
				ps.setInt(2, cnt);
				ps.setInt(3, proId);
				ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//상품 주문 시 재고 여유 있는지 확인 메서드
		public String productCountCheck(int cnt,int proId) {
			String sql = "select pro_count from productinfo where pro_id=?";
			String msg = null;
			try {
				ps = con.prepareStatement(sql);
				ps.setInt(1, proId);
				rs = ps.executeQuery();
				while(rs.next()) {
					if(rs.getInt("pro_count")==0) {
						msg = "품절입니다";
					}else {
						if((rs.getInt("pro_count")-cnt)<0) {
							msg = "수량이 부족합니다";
						}
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return msg;
		}
		
		
}
