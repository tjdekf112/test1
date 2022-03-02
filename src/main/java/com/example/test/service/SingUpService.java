package com.example.test.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.example.test.mapper.SingUpMapper;
import com.example.test.vo.User;


@Service
public class SingUpService {
	@Autowired SingUpMapper singUpMapper;
	
	//회원 가입
	public void singup(User user) {
		System.out.println("user" + user.toString()+ "@#$@");
		//회원가입\
		
		singUpMapper.singup(user);
	}
	
	//login
	public User login(User user) {

		System.out.println("debug : "+singUpMapper.login(user));
		return singUpMapper.login(user);
	}
	
	public int idcheck(String id) {
		
		int idcheck = singUpMapper.idcheck(id);
		
		return idcheck;
	}
}
