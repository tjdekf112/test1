package com.example.test.controller;

import java.util.List;
import java.util.Map;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.example.test.mapper.UploadMapper;
import com.example.test.service.UploadService;

@Controller
public class FormController {
	@Autowired UploadService uploadService;
	@Autowired UploadMapper uploadMapper;

	//업로드 화면으로.
	@GetMapping("/getupload")
	public String getUpload() {
		return "upload";
	}
	
	//업로드 클릭한다면..
	@PostMapping("/postupload")
	public String postupload(List<MultipartFile> upfile, Model model){
		System.out.println(upfile.toString() + "count debug");
		Map<String, Object> upload = uploadService.uploadFile(upfile);
		
		int test = (int) upload.get("falseCount");
		// 틀린 횟수가 없다면
		if(test == 0){
		return "redirect:/result?result="+ upload.get("result");
		}
		
		//모델이 키값과 value값을 입력.
//		model.addAttribute("user1", upload.get("user1"));
		model.addAttribute("list", upload.get("list"));
		model.addAttribute("result", upload.get("result"));
		model.addAttribute("falseCount",upload.get("falseCount"));
		// 틀린 횟수가 1개라도 있다면.
		return "false";
		}
	
	// 전체 결과 수 + 조회 클릭 버튼이 있는 html로
	@GetMapping("/result")
	public  String result(Model model , int result) {
		System.out.println(result + "result count");
		model.addAttribute("result", result);
		return "result";
	}
	
	//restController로
	@PostMapping("/rest")
	public String postrest() {
		return "redirect:/rest";
	}
	
	//전체 조회 table출력하는 곳.
	@GetMapping("/rest")
	public String getrest() {
		return "rest";
	}

}
