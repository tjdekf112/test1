package com.example.test.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.test.mapper.UploadMapper;
import com.example.test.vo.User;

@Service
public class UploadService {
	@Autowired UploadMapper uploadMapper;
	
	public Map<String, Object> uploadFile(MultipartFile upfile) {
		   Map<String, Object> paramMap = new HashMap<>();
		   Map<String, Object> returnMap = new HashMap<>();
		   Map<String, Object> returnMap1 = new HashMap<>();
		   
		   int result = 0;
		   int resultCount = 0;
		   int falseCount =0;

		 File convFile = new File(upfile.getOriginalFilename());
		// 매개변수로 받은 파일을 byte형으로 형 변환
		 try {
			convFile.createNewFile();
			FileOutputStream fos = new FileOutputStream(convFile); 

			fos.write(upfile.getBytes());
			
		} catch (IOException e1) {
			e1.printStackTrace();
		} 
		// 형 변환한 파일 읽기
  	    try {
  	    	
  	    	// scan을 사용하면 한번에 읽기가 가능함.
  	    	Scanner scan = new Scanner(convFile);
           while(scan.hasNextLine()){
//        	   totalCount++;
               String test = scan.nextLine();
               System.out.println(test);
               
               //split을 사용하여 '/'단위로 자르기.
               String[] array = test.split("/");
               
               for(int i=0;i<array.length;i++) {
            	   System.out.print(array[i]+ " ");
            	   
               }
               System.out.println("");

               String id = array[0];
               String pwd = array[1];
               String name = array[2];
               String level = array[3];
               String desc = array[4];
               String redDate = array[5];
               
               paramMap.put("id", id);
               paramMap.put("pwd", pwd);
               paramMap.put("name", name);
               paramMap.put("level", level);
               paramMap.put("desc", desc);
               
               /*
               user.setId(id);
               user.setPwd(pwd);
               user.setName(name);
               user.setLevel(level);
               user.setDesc(desc);
               */
               
               
               
               // String형을 date형으로 변환.
               SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
               try {
            	   
				Date day = transFormat.parse(redDate);
	               paramMap.put("day", day);
	               System.out.println("debug : " + paramMap.toString());
	               
	               int countId = uploadMapper.countId(id);
	              
	               
	               
	               if(countId != 1) {
	               resultCount = uploadMapper.fileuplaod(paramMap);
	               result = result + resultCount;
	               
	               System.out.println(result + "result@#@");
	               } 
	               //중복이라면
	               else if(countId == 1) {
		               falseCount++;
		               System.out.println(falseCount + "falseCount@#@");
	               }

			} catch (ParseException e) {
				e.printStackTrace();
				
			}

           }

		} catch (IOException e) {
			e.printStackTrace();
		}
        returnMap.put("result", result);
        returnMap.put("falseCount", falseCount);
        System.out.println("result : " + result);
        
        
		return returnMap;
		
	}
	
}
