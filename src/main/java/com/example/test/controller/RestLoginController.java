package com.example.test.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.test.service.SingUpService;
import com.example.test.vo.User;

@RestController
public class RestLoginController {
	@Autowired SingUpService singUpService;
	
	@PostMapping("/ajaxlogin")
	public int postlogin(HttpSession session, User user) {
		System.out.println("user : debug" + user.toString());
		int num = 0;
		
		User loginMember = singUpService.login(user);
		
		// 로그인 시 테이블에 해당하는 ID,PW가 없을 시 리턴.
		if(loginMember ==  null) {
			// 로그인 실패했다면 1리턴
			num = 1;
		}
		// 세션에 로그인한 계정의 id를 저장.
		if(loginMember != null) {
			//로그인 성공했다면 0 리턴
		session.setAttribute("loginMemberId", loginMember.getId());
		}
		return num;
	}
}
