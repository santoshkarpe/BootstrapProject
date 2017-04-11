package com.bku.inautix.dao.impl;

import java.sql.Types;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.bku.inautix.dao.UserRowMapper;
import com.bku.inautix.model.Usermodel;

public class UserDAOImpl {
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public List<Usermodel> getusers() {
		List<Usermodel> list = null;
		try {
			list = jdbcTemplate.query("select * from applogin",
		        new Object[]{}, //in parameters
		        new UserRowMapper());
		} catch (Throwable fault) {
			System.out.println("Got error.  Returning null (404)");
			fault.printStackTrace();
			
		}
		
      return list;
	 }	

	 public Usermodel getuser(String username, String password){
		Usermodel obj = null;
		try {
			
			System.out.println("In DAO getUser");
			obj = jdbcTemplate.queryForObject(
					"select * from final where username= ? and password= ?",
		        new Object[]{username,password}, //in parameter
		        new UserRowMapper());
		} catch (Throwable fault) {
			System.out.println("Got error.  Returning null (404)");
			fault.printStackTrace();
		}
		return obj;
	 }

	public  int login(String username, String password) {
		
		Usermodel obj = null;
		try {
			//System.out.println(username + "  " + password);
			System.out.println("In DAO Login");
			obj = jdbcTemplate.queryForObject(
					"select * from applogin,userdetails where applogin.username = ? and password = ? and applogin.username=userdetails.username ",
		        new Object[]{username,password}, //in parameter
		        new UserRowMapper());
			//System.out.println("in DAO");
		} 
		catch(org.springframework.dao.EmptyResultDataAccessException e){
			System.out.println("error");
		}
		catch (Throwable fault) {
			System.out.println("Got error.  Returning null (404)");
			fault.printStackTrace();
		}
		if(obj == null)
		{
			System.out.println("Invalid Username And Password");
		}
		else
		{
			System.out.println("Login Succesful");
			
			
			//System.out.println("\n\t"+obj.getUsername()+" "+obj.getPassword());
			return 1;
		}
		return 0;
			
	
	}
	
	
	
	
	
	// insert into userdetails
	public int insertUserDetails(String fname, String lname, String address, String gender, String country,String username)
	{
		int rows=0;
		try {
			rows = jdbcTemplate.update(
					"insert into userdetails values (?,?,?,?,?,?)",
		        new Object[]{fname,lname,address,gender,country,username}, //in parameter
		        new int[]{Types.VARCHAR, Types.VARCHAR,Types.VARCHAR, Types.VARCHAR,Types.VARCHAR,Types.VARCHAR});
		} catch (Throwable fault) {
			System.out.println("Got error.  Returning null (404)");
			fault.printStackTrace();
			
		}
		System.out.println("\n\tBefore return from DAOImpl");
		return rows;
	 }
	
	
	//inserting into applogin
	
	
	public int insertapplogin(String username, String password) {
		int rows=0;
		try {
			System.out.println("username"+ username);
			rows = jdbcTemplate.update(
					"insert into applogin values (?,?)",
		        new Object[]{username,password}, //in parameter
		        new int[]{Types.VARCHAR, Types.VARCHAR});
		} catch (Throwable fault) {
			System.out.println("Got error.  Returning null (404)");
			fault.printStackTrace();
			
		}
		//System.out.println("\n\tBefore return from DAOImpl");
		return rows;
	}
	
	
	//display details
	
	public List<Usermodel> display() {
		List<Usermodel> list = null;
		try {
			list = jdbcTemplate.query("select * from applogin,userdetails where applogin.username=userdetails.username",
		        new Object[]{}, //in parameters
		        new UserRowMapper());
		} catch (Throwable fault) {
			System.out.println("Got error.  Returning null (404)");
			fault.printStackTrace();
			
		}
		
      return list;
	 }

	
	
	// delete function
		public int del(String username) {
			// TODO Auto-generated method stub
			int rows=0;
			try {
				//System.out.println(username + "  " + password);
				System.out.println(username);
				rows = jdbcTemplate.update(
						"delete from applogin where username = ?",
			        new Object[]{username}, //in parameter
			        new int[]{Types.VARCHAR});
				
				//System.out.println("in DAO");
			} 
			catch(org.springframework.dao.EmptyResultDataAccessException e){
				System.out.println("error");
			}
			catch (Throwable fault) {
				System.out.println("Got error.  Returning null (404)");
				fault.printStackTrace();
			}
		
			return rows;
		}	
	
	
	
	
	// Edit function
	public List<Usermodel> edituser(String username) {
		// TODO Auto-generated method stub
		List<Usermodel> list = null;
		
		try {
			//System.out.println(username + "  " + password);
			//System.out.println(username);
					
			list = jdbcTemplate.query("select * from applogin,userdetails where applogin.username=userdetails.username and applogin.username=?",
			        new Object[]{username}, //in parameters
			        new UserRowMapper());
			
			//System.out.println("in DAO");
		} 
		catch(org.springframework.dao.EmptyResultDataAccessException e){
			System.out.println("error");
		}
		catch (Throwable fault) {
			System.out.println("Got error.  Returning null (404)");
			fault.printStackTrace();
		}
	
		return list;
	}

	
	//update function
	
	
	public int updateuserdetails(String fname, String lname, String address,
			String gender, String country, String username) {
		int rows=0;
		try {
			//System.out.println(username + "  " + password);
			System.out.println(username);
			rows = jdbcTemplate.update(
					"update userdetails set fname=?,lname=?,address=?,gender=?,country=?where username=?",
		        new Object[]{fname,lname,address,gender,country,username}, //in parameter
		        new int[]{Types.VARCHAR,Types.VARCHAR,Types.VARCHAR,Types.VARCHAR,Types.VARCHAR,Types.VARCHAR});
			
			System.out.println("in DAO");
		} 
		catch(org.springframework.dao.EmptyResultDataAccessException e){
			System.out.println("error");
		}
		catch (Throwable fault) {
			System.out.println("Got error.  Returning null (404)");
			fault.printStackTrace();
		}
	
			//System.out.println(rows);
		return rows;
	}

	public int updateapplogin(String username, String password) {
		
		int rows=0;
		try {
			//System.out.println(username + "  " + password);
			System.out.println(username);
			rows = jdbcTemplate.update(
					"update applogin set password=? where username=?",
		        new Object[]{username,password}, //in parameter
		        new int[]{Types.VARCHAR,Types.VARCHAR});
			
			//System.out.println("in DAO");
		} 
		catch(org.springframework.dao.EmptyResultDataAccessException e){
			System.out.println("error");
		}
		catch (Throwable fault) {
			System.out.println("Got error.  Returning null (404)");
			fault.printStackTrace();
		}
	
			//System.out.println(rows);
		return rows;
	}	
	
	
	
}
