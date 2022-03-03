package com.example.test.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.test.vo.User;

@Mapper
public interface SingUpMapper {
	//회원 가입
	void singup(User user);
	// 로그인
	User login(User user);
	// 중복 아이디 체크
	int idcheck(String id);
}
