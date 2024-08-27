package com.farmstroy.util;

public class SQL {
	
	public static final String SELECT_TERMS = "select * from terms";
	public static final String SELECT_COUNT_USER = "SELECT COUNT(*) FROM `user` ";
	public static final String WHERE_UID  = "WHERE `uid`=?";
	public static final String WHERE_NICK = "WHERE `nick`=?";
	public static final String WHERE_EMAIL = "WHERE `email`=?";
	public static final String WHERE_HP = "WHERE `hp`=?";
	
	public static final String SELELT_USER = "select * from member where uid =? and pass=SHA2(?,256)";
	public static final String INSERT_USER = "insert into user set "
											+ "`uid` = ?, "
											+ "`pass` = SHA2(?, 256), "
											+ "`name` = ?, "
											+ "`nick` = ?, "
											+ "`email` = ?, "
											+ "`point` = 0, "
											+ "`hp` = ?, "
											+ "`zip` = ?, "
											+ "`addr1` = ?, "
											+ "`addr2` = ?, "
											+ "`regip` = ?, "
											+ "`regDate` = NOW()";
	
	public static final String SELECT_USERS = "select * from member order by regDate limit 3";
	public static final String SELECT_PRODUCTS = "select * from product order by regDate limit 3";
	public static final String SELECT_ORDERS = "SELECT O.order_idx, P.prod_name, O.price, O.quantity, P.deliveryFee, O.total_price, O.uid, O.order_rdate "
											 + "FROM `order` AS O "
											 + "JOIN `product` AS P "
											 + "ON O.prod_idx = P.prod_idx order by O.order_rdate limit 3";
	
	public static final String SELECT_PROD_LIST = "SELECT PF.`path`, PF.filename, P.prod_idx, P.prod_name, P.`type`, P.price, P.stock, P.regDate FROM product AS P JOIN product_file AS PF ON P.prod_idx = PF.prod_idx";
	
}
