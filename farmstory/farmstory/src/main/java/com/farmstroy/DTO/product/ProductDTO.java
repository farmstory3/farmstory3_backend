package com.farmstroy.DTO.product;

import java.math.BigDecimal;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {
	private int prod_idx;
	private String prod_name;
	private String nickname;
	private String type;
	private BigDecimal price;
	private BigDecimal point;
	private BigDecimal deliveryFee;
	private String regDate;
	private int stock;
	private String etc;
	private int discount;
	private List<ProductFileDTO> prod_file;
	
	
	
	
}