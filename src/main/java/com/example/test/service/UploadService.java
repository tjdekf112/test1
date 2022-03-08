package com.example.test.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
	
	ArrayList<String> returnId = new ArrayList<String>();
	List<User> user1 = new ArrayList<>();
	   int i =0;
	   File convFile = null;
	   
	@SuppressWarnings("unlikely-arg-type")
	public Map<String, Object> uploadFile(List<MultipartFile> upfile) {
		   Map<String, Object> paramMap = new HashMap<>();
		   Map<String, Object> returnMap = new HashMap<>();
		   
		   returnId = new ArrayList<String>();
		   user1 = new ArrayList<>();
		   i = 0;
		   convFile = null;
		   int result = 0;
		   int resultCount = 0;
		   int falseCount =0;
		   int totalCount =0;
		   int recodeCount =0;
		   int k =0;
		   // list 선언.
		   List<Object> list = null;
		   list = new ArrayList<Object>();
		   for(i =0; i< upfile.size(); i++) {
		 convFile = new File(upfile.get(i).getOriginalFilename());
		   }
		 try { 
			convFile.createNewFile();
//			파일을 생성한다. 존재하는 파일일 경우 덮어쓰기함.
			FileOutputStream fos = new FileOutputStream(convFile); 
			//입력받은 내용을 파일 내용으로 기록.
			for(k = 0; k<upfile.size(); k++) {
			fos.write(upfile.get(k).getBytes());
			}
			fos.close();
		} catch (IOException e1) {
			e1.printStackTrace();
		} 
		 
		// 형 변환한 파일 읽기
  	    try {
  	    	// scan을 사용하면 한번에 읽기가 가능함.
  	    	Scanner scan = new Scanner(convFile);
           while(scan.hasNextLine()){
        	   totalCount++;
               String test = scan.nextLine();
               
               //split을 사용하여 '/'단위로 자르기.
               String[] array = test.split("/");        

               String id = array[0];
               String pwd = array[1];
               String name = array[2];
               String level = array[3];
               String desc = array[4];
               String redDate = array[5];
               // id의 값 리스트에 입력. 전체 성공시 조회에서 where절에 들어갈 id값임.
	       	   returnId.add(id);
	           
	           paramMap.put("id", id);
               paramMap.put("pwd", pwd);
               paramMap.put("name", name);
               paramMap.put("level", level);
               paramMap.put("desc", desc);

               //list type의 user1에 실패한 레코드 입력.
               user1.add(uploadMapper.falseId(id));
               //null이 있을경우 사라지게함.
               user1.removeAll(Arrays.asList("", null));
               // String형을 date형으로 변환.
               SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
               try {
            	   
				Date day = transFormat.parse(redDate);
	               paramMap.put("day", day);
	               
	               //중복체크.
	               int countId = uploadMapper.countId(id);
	               
	               // 중복이 아니라면.
		               if(countId == 0) {
		            	   // 업로드
		               resultCount = uploadMapper.fileuplaod(paramMap);
		               // 성공횟수.
		               result = result + resultCount;
		               } 
		               
	               //중복이라면
		               else if(countId >= 1) {
		            	   //실패횟수
			               falseCount++;
			               for(recodeCount =1; recodeCount<totalCount; recodeCount++) {
			            	   System.out.println("recodeCount   " + recodeCount);
			               }
			               // 실패한 레코드의 라인번호 list 형태로 입력.
			               list.add(recodeCount);
			    
		               }
		               
			} catch (ParseException e) {
				e.printStackTrace();
				
			}

           }
           scan.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
  	    
        returnMap.put("result", result);
        returnMap.put("falseCount", falseCount);
        returnMap.put("list", list);
        
		return returnMap;
	}
	
	// 업로드에서 전체 성공한 것만 보여 줌.
	public List<User> returnId() {
		List<User> testuser = new ArrayList<>();

		for(int i=0; i<returnId.size() ; i++) {
			testuser.add(uploadMapper.ajaxdbfile(returnId.get(i))); 
		}
		return testuser;
	}
	// 실패한 텍스트
	public List<User> returnFalse(){
		return user1;
	}
	
}
