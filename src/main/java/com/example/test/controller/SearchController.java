package com.example.test.controller;

import java.util.List;
import java.util.Map;

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
	public List<User> getsearch(){
		System.out.println("test" );
		
		List<User> user = uploadMapper.ajaxdbfile();
		System.out.println(user.toString());
		
		return user;
		
	}
	
}
