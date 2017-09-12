package com.njiu.cs.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.njiu.cs.domain.User;

@MapperScan
public interface UserDao {
	
	public User findByUsername(String username);
	
	public List<User> findAllUser();
	
	public void deleteUser(String id);

}
