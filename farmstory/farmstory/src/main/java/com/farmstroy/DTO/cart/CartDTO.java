package com.farmstroy.DTO.cart;

import java.math.BigDecimal;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartDTO {
	private String path;
	private String fileName;
	private String type;
	private String prod_name;
	private int quantity;
	private int discount;
	private BigDecimal point;
	private BigDecimal price;
	private BigDecimal sum;
	private int cart_idx;
	private String uid;
	private int cart_item_idx;
	private int savePoint;
}