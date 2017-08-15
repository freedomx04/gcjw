package com.hm.gcjw.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hm.gcjw.entity.website.ArticleEntity;
import com.hm.gcjw.service.CommonService;
import com.hm.gcjw.service.authority.UserService;
import com.hm.gcjw.service.website.ArticleService;

@Controller
public class HomeController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ArticleService articleService;
	
	@Autowired
	CommonService commonService;

	/**
	 * 总览
	 */
	@RequestMapping(value = "/overview")
	String overview(ModelMap modelMap) {
		return "pages/overview";
	}
	
	/**
	 * 系统管理
	 */
	
	/**
	 * 网站管理
	 */
	@RequestMapping(value = "/articleList")
	String articleList(ModelMap modelMap, Integer type) {
		String title = articleService.getArticleTitle(type);
		modelMap.addAttribute("title", title);
		modelMap.addAttribute("type", type);
		return "pages/website/article_list";
	}
	
	@RequestMapping(value = "/articleAdd")
	String articleAdd(ModelMap modelMap, Integer type, String method, Long articleId) throws IOException {
		modelMap.addAttribute("type", type);
		modelMap.addAttribute("method", method);
		
		String title = articleService.getArticleTitle(type);
		title += method.equals("add") ? " - 新增" : " - 编辑";
		modelMap.addAttribute("title", title);
		
		if (articleId != null) {
			ArticleEntity article = articleService.findOne(articleId);
			String content = commonService.getArticleContent(article.getPath());
			article.setContent(content);
			modelMap.addAttribute("article", article);
		}
		
		return "pages/website/article_add";
	}
	
	@RequestMapping(value = "/articleGet")
	String articleGet(ModelMap modelMap, Long articleId) throws IOException {
		ArticleEntity article = articleService.findOne(articleId);
		String content = commonService.getArticleContent(article.getPath());
		article.setContent(content);
		modelMap.addAttribute("article", article);
		
		String title = articleService.getArticleTitle(article.getType());
		modelMap.addAttribute("title", title);
		
		return "pages/website/article_get";
	}
	
	@RequestMapping(value = "/dynamicList")
	String dynamicList(ModelMap modelMap) {
		
		return "pages/website/dynamic_list";
	}
	
}
