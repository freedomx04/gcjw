package com.hm.gcjw.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hm.gcjw.entity.authority.ConfigEntity;
import com.hm.gcjw.entity.website.ArticleEntity;
import com.hm.gcjw.entity.website.TopicEntity;
import com.hm.gcjw.service.CommonService;
import com.hm.gcjw.service.authority.ConfigService;
import com.hm.gcjw.service.website.ArticleService;
import com.hm.gcjw.service.website.TopicService;

@Controller
public class PageController {
	static Logger log = LoggerFactory.getLogger(PageController.class);
	
	@Autowired
	ArticleService articleService;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	TopicService topicService;
	
	@Autowired
	ConfigService configService;
	
	@RequestMapping(value = "/column") 
	String column(ModelMap modelMap, Integer type) {
		Integer count = articleService.listByType(type).size();
		String articleTitle = articleService.getArticleTitle(type);
		modelMap.addAttribute("count", count);
		modelMap.addAttribute("type", type);
		modelMap.addAttribute("articleTitle", articleTitle);
		
		if (type == 7) {
			List<TopicEntity> topicList = topicService.list();
			modelMap.addAttribute("topicList", topicList);
		} else if (type == 1) {
			return "pages/portal/column_image";
		}
		
		return "pages/portal/column";
	}
	
	@RequestMapping(value = "/article/{articleId}") 
	String article(ModelMap modelMap, @PathVariable("articleId") Long articleId) {
		ArticleEntity article = articleService.findOne(articleId);
		if (article == null) {
			return "pages/404";
		}
		
		Integer type = article.getType();
		String articleTitle = articleService.getArticleTitle(type);
		modelMap.addAttribute("article", article);
		modelMap.addAttribute("articleTitle", articleTitle);
		return "pages/portal/article";
	}
	
	/** 搜索结果 **/
	@RequestMapping(value = "/result") 
	String result() {
		return "pages/portal/result";
		
	}

	@RequestMapping(value = "/report/guide")
	String guide(ModelMap modelMap) {
		ConfigEntity config = configService.find();
		modelMap.addAttribute("guide", config.getGuide());
		return "pages/portal/report/guide";
	}
	
}
