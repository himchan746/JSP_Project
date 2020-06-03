import java.sql.SQLException;
import java.util.ArrayList;

import buy.BuyDTO;
import buy.OrderDAO;

public class Test {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		OrderDAO od = new OrderDAO();
		ArrayList<BuyDTO> list = od.OrderList("seungjo");
		for(BuyDTO i:list)
			System.out.println(i);
	}
}
