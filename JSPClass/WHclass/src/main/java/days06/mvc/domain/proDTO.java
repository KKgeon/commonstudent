package days06.mvc.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class proDTO {
	
	private long id;
	private String categoryId;         
	private long specialPriceId;  
	private long shippingOptionId;  
	private String sellerStoreId; 
	private String   brandId;
	private String   pdName;
	private String pcontent;
	private Date updateDay;        
	
}
