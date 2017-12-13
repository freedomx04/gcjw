package com.hm.gcjw.controller.website;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public Result create(Integer type, String title, String source, String updateTime,
			@RequestParam(name = "uploadImage", required = false) MultipartFile uploadImage, String content,
			Long topicId) {
		try {
			String imagePath = null;
			if (uploadImage != null) {
				imagePath = commonService.saveImage(uploadImage);
			}

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			Date date = sdf.parse(updateTime);
			ArticleEntity article = new ArticleEntity(type, title, source, imagePath, content, date, date);

			if (topicId != null) {
				article.setTopicId(topicId);
			}

			articleService.save(article);
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/article/update", method = RequestMethod.POST)
	public Result update(Long articleId, String title, String source, String updateTime,
			@RequestParam(name = "uploadImage", required = false) MultipartFile uploadImage, String content) {
		try {
			ArticleEntity article = articleService.findOne(articleId);
			article.setTitle(title);
			article.setSource(source);
			article.setContent(content);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			Date date = sdf.parse(updateTime);
			article.setUpdateTime(date);

			if (uploadImage != null && !uploadImage.isEmpty()) {
				commonService.deleteImage(article.getImagePath());
				String imagePath = commonService.saveImage(uploadImage);
				article.setImagePath(imagePath);
			}

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

	@RequestMapping(value = "/api/article/listByTopicId")
	public Result listByTopicId(Long topicId) {
		try {
			List<ArticleEntity> list = articleService.listByTopicId(topicId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/article/listByTopicIdPaging")
	public Result listByTopicIdPaging(Long topicId, int page, int size) {
		try {
			Page<ArticleEntity> articlePage = articleService.listByTopicId(topicId, page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", articlePage);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/article/listCountByType")
	public Result listCountByType() {
		try {
			List<Map<String, Object>> resultList = new ArrayList<>();
			List<Object[]> list = articleService.listCountByType();

			for (Object[] object : list) {
				Map<String, Object> map = new HashMap<>();
				map.put("title", articleService.getArticleTitle(Integer.parseInt(object[0].toString())));
				map.put("count", object[1]);
				resultList.add(map);
			}

			return new ResultInfo(Code.SUCCESS.value(), "ok", resultList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/article/listDynamicCountByType")
	public Result listDynamicCountByType() {
		try {
			List<Map<String, Object>> resultList = new ArrayList<>();
			List<Object[]> list = articleService.listDynamicCountByType();

			for (Object[] object : list) {
				Map<String, Object> map = new HashMap<>();
				map.put("title", articleService.getArticleTitle(Integer.parseInt(object[0].toString())));
				map.put("count", object[1]);
				resultList.add(map);
			}

			return new ResultInfo(Code.SUCCESS.value(), "ok", resultList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/article/search")
	public Result search(String input, int page, int size) {
		try {
			Page<ArticleEntity> articleList = articleService.search(input, page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", articleList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/article/topic")
	public Result topic(Long articleId, Long topicId) {
		try {
			ArticleEntity article = articleService.findOne(articleId);
			if (topicId == 0) {
				article.setTopicId(null);
			} else {
				article.setTopicId(topicId);
			}
			articleService.save(article);
			return new Result(Code.SUCCESS.value(), "success");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}
