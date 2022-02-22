package com.example.test.controller;

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

	@GetMapping("/getupload")
	public String getUpload() {
		return "upload";
	}
	
	@PostMapping("/postupload")
	public String postupload(MultipartFile upfile, Model model){

		Map<String, Object> upload = uploadService.uploadFile(upfile);

		int test = (int) upload.get("falseCount");
		// 틀린 횟수가 없다면
		if(test == 0){
		return "redirect:/result?result="+ upload.get("result");
		}
		
		//모델이 키값과 value값을 입력.
		model.addAttribute("user1", upload.get("user1"));
		model.addAttribute("list", upload.get("list"));
		model.addAttribute("result", upload.get("result"));
		model.addAttribute("falseCount",upload.get("falseCount"));
		// 틀린 횟수가 1개라도 있다면.
		return "false";
			
		}
	
	
	@GetMapping("/result")
	public  String result(Model model , int result) {
		System.out.println(result + "result count");
		model.addAttribute("result", result);
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
	
//	@GetMapping("/false")
//	public String getfalse(Model model, String result, String falseCount) {
//		
//		
//		model.addAttribute("result", result);
//		model.addAttribute("falsecount", falseCount);
//		
//		System.out.println(model.toString() + "model");
//		return "false";
//	}
}
