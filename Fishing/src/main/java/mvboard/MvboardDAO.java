package mvboard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import board.Board;

public class MvboardDAO {
	
	private Connection con;
	private ResultSet rs;
	
	/* MYSQL 접속요청 */
	public MvboardDAO() {
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
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		String SQL = "SELECT mvboardID FROM mvboard ORDER BY boardID DESC";
		
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
	
	public int write(String mvboardTitle, String mvboardUrl, String mvboardContent) {
		String SQL = "INSERT INTO mvboard VALUES (?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, mvboardTitle);
			pstmt.setString(3, mvboardUrl);
			pstmt.setString(4, getDate());
			pstmt.setString(5, mvboardContent);
			pstmt.setInt(6, 0);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Mvboard> getList(int pageNumber) {
		String SQL = "SELECT * FROM mvboard WHERE mvboardID < ? ORDER BY mvboardID DESC LIMIT 10";
		ArrayList<Mvboard> list = new ArrayList<Mvboard>();
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Mvboard mvboard = new Mvboard();
				mvboard.setMvboardID(rs.getInt(1));
				mvboard.setMvboardTitle(rs.getString(2));
				mvboard.setMvboardUrl(rs.getString(3));
				mvboard.setMvboardDate(rs.getString(4));
				mvboard.setMvboardContent(rs.getString(5));
				mvboard.setMvboardCnt(rs.getInt(6));
				list.add(mvboard);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Mvboard> getSearch(String searchField, String searchText) {
		String SQL = "SELECT * FROM mvboard WHERE " + searchField.trim();
		ArrayList<Mvboard> list = new ArrayList<Mvboard>();
		
		try {
			if (searchText != null && !searchText.equals("")) {
				SQL += " LIKE '%" + searchText.trim() + "%' ORDER BY mvboardID DESC LIMIT 10";
			}
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Mvboard mvboard = new Mvboard();
				mvboard.setMvboardID(rs.getInt(1));
				mvboard.setMvboardTitle(rs.getString(2));
				mvboard.setMvboardUrl(rs.getString(3));
				mvboard.setMvboardDate(rs.getString(4));
				mvboard.setMvboardContent(rs.getString(5));
				mvboard.setMvboardCnt(rs.getInt(6));
				list.add(mvboard);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM mvboard WHERE mvboardID < ?";
		
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
	
	public Mvboard getMvboard(int mvboardID) {
		String SQL = "SELECT * FROM mvboard WHERE mvboardID = ?";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, mvboardID);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				Mvboard mvboard = new Mvboard();
				mvboard.setMvboardID(rs.getInt(1));
				mvboard.setMvboardTitle(rs.getString(2));
				mvboard.setMvboardUrl(rs.getString(3));
				mvboard.setMvboardDate(rs.getString(4));
				mvboard.setMvboardContent(rs.getString(5));
				mvboard.setMvboardCnt(rs.getInt(6));
				return mvboard;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int mvboardID, String mvboardTitle, String mvboardUrl, String mvboardContent) {
		String SQL = "UPDATE mvboard SET mvboardTitle = ?, mvboardUrl = ?, mvboardContent = ? WHERE mvboardID = ?";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, mvboardTitle);
			pstmt.setString(2, mvboardUrl);
			pstmt.setString(3, mvboardContent);
			pstmt.setInt(4, mvboardID);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int mvboardID) {
		String SQL = "DELETE FROM mvboard WHERE mvboardID = ?";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, mvboardID);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public void updateBoardCnt(int mvboardID) {
		String SQL = "UPDATE mvboard SET mvboardCnt = mvboardCnt + 1 WHERE mvboardID = ?";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, mvboardID);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
