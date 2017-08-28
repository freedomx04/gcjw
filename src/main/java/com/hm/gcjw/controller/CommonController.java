package com.hm.gcjw.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.hm.gcjw.common.PathFormat;
import com.hm.gcjw.common.result.Code;
import com.hm.gcjw.common.result.Result;
import com.hm.gcjw.common.result.ResultInfo;
import com.hm.gcjw.common.utils.FileUtil;

@RestController
public class CommonController {
	
	static Logger log = LoggerFactory.getLogger(CommonController.class);
	
	@Value("${customize.path.upload}")
	private String uploadPath;
	
	@Value("${customize.path.image}")
	private String imageFormat;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping(value = "/api/uploadImage")
	public Result uploadImage(MultipartFile imageFile) {
		try {
			if (imageFile == null) {
				return null;
			}
			
			String filename = imageFile.getOriginalFilename();
			String suffix = FileUtil.getSuffix(filename);
			
			String tarPath = imageFormat + suffix;
			tarPath = PathFormat.parse(tarPath);
			
			File file = Paths.get(uploadPath, tarPath).toFile();
			FileUtil.sureDirExists(file, true);
			
			BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(file));
			bout.write(imageFile.getBytes());
			bout.close();
			
			return new ResultInfo(Code.SUCCESS.value(), "upload", tarPath);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}
