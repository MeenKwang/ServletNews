package com.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.model.UserModel;

public class UserDAO extends DAO {
	public UserDAO() {
		super();
	}

	public UserModel checkLogin(UserModel user) {
		UserModel userLogin = new UserModel();
		String sql = "SELECT  id, fullname, roleid FROM user WHERE username = ? AND password = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getPassword());

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				userLogin.setId(rs.getInt("id"));
				userLogin.setFullName(rs.getString("fullname"));
				userLogin.setRoleid(rs.getInt("roleid"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userLogin;
	}

	public boolean register(UserModel user) {
		String sql = "INSERT INTO user ( username, password, fullname, status, roleid, createddate, modifieddate, createdby, modifiedby ) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getFullName());
			ps.setInt(4, user.getStatus());
			ps.setLong(5, user.getRoleid());
			ps.setTimestamp(6, user.getCreatedDate());
			ps.setTimestamp(7, user.getModifiedDate());
			ps.setString(8,user.getCreatedBy());
			ps.setString(9, user.getModifiedBy());

			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public ArrayList<UserModel> getAllUSer() {
		String sql = "SELECT * FROM user";
		ArrayList<UserModel> userList = new ArrayList<>();
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				UserModel user = new UserModel();
				user.setId(rs.getInt("id"));
				user.setUserName(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setFullName(rs.getString("fullname"));
				user.setStatus(rs.getInt("status"));
				user.setRoleid(rs.getInt("roleid"));
				user.setCreatedDate(rs.getTimestamp("createddate"));
				user.setCreatedBy(rs.getString("createdby"));
				user.setModifiedDate(rs.getTimestamp("modifieddate"));
				user.setModifiedBy(rs.getString("modifiedby"));
				
				userList.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return userList;
	}
	
	public int updateUser(UserModel user) {
		int status = 0;
		String sql = "UPDATE user SET fullname = ?, status = ?, roleid = ?, modifieddate = ?, modifiedby = ? WHERE id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getFullName());
			ps.setInt(2, user.getStatus());
			ps.setLong(3, user.getRoleid());
			ps.setTimestamp(4, user.getModifiedDate());
			ps.setString(5, user.getModifiedBy());
			ps.setLong(6, user.getId());
			
			status = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public int deleteUser(Long id) {
		int status = 0;
		try {
			PreparedStatement ps = con.prepareStatement("delete from user where id=?");
			ps.setLong(1, id);
			status = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public UserModel getUserById(int id) {
		String sql = "SELECT * FROM user WHERE id = ?";
		UserModel userFix = new UserModel();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				userFix.setId(rs.getInt("id"));
				userFix.setUserName(rs.getString("username"));
				userFix.setPassword(rs.getString("password"));
				userFix.setFullName(rs.getString("fullname"));
				userFix.setStatus(rs.getInt("status"));
				userFix.setRoleid(rs.getInt("roleid"));
				userFix.setCreatedDate(rs.getTimestamp("createddate"));
				userFix.setCreatedBy(rs.getString("createdby"));
				userFix.setModifiedDate(rs.getTimestamp("modifieddate"));
				userFix.setModifiedBy(rs.getString("modifiedby"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return userFix;
	}

	public int createUser(UserModel userFix) {
		String sql = "INSERT INTO user ( username, password, fullname, status, roleid, createddate, createdby) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, userFix.getUserName());
			ps.setString(2, userFix.getPassword());
			ps.setString(3, userFix.getFullName());
			ps.setInt(4, userFix.getStatus());
			ps.setLong(5, userFix.getRoleid());
			ps.setTimestamp(6, userFix.getCreatedDate());
			ps.setString(7, userFix.getCreatedBy());

			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
	}
}
