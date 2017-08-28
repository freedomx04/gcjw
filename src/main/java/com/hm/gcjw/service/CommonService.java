package com.hm.gcjw.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface CommonService {

	/**
	 * 图片通用处理方法
	 */
	String saveImage(MultipartFile uploadImage) throws IOException;
	
	void updateImage(String path, MultipartFile uploadImage) throws IOException;
	
	void deleteImage(String path) throws IOException;
	
	
	/**
	 * 文件通用处理方法
	 */
	void deleteFile(String path) throws IOException;
	
}
