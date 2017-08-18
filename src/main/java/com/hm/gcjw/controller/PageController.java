package com.hm.gcjw.controller;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hm.gcjw.entity.website.ArticleEntity;
import com.hm.gcjw.entity.website.TopicEntity;
import com.hm.gcjw.service.CommonService;
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
		}
		
		return "pages/portal/column";
	}
	
	@RequestMapping(value = "/article/{path}") 
	String article(ModelMap modelMap, Integer type, @PathVariable("path") String path) {
		ArticleEntity article = articleService.findByPath(path);
		if (article != null) {
			try {
				String content = commonService.getArticleContent(article.getPath());
				article.setContent(content);
				modelMap.addAttribute("article", article);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		String articleTitle = articleService.getArticleTitle(type);
		modelMap.addAttribute("articleTitle", articleTitle);
		return "pages/portal/article";
	}
	
	@RequestMapping(value = "/guide") 
	String guide() {
		return "pages/portal/report/guide";
		
	}
	
	@RequestMapping(value = "/report/index") 
	String home() {
		return "pages/portal/report/index";
		
	}
	
	@RequestMapping(value = "/report/law") 
	String law() {
		return "pages/portal/report/law";
		
	}
	
	@RequestMapping(value = "/report/JBXZ") 
	String jbxz() {
		return "pages/portal/report/jbxz";
		
	}
	
	@RequestMapping(value = "/report/SJMail") 
	String sjmail() {
		return "pages/portal/report/sjmail";
		
	}
	
	@RequestMapping(value = "/report/MailCX") 
	String mailcx() {
		return "pages/portal/report/mailcx";
		
	}
}
