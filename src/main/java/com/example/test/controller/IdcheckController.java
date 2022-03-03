package com.example.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.test.service.SingUpService;

@RestController
public class IdcheckController {
	@Autowired SingUpService singUpService;
	
	@PostMapping("/idcheck")
	public int idcheck(String id) {
		System.out.println(id + "id");
		int str = 0;
		int idcheck = singUpService.idcheck(id);
		// 중복된 이라면
		if(idcheck >= 1) {
			str = 1;
		// 중복된 값이 아니라면
		}else if(idcheck == 0) {
			str = 0;
		}
		return str;
	}
}
