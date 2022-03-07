package com.example.test.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.test.mapper.UploadMapper;
import com.example.test.service.UploadService;
import com.example.test.vo.User;

@RestController
public class SearchController {
	@Autowired UploadMapper uploadMapper;
	@Autowired UploadService uploadService;
	
	// 전체성공한 DB의 데이터를 grid형태로 출력
	@GetMapping("/search")
	public List<User> getsearch(Model model){
		System.out.println("test" );
		// 전체 성공한 dbfile의 데이터 출력
		List<User> user = uploadService.returnId();
		
//		model.addAttribute("user", user);
		System.out.println(user.toString() + "시험입니다.");
		//user 값 리턴
		return user;
		
	}
	// 업로드에 실패한 데이터 출력.
	@GetMapping("/false")
	public List<User> getfalse(Model model){
		List<User> user1 = uploadService.returnFalse();
		System.out.println(user1.toString() + "controller toString");
		model.addAttribute("user1",user1);
		//user1의 데이터를 ajax로 반환.
		return user1;
		
	}
	
}
