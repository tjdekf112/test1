package com.example.test.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.example.test.service.UploadService;
import com.example.test.vo.User;

@Controller
public class FormController {
	@Autowired UploadService uploadService;
	

	
	@GetMapping("/getupload")
	public String getUpload() {
		return "upload";
	}
	// 모델 엔드 뷰를 사용.
	
	@PostMapping("/postupload")
	public String postupload(MultipartFile upfile, Model model){

		Map<String, Object> upload = uploadService.uploadFile(upfile);
		System.out.println("toString+++++" + upload.toString());
//		trueCount = upload.get("trueCount");
//		totalCount = upload.get("totalCount");

		
		System.out.println(upload.get("totalCount") + "totalCount!!@@");
		if(upload.get("trueCount").equals(upload.get("totalCount"))) {


		model.addAttribute("count", upload.get("count"));
		System.out.println(upload.get("count") + "count!@#");
		return "redirect:/result?count="+ upload.get("count");
		
		//파일 업로드하는데 오류가 생긴다면...
		//3개중 1개만 중복되지 않은 파일이라면 실패하고 1개는 DB에 값이 들어감.
		}else{
			
			System.out.println(upload.get("trueCount") + "trueCount!!@@##$$");
			System.out.println(upload.get("falseCount") + "falseCount!!@@");
			return "redirect:/false?trueCount="+ upload.get("trueCount") + "&falseCount=" + upload.get("falseCount");
		}
		
		
		
	}
	
	@GetMapping("/result")
	public  String result(Model model , int count) {
		System.out.println(count + "result count");
		model.addAttribute("count", count);
		return "result";
	}
	
	
	@PostMapping("/rest")
	public String postrest() {
		return "redirect:/rest";
	}
	
	@GetMapping("/rest")
	public String getrest() {
		return "rest";
	}
	
	@GetMapping("/false")
	public String getfalse(Model model, int trueCount, int falseCount) {
		model.addAttribute("trueCount", trueCount);
		model.addAttribute("falseCount", falseCount);
		
		return "false";
	}
}
