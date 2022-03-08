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
		singUpMapper.singup(user);
	}
	
	//login
	public User login(User user) {
		return singUpMapper.login(user);
	}
	
	// id중복체크를 위한 반환값
	public int idcheck(String id) {
		int idcheck = singUpMapper.idcheck(id);
		return idcheck;
	}
	// 관리자 유무 체크
	public String levelcheck(String id) {
		String levelcheck = singUpMapper.levelcheck(id);
		return levelcheck;
	}
	
	//회원 탈퇴
	public void delete(String id) {
		singUpMapper.delete(id);
	}
}
