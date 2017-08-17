package com.hm.gcjw.controller;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hm.gcjw.entity.website.ArticleEntity;
import com.hm.gcjw.service.CommonService;
import com.hm.gcjw.service.website.ArticleService;

@Controller
public class PageController {
	static Logger log = LoggerFactory.getLogger(PageController.class);
	
	@Autowired
	ArticleService articleService;
	
	@Autowired
	CommonService commonService;
	
	@RequestMapping(value = "/column") 
	String column(ModelMap modelMap, Integer type) {
		if (type != 0) {
			Integer count = articleService.listByType(type).size();
			String articleTitle = articleService.getArticleTitle(type);
			modelMap.addAttribute("count", count);
			modelMap.addAttribute("articleTitle", articleTitle);
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
}
