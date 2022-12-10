package com.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.model.RoleModel;

public class RoleDAO extends DAO{
	public ArrayList<RoleModel> getAllRoles() {
		String sql = "SELECT * FROM role";
		ArrayList<RoleModel> list = new ArrayList<>();

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				RoleModel role = new RoleModel();
				role.setId(rs.getInt(1));
				role.setName(rs.getString(2));
				role.setCode(rs.getString(3));
				
				list.add(role);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
