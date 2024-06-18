package days06.mvc.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import days06.mvc.domain.proDTO; 

public class proDAOImpl implements proDAO{

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// 1. 생성자를 통한 DI
	public proDAOImpl(Connection conn) {
		this.conn = conn;
	} 

	// 2. Setter를 통한 DI
	public void setConn(Connection conn) {
		this.conn = conn;
	} 
	// 2-2. Getter
	public Connection getConn() {
		return this.conn;
	}

	@Override
	public ArrayList<proDTO> select() throws SQLException {
		ArrayList<proDTO> list = null;

		 long 		id;
		 String 	categoryId;         
		 long 		specialPriceId;  
		 long 		shippingOptionId;  
		 String 	sellerStoreId; 
		 String   	brandId;
		 String   	pdName;
		 String 	pcontent;
		 Date 		updateDay;        
		

		String sql = " SELECT * FROM product " ;
		try {
			pstmt = conn.prepareStatement(sql); 
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<>();
				do {

					
					id = rs.getLong(1);               
					categoryId = rs.getString(2);     
					specialPriceId = rs.getLong(3);
					shippingOptionId = rs.getLong(4);
					sellerStoreId = rs.getString(5);
					brandId = rs.getString(6) ;    
					pdName = rs.getString(7) ;          
					pcontent = rs.getString(8) ;      
					updateDay = rs.getDate(9);       
					
					proDTO dto = proDTO.builder()
							.id(id)
							.categoryId(categoryId)
							.specialPriceId(specialPriceId)
							.shippingOptionId(shippingOptionId)
							.sellerStoreId(sellerStoreId)
							.brandId(brandId)
							.pdName(pdName)
							.pcontent(pcontent)
							.updateDay(updateDay)
							.build();
					list.add(dto);
					System.out.println("담김?");
				} while (rs.next());

			} // if 

		} catch (SQLException e) { 
			e.printStackTrace();
		} catch( Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}			
		}

		return list;
	}

	@Override
	public ArrayList<proDTO> select(int currentPage, int numberPerPage) throws SQLException {
		
		return null;
	}

	@Override
	public int getTotalPages(int numberPerPage) throws SQLException {
	
		return 0;
	}

	@Override
	public int getTotalPages(int numberPerPage, int searchCondition, String searchWord) throws SQLException {
		
		return 0;
	}

	

}




