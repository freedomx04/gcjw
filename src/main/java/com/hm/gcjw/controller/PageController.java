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
	
	/** 举报指南 **/
	@RequestMapping(value = "/report/guide") 
	String guide() {
		return "pages/portal/report/guide";
		
	}
	
	/** 举报首页  **/
	@RequestMapping(value = "/report/index") 
	String home() {
		return "pages/portal/report/index";
		
	}
	
	/** 相关法律法规  **/
	@RequestMapping(value = "/report/law") 
	String law() {
		return "pages/portal/report/law";
		
	}
	
	/** 举报须知  **/
	@RequestMapping(value = "/report/JBXZ") 
	String jbxz() {
		return "pages/portal/report/jbxz";
		
	}
	
	/** 书记信箱  **/
	@RequestMapping(value = "/report/SJMail") 
	String sjmail() {
		return "pages/portal/report/sjmail";
		
	}
	
	/** 信件查询  **/
	@RequestMapping(value = "/report/MailCX") 
	String mailcx() {
		return "pages/portal/report/mailcx";
		
	}
	
	/** 举报  **/
	@RequestMapping(value = "/report/JBBill") 
	String jbbill() {
		return "pages/portal/report/jbbill";
		
	}
	
	/** 相关法律法规--举报信主要样式  **/
	@RequestMapping(value = "/report/letter") 
	String letter() {
		return "pages/portal/report/law/letter_type";
		
	}
	
	/** 相关法律法规--中国共产党纪律处分条例 **/
	@RequestMapping(value = "/report/regulation_1") 
	String regulation_1() {
		return "pages/portal/report/law/regulation_1";
		
	}
	
	/** 相关法律法规--中国共产党纪律检查机关控告申诉工作条例**/
	@RequestMapping(value = "/report/regulation_2") 
	String regulation_2() {
		return "pages/portal/report/law/regulation_2";
		
	}
	
	/** 相关法律法规--中纪委监察部关于保护检举、控告人的规定 **/
	@RequestMapping(value = "/report/regulation_3") 
	String regulation_3() {
		return "pages/portal/report/law/regulation_3";
		
	}
	
	/** 相关法律法规--中华人民共和国行政监察法实施条例 **/
	@RequestMapping(value = "/report/regulation_4") 
	String regulation_4() {
		return "pages/portal/report/regulation_4";
		
	}
}
