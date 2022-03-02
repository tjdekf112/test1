package com.example.test.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.test.vo.User;



@Mapper
public interface SingUpMapper {

	void singup(User user);
	
	User login(User user);
	
	int idcheck(String id);
}
