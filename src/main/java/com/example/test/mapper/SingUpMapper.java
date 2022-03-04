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
	// 관리자 유무 체크
	String levelcheck(String id);
	// 회원 탈퇴
	void delete(String id);
	
}