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
	
	@GetMapping("/search")
	public List<User> getsearch(Model model){
		System.out.println("test" );
		// 전체 성공한 dbfile의 데이터 출력
		List<User> user = uploadMapper.ajaxdbfile();
		
		model.addAttribute("user", user);
		System.out.println(user.toString());
		
		return user;
		
	}
	
}
