package com.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.model.CategoryModel;

public class CategoryDAO extends DAO{
	public ArrayList<CategoryModel> getAllCategories() {
		String sql = "SELECT * FROM category";
		ArrayList<CategoryModel> list = new ArrayList<>();

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CategoryModel category = new CategoryModel();
				category.setId(rs.getInt(1));
				category.setName(rs.getString(2));
				category.setCode(rs.getString(3));
				
				list.add(category);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
