package com.njiu.cs.dao;

import org.mybatis.spring.annotation.MapperScan;

import com.njiu.cs.domain.User;

@MapperScan
public interface UserDao {
	
	public User findByUsername(String username);

}
