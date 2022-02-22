package com.example.test.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.test.vo.User;


@Mapper
public interface UploadMapper {
	//파일 업로드하여 DB에 저장.
	int fileuplaod(Map<String, Object> paramMap);
	
	//전체성곤한 파일 select
	List<User> ajaxdbfile();
	
	// 중복검사
	int countId(String id);
	
	//실패한 레코드만 select
	User falseId(String id);
	
	

}
