package com.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.model.NewsModel;

public class NewsDAO extends DAO {
	public NewsDAO() {
		super();
	}

	public int save(NewsModel news) {
		int status = 0;
		try {
			PreparedStatement ps = con
					.prepareStatement("insert into news(title,thumbnail,shortdescription,content,categoryid,createddate,createdby) values (?,?,?,?,?,?,?)");
			ps.setString(1, news.getTitle());
			ps.setString(2, news.getThumbnail());
			ps.setString(3, news.getShortDescription());
			ps.setString(4, news.getContent());
			ps.setLong(5, news.getCategoryId());
			ps.setTimestamp(6, news.getCreatedDate());
			ps.setString(7, news.getCreatedBy());

			status = ps.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public int update(NewsModel news) {
		int status = 0;
		try {
			PreparedStatement ps = con.prepareStatement(
					"update news set title=?, thumbnail=?, shortdescription=?, content=?, categoryid=?, modifieddate=?, modifiedby=? where id=?");
			ps.setString(1, news.getTitle());
			ps.setString(2, news.getThumbnail());
			ps.setString(3, news.getShortDescription());
			ps.setString(4, news.getContent());
			ps.setLong(5, news.getCategoryId());
			ps.setTimestamp(6, news.getModifiedDate());
			ps.setString(7, news.getModifiedBy());
			ps.setLong(8, news.getId());
			status = ps.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public int delete(int id) {
		int status = 0;
		try {
			PreparedStatement ps = con.prepareStatement("delete from news where id=?");
			ps.setLong(1, id);
			status = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public NewsModel getNewsById(int id) {
		NewsModel news = new NewsModel();

		try {
			PreparedStatement ps = con.prepareStatement("select * from news where id=?");
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				news.setId(rs.getInt(1));
				news.setTitle(rs.getString(2));
				news.setThumbnail(rs.getString(3));
				news.setShortDescription(rs.getString(4));
				news.setContent(rs.getString(5));
				news.setCategoryId(rs.getInt(6));
				news.setCreatedDate(rs.getTimestamp(7));
				news.setModifiedDate(rs.getTimestamp(8));
				news.setCreatedBy(rs.getString(9));
				news.setModifiedBy(rs.getString(10));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return news;
	}

	public ArrayList<NewsModel> getAllNews() {
		ArrayList<NewsModel> list = new ArrayList<>();

		try {
			PreparedStatement ps = con.prepareStatement("select * from news");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				NewsModel news = new NewsModel();
				news.setId(rs.getInt(1));
				news.setTitle(rs.getString(2));
				news.setThumbnail(rs.getString(3));
				news.setShortDescription(rs.getString(4));
				news.setContent(rs.getString(5));
				news.setCategoryId(rs.getInt(6));
				news.setCreatedDate(rs.getTimestamp(7));
				news.setModifiedDate(rs.getTimestamp(8));
				news.setCreatedBy(rs.getString(9));
				news.setModifiedBy(rs.getString(10));
				list.add(news);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public ArrayList<NewsModel> getNewsByCategoryId(int categoryId) {
		ArrayList<NewsModel> list = new ArrayList<>();

		try {
			PreparedStatement ps = con.prepareStatement("select * from news where categoryid = ?");
			ps.setLong(1, categoryId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				NewsModel news = new NewsModel();
				news.setId(rs.getInt(1));
				news.setTitle(rs.getString(2));
				news.setThumbnail(rs.getString(3));
				news.setShortDescription(rs.getString(4));
				news.setContent(rs.getString(5));
				news.setCategoryId(rs.getInt(6));
				news.setCreatedDate(rs.getTimestamp(7));
				news.setModifiedDate(rs.getTimestamp(8));
				news.setCreatedBy(rs.getString(9));
				news.setModifiedBy(rs.getString(10));
				list.add(news);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;		
	}
}
