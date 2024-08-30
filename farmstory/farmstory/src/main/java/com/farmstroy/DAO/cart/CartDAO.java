package com.farmstroy.DAO.cart;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.farmstroy.DAO.member.MemberDAO;
import com.farmstroy.DTO.cart.CartDTO;
import com.farmstroy.util.DBHelper;
import com.farmstroy.util.SQL;

public class CartDAO extends DBHelper{
	private static CartDAO instance = new CartDAO();
	public static CartDAO getInstance() {
		return instance;
	}
	private CartDAO() {};
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	public int selectCart(String uid) {
		int cart_idx = 0;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_CART_BY_UID);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				cart_idx = rs.getInt("cart_idx");
			}
		} catch (Exception e) {
			// 
		}
		return cart_idx;
	}
	public void insertCart(CartDTO cart) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_INTO_CART);
			psmt.setInt(1, cart.getCart_idx());
			psmt.setString(2, cart.getUid());
			psmt.setString(3, cart.getPath());
			psmt.setString(4, cart.getFileName());
			psmt.setString(5, cart.getType());
			psmt.setString(6, cart.getProd_name());
			psmt.setInt(7, cart.getQuantity());
			psmt.setInt(8, cart.getDiscount());
			psmt.setBigDecimal(9, cart.getPoint());
			psmt.setBigDecimal(10, cart.getPrice());
			psmt.setBigDecimal(11, cart.getSum());
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public List<CartDTO> selectCartItems(String uid) {
		List<CartDTO> carts = new ArrayList<CartDTO>();
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_CART_ITEM_BY_UID);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CartDTO cart = new CartDTO();
				cart.setCart_idx(rs.getInt("cart_idx"));
				cart.setDiscount(rs.getInt("discount"));
				cart.setFileName(rs.getString("filename"));
				cart.setPath(rs.getString("path"));
				cart.setPoint(rs.getBigDecimal("point"));
				cart.setPrice(rs.getBigDecimal("price"));
				cart.setProd_name(rs.getString("prod_name"));
				cart.setQuantity(rs.getInt("quantity"));
				cart.setSum(rs.getBigDecimal("sum"));
				cart.setType(rs.getString("type"));
				cart.setUid(rs.getString("uid"));
				cart.setCart_item_idx(rs.getInt("cart_item_idx"));
				carts.add(cart);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		
		return carts;
	}
	public void deleteItems(Integer cartId) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.DELETE_CART_ITEMS);
			psmt.setInt(1, cartId);
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		
	}
	public CartDTO selectCartItemsSum(String uid) {
		CartDTO cartSummary = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_CART_ITEM_SUM_BY_UID);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				cartSummary = new CartDTO();
	            cartSummary.setQuantity(rs.getInt("total_quantity"));
	            cartSummary.setPrice(rs.getBigDecimal("total_price"));
	            cartSummary.setDiscount(rs.getInt("total_discount"));
	            cartSummary.setPoint(rs.getBigDecimal("total_point"));
	            cartSummary.setSavePoint(rs.getInt("total_savepoint"));
	            cartSummary.setSum(rs.getBigDecimal("total_sum"));
	            
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		return cartSummary;
	}
}