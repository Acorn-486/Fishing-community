package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO {
	
	private Connection con;
	private ResultSet rs;
	
	/* MYSQL 접속요청 */
	public ProductDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/FISHING";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getNext() {
		String SQL = "SELECT productID FROM product ORDER BY productID DESC";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Product> getRodList(int pageNumber) {
		String SQL = "SELECT * FROM product WHERE productID < ? AND productCategory = ? ORDER BY productID DESC LIMIT 10";
		ArrayList<Product> list = new ArrayList<Product>();
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			pstmt.setString(2, "낚시대");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProductID(rs.getInt(1));
				product.setProductName(rs.getString(2));
				product.setProductPrice(rs.getString(3));
				product.setProductDetail(rs.getString(4));
				product.setProductCategory(rs.getString(5));
				product.setProductStock(rs.getString(6));
				product.setProductImage(rs.getString(7));
				product.setUserID(rs.getString(8));
				list.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Product> getReelList(int pageNumber) {
		String SQL = "SELECT * FROM product WHERE productID < ? AND productCategory = ? ORDER BY productID DESC LIMIT 10";
		ArrayList<Product> list = new ArrayList<Product>();
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			pstmt.setString(2, "릴");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProductID(rs.getInt(1));
				product.setProductName(rs.getString(2));
				product.setProductPrice(rs.getString(3));
				product.setProductDetail(rs.getString(4));
				product.setProductCategory(rs.getString(5));
				product.setProductStock(rs.getString(6));
				product.setProductImage(rs.getString(7));
				product.setUserID(rs.getString(8));
				list.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM product WHERE productID < ?";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public int add(String productName, String productPrice, String productDetail, String productCategory, String productStock, String productImage, String userID) {
		String SQL = "INSERT INTO product VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, productName);
			pstmt.setString(3, productPrice);
			pstmt.setString(4, productDetail);
			pstmt.setString(5, productCategory);
			pstmt.setString(6, productStock);
			pstmt.setString(7, productImage);
			pstmt.setString(8, userID);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public Product getProduct(int productID) {
		String SQL = "SELECT * FROM product WHERE productID = ?";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, productID);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				Product product = new Product();
				product.setProductID(rs.getInt(1));
				product.setProductName(rs.getString(2));
				product.setProductPrice(rs.getString(3));
				product.setProductDetail(rs.getString(4));
				product.setProductCategory(rs.getString(5));
				product.setProductStock(rs.getString(6));
				product.setProductImage(rs.getString(7));
				product.setUserID(rs.getString(8));
				return product;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int productID, String productName, String productPrice, String productDetail, String productStock, String productImage) {
		String SQL = "UPDATE product SET productName = ?, productPrice = ?, productDetail = ?, productStock = ?, productImage = ? WHERE productID = ?";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, productName);
			pstmt.setString(2, productPrice);
			pstmt.setString(3, productDetail);
			pstmt.setString(4, productStock);
			pstmt.setString(5, productImage);
			pstmt.setInt(6, productID);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int productID) {
		String SQL = "DELETE FROM product WHERE productID = ?";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, productID);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
}
