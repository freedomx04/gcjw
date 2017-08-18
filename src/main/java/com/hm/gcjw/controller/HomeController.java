package com.hm.gcjw.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hm.gcjw.common.utils.CurrentUserUtils;
import com.hm.gcjw.entity.authority.UserEntity;
import com.hm.gcjw.entity.report.MailEntity;
import com.hm.gcjw.entity.report.ReportEntity;
import com.hm.gcjw.entity.website.ArticleEntity;
import com.hm.gcjw.entity.website.TopicEntity;
import com.hm.gcjw.service.CommonService;
import com.hm.gcjw.service.authority.UserService;
import com.hm.gcjw.service.report.MailService;
import com.hm.gcjw.service.report.ReportService;
import com.hm.gcjw.service.website.ArticleService;
import com.hm.gcjw.service.website.TopicService;

@Controller
public class HomeController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ArticleService articleService;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	TopicService topicService;
	
	@Autowired
	ReportService reportService;
	
	@Autowired
	MailService mailService;

	/**
	 * 总览
	 */
	@RequestMapping(value = "/overview")
	String overview(ModelMap modelMap) {
		// 网站分析
		List<Map<String, Object>> articleCountList = new ArrayList<>();
		List<Object[]> list1 = articleService.listCountByType();
		for (Object[] object: list1) {
			Map<String, Object> map = new HashMap<>();
			map.put("title", articleService.getArticleTitle(Integer.parseInt(object[0].toString())));
			map.put("count", object[1]);
			articleCountList.add(map);
		}
		modelMap.addAttribute("articleCountList", articleCountList);
		
		
		return "pages/overview";
	}
	
	/**
	 * 系统管理
	 */
	@RequestMapping(value = "/userList") 
	String userList() {
		return "pages/authority/user_list";
	}
	
	@RequestMapping(value = "/userAdd") 
	String userAdd() {
		return "pages/authority/user_add";
	}
	
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
	String articleAdd(ModelMap modelMap, Integer type, String method, Long articleId, Long topicId) throws IOException {
		modelMap.addAttribute("type", type);
		modelMap.addAttribute("method", method);
		modelMap.addAttribute("topicId", topicId);
		
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
	
	@RequestMapping(value = "/topicList")
	String topicList(ModelMap modelMap) {
		return "pages/website/topic_list";
	}
	
	@RequestMapping(value = "/topicAdd")
	String topicAdd(ModelMap modelMap, String method, Long topicId) {
		modelMap.addAttribute("method", method);
		
		if (topicId != null) {
			TopicEntity topic = topicService.findOne(topicId);
			modelMap.addAttribute("topic", topic);
		}
		return "pages/website/topic_add";
	}
	
	@RequestMapping(value = "/topicGet")
	String topicGet(ModelMap modelMap, Long topicId) {
		TopicEntity topic = topicService.findOne(topicId);
		modelMap.addAttribute("topic", topic);
		return "pages/website/topic_get";
	}
	
	/**
	 * 举报管理
	 */
	@RequestMapping(value = "reportList")
	String reportList() {
		return "pages/report/report_list";
	}
	
	@RequestMapping(value = "reportGet")
	String reportGet(ModelMap modelMap, Long reportId) {
		ReportEntity report = reportService.findOne(reportId);
		modelMap.addAttribute("report", report);
		return "pages/report/report_get";
	}
	
	@RequestMapping(value = "reportReply")
	String reportReply(ModelMap modelMap, Long reportId) {
		ReportEntity report = reportService.findOne(reportId);
		modelMap.addAttribute("report", report);
		return "pages/report/report_reply";
	}
	
	@RequestMapping(value = "mailList")
	String mailList() {
		return "pages/report/mail_list";
	}
	
	@RequestMapping(value = "/mailGet")
	String mailGet(ModelMap modelMap, Long mailId) {
		MailEntity mail = mailService.findOne(mailId);
		modelMap.addAttribute("mail", mail);
		return "pages/report/mail_get";
	}
	
	@RequestMapping(value = "/mailReply")
	String mailReply(ModelMap modelMap, Long mailId) {
		MailEntity mail = mailService.findOne(mailId);
		modelMap.addAttribute("mail", mail);
		return "pages/report/mail_reply";
	}
	
	/**
	 * 个人中心
	 */
	@RequestMapping(value = "/modifyPassword")
	String modifyPassword(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("user", user);
		return "pages/personal/modify_password";
	}
	
}
