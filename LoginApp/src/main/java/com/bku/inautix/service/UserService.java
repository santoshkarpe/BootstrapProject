package com.bku.inautix.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bku.inautix.dao.impl.UserDAOImpl;
import com.bku.inautix.model.Usermodel;

@RestController
public class UserService {

	@Autowired
	UserDAOImpl userDAOImpl;
	
	static{
		System.out.println("\n\tIn static block");
	}

    @RequestMapping(value = "/users")
	public List<Usermodel> getusers() {
    	System.out.println("\n\tBefore getusers();");
		List<Usermodel> list = userDAOImpl.getusers();
		System.out.println("\n\tAfter getusers();");
		
      return list;
	 }	
	
    
    //show details 
    
    @RequestMapping(value = "/details")
	public List<Usermodel> display() {
    	System.out.println("\n\tBefore display();");
		List<Usermodel> list = userDAOImpl.display();
		
		
		System.out.println("\n\tIn display Service;");

		
		for(int i=0;i<list.size();i++)
		{
			System.out.println("\n\t First Name= "+list.get(i).getFname()+"/n/t Last Name= "+list.get(i).getLname()+"/n/t Address= "+list.get(i).getAddress()+"/n/t Gender= "+list.get(i).getGender()+"/n/t Country= "+list.get(i).getCountry());
		}
		
		System.out.println("\n\tAfter display();");
		
      return list;
	 }	
    
    
    

    @RequestMapping("login/{username}/{password}")
    public int login(@PathVariable("username") String username, @PathVariable("password") String password){
		System.out.println("in service");
    	int user = userDAOImpl.login(username,password);
    	
    	return user;
    	//System.out.println("hiiii");
    	
    	/*
    	System.out.println(user);
    	
    	if(!user)
    	{
    		System.out.println(user);
    		return " Login Succesfull-1234";
    	}
    	else
    	{
    		System.out.println(user);
    		return "Invalid Username And Password";
    	}*/
    	
    }
    
    
   
    
//delete service
    
    
    @RequestMapping("del/{userdel}")
    public int del(@PathVariable("userdel") String username){
		System.out.println("in service");
    	int user = userDAOImpl.del(username);
    	//System.out.println("\n\t"+user.getUsername()+" "+user.getPassword());
    	return user;
    	/*
    	if(!user)
    	{
    		System.out.println(user);
    		return 1 ;
    	}
    	else
    	{
    		System.out.println(user);
    		return 5;
    	}*/
    	
    }
    
    
    //Edit service
    
    
    @RequestMapping("edituser/{userdel}")
    public List<Usermodel> edituser(@PathVariable("userdel") String username){
		System.out.println("in service");
    	List<Usermodel> user = userDAOImpl.edituser(username);
    	
    	
    //	System.out.println("\n\t"+user.getUsername()+" "+user.getPassword());
    	return user;
    	/*
    	if(!user)
    	{
    		System.out.println(user);
    		return 1 ;
    	}
    	else
    	{
    		System.out.println(user);
    		return 5;
    	}*/
    	
    }
    
    
    
    
    
    
    
    
    
    
    @RequestMapping("insert/{username}/{password}/{fname}/{lname}/{address}/{gender}/{country}")
    public int insert(@PathVariable("username") String username,@PathVariable("password") String password,@PathVariable("fname") String fname, @PathVariable("lname") String lname,@PathVariable("address") String address,@PathVariable("gender") String gender,@PathVariable("country") String country){
		//System.out.println("in service confirm");
		
		//System.out.println("\n\thahahahahahaha;");

		
		
    	int result1= userDAOImpl.insertapplogin(username,password);
    	int result= userDAOImpl.insertUserDetails(fname,lname,address,gender,country,username);
    	
    	if(result==1 &&  result1==1)
    		
    	{
    		return 1;
    		
    	}
    	else
    		return 0;
    	//return result;
    	//return result1;
    	
    	/*
    	System.out.println("\n\t"+result);
    	System.out.println("\n\t"+result1);
    	
    	if(result>0)
    	{
    		return 1;
    		
    	}
    	return 0;
    	
    	*/
    }
    
    
    
    @RequestMapping("update/{username}/{password}/{fname}/{lname}/{address}/{gender}/{country}")
    public int update(@PathVariable("username") String username,@PathVariable("password") String password,@PathVariable("fname") String fname, @PathVariable("lname") String lname,@PathVariable("address") String address,@PathVariable("gender") String gender,@PathVariable("country") String country){
		//System.out.println("in service confirm");
		
		//System.out.println("\n\thahahahahahaha;");

		
		
    	
    	int result= userDAOImpl.updateuserdetails(fname,lname,address,gender,country,username);
    	int result1= userDAOImpl.updateapplogin(username,password);
    	
    	
    	if(result==1 )
    		
    	{
    		return 1;
    		
    	}
    	else
    		return 0;
    	//return result;
    	//return result1;
    	
    	/*
    	System.out.println("\n\t"+result);
    	System.out.println("\n\t"+result1);
    	
    	if(result>0)
    	{
    		return 1;
    		
    	}
    	return 0;
    	
    	*/
    }
    
    
    
    
    
    

    
}
