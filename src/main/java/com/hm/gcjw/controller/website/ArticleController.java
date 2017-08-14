package com.hm.gcjw.controller.website;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.hm.gcjw.common.result.Code;
import com.hm.gcjw.common.result.Result;
import com.hm.gcjw.common.result.ResultInfo;
import com.hm.gcjw.entity.website.ArticleEntity;
import com.hm.gcjw.service.CommonService;
import com.hm.gcjw.service.website.ArticleService;

@RestController
public class ArticleController {

	static Logger log = LoggerFactory.getLogger(ArticleController.class);

	@Autowired
	ArticleService articleService;

	@Autowired
	CommonService commonService;

	@RequestMapping(value = "/api/article/create", method = RequestMethod.POST)
	public Result create(Integer type, String title, String source,
			@RequestParam(name = "uploadImage", required = false) MultipartFile uploadImage, String content) {
		try {
			String path = commonService.saveArticle(content);

			String imagePath = null;
			if (uploadImage != null) {
				imagePath = commonService.saveImage(uploadImage);
			}

			Date now = new Date();
			ArticleEntity article = new ArticleEntity(type, title, source, imagePath, path, now, now);
			articleService.save(article);

			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/article/update", method = RequestMethod.POST)
	public Result update(Long articleId, String title, String source,
			@RequestParam(name = "uploadImage", required = false) MultipartFile uploadImage, String content) {
		try {
			ArticleEntity article = articleService.findOne(articleId);
			article.setTitle(title);
			article.setSource(source);
			article.setUpdateTime(new Date());
			
			if (uploadImage != null && !uploadImage.isEmpty()) {
				commonService.deleteImage(article.getImagePath());
				String imagePath = commonService.saveImage(uploadImage);
				article.setImagePath(imagePath);
			}
			
			commonService.updateArticle(article.getPath(), content);
			articleService.save(article);
			
			
			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/article/delete")
	public Result delete(Long articleId) {
		try {
			ArticleEntity article = articleService.findOne(articleId);

			commonService.deleteArticle(article.getPath());
			if (article.getImagePath() != null) {
				commonService.deleteImage(article.getImagePath());
			}
			articleService.delete(articleId);

			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint");
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/article/batchDelete")
	public Result batchDelete(@RequestParam("articleIdList[]") List<Long> articleIdList) {
		try {
			for (Long articleId : articleIdList) {
				delete(articleId);
			}
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint");
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/article/get")
	public Result get(Long articleId) {
		try {
			ArticleEntity article = articleService.findOne(articleId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", article);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/article/list")
	public Result list(Integer type) {
		try {
			List<ArticleEntity> list = articleService.listByType(type);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/article/listPaging")
	public Result listPaging(Integer type, int page, int size) {
		try {
			Page<ArticleEntity> articlePage = articleService.listByType(type, page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", articlePage);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}
