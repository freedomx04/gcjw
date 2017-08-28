package com.hm.gcjw.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hm.gcjw.common.PathFormat;
import com.hm.gcjw.common.utils.FileUtil;

@Service
public class CommonServiceImpl implements CommonService {
	
	static Logger log = LoggerFactory.getLogger(CommonServiceImpl.class);
	
	@Value("${customize.path.upload}")
	private String uploadPath;
	
	@Value("${customize.path.image}")
	private String imageFormat;

	@Override
	public String saveImage(MultipartFile uploadImage) throws IOException {
		if (uploadImage == null) {
			return "";
		}
		
		String filename = uploadImage.getOriginalFilename();
		String suffix = FileUtil.getSuffix(filename);
		
		String tarPath = imageFormat + suffix;
		tarPath = PathFormat.parse(tarPath);
		
		File file = Paths.get(uploadPath, tarPath).toFile();
		FileUtil.sureDirExists(file, true);
		
		BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(file));
		bout.write(uploadImage.getBytes());
		bout.close();
		
		return tarPath;
	}
	
	@Override
	public void updateImage(String path, MultipartFile uploadImage) throws IOException {
		if (uploadImage == null) {
			return;
		}
		
		File file = Paths.get(uploadPath, path).toFile();
		BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(file));
		bout.write(uploadImage.getBytes());
		bout.close();
	}

	@Override
	public void deleteImage(String path) throws IOException {
		File file = Paths.get(uploadPath, path).toFile();
		if (file.exists()) {
			file.delete();
		}
	}

	@Override
	public void deleteFile(String path) throws IOException {
		File file = Paths.get(uploadPath, path).toFile();
		if (file.exists()) {
			file.delete();
		}
	}

}
