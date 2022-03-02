package com.example.test.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.test.service.SingUpService;
import com.example.test.vo.User;


@Controller
public class LoginController {
	@Autowired SingUpService singUpService;
	
	
	@GetMapping("/singup")
	public String getsingup() {
		return "singup";
	}
	
	@PostMapping("/singup")
	public String singup(User user) {

		singUpService.singup(user);
		System.out.println("성공!");
		return "redirect:/login";
	}
	
	@GetMapping("/login")
	public String getlogin(HttpSession session) {

		return "login";
	}
	
	@PostMapping("login")
	public String postlogin(HttpSession session, User user) {
		System.out.println("user : debug" + user.toString());
		
		User loginMember = singUpService.login(user);
		// 로그인 시 테이블에 해당하는 ID,PW가 없을 시 리턴.
		if(loginMember ==  null) {
			return "redirect:/login";
		}
		
		// 세션에 로그인한 계정의 id를 저장.
		session.setAttribute("loginMemberId", loginMember.getId());

		return "redirect:/index";
	}
	
	@GetMapping("/index")
	public String index(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("loginMemberId");


		model.addAttribute("memberId", memberId);
		
		//세션이 있다면 index로 접속 가능
		if(memberId != null) {
		return "index";
		}

		// 세션이 없다면 로그인 창으로.
		return "redirect:/login";
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		// 세션 종료
		session.invalidate();
		return "redirect:/login";
	}
}
