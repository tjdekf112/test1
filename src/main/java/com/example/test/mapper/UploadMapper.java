package com.example.test.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.test.vo.User;


@Mapper
public interface UploadMapper {
	//파일 업로드하여 DB에 저장.
	int fileuplaod(Map<String, Object> paramMap);

	List<User> ajaxdbfile();
	
	int countId(String id);
	
	int totalCount();
}
