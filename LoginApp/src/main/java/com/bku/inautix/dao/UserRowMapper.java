package com.bku.inautix.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;


import com.bku.inautix.model.Usermodel;


public class UserRowMapper implements RowMapper<Usermodel> {
	public Usermodel mapRow(ResultSet rs, int rowNum) throws SQLException {
		Usermodel obj = new Usermodel();		
		obj.setUsername(rs.getString("username"));
		obj.setPassword(rs.getString("password"));
		obj.setFname(rs.getString("fname"));
		obj.setLname(rs.getString("lname"));
		obj.setAddress(rs.getString("address"));
		obj.setGender(rs.getString("gender"));
		obj.setCountry(rs.getString("country"));
				
		return obj;
	}
}
