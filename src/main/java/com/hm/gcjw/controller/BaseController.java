package com.hm.gcjw.controller;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hm.gcjw.common.utils.CurrentUserUtils;
import com.hm.gcjw.entity.authority.UserEntity;
import com.hm.gcjw.entity.website.ArticleEntity;
import com.hm.gcjw.entity.website.TopicEntity;
import com.hm.gcjw.service.CommonService;
import com.hm.gcjw.service.website.ArticleService;
import com.hm.gcjw.service.website.TopicService;

@Controller
public class BaseController {
	
	static Logger log = LoggerFactory.getLogger(BaseController.class);
	
	@Autowired
	ArticleService articleService;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	TopicService topicService;
	
	@RequestMapping(value = { "/", "/index" })
	String index(ModelMap modelMap) {
		Page<ArticleEntity> list = null;
		
		// 通知公告
		list = articleService.listByType(0, 0, 5);
		modelMap.addAttribute("announceList", list.getContent());
		list = articleService.listByType(0, 1, 5);
		modelMap.addAttribute("announceList2", list.getContent());
		
		// 图片新闻
		list = articleService.listByType(1, 0, 5);
		modelMap.addAttribute("photonewsList", list.getContent());
		
		// 廉政头条
		list = articleService.listByType(2, 0, 1);
		try {
			if (list.getTotalElements() != 0) {
				ArticleEntity headline = list.getContent().get(0);
				String content = commonService.getArticleContent(headline.getPath());
				headline.setContent(content);
				modelMap.addAttribute("headline", headline);
			} else {
				modelMap.addAttribute("headline", null);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		// 廉情在线
		list = articleService.listByType(3, 0, 5);
		modelMap.addAttribute("focusnewsList", list.getContent());
		list = articleService.listByType(3, 1, 5);
		modelMap.addAttribute("focusnewsList2", list.getContent());
		
		// 曝光台
		list = articleService.listByType(4, 0, 5);
		modelMap.addAttribute("exposureList", list.getContent());
		
		// 党纪法规
		list = articleService.listByType(5, 0, 5);
		modelMap.addAttribute("policyList", list.getContent());
		
		// 莲廉文化
		list = articleService.listByType(6, 0, 5);
		modelMap.addAttribute("cultureList", list.getContent());
		
		// 专题文章
		Page<TopicEntity> topicList = topicService.list(0, 5);
		modelMap.addAttribute("topicList", topicList.getContent());
		
		// 工作动态--党风政风
		list = articleService.listByType(8, 0, 6);
		try {
			if (list.getTotalElements() != 0) {
				ArticleEntity dynamicParty = list.getContent().get(0);
				String content = commonService.getArticleContent(dynamicParty.getPath());
				dynamicParty.setContent(content);
				modelMap.addAttribute("dynamicParty", dynamicParty);
			} else {
				modelMap.addAttribute("dynamicParty", null);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		modelMap.addAttribute("dynamicPartyList", list.getContent());
		
		// 工作动态--纪律审查
		list = articleService.listByType(9, 0, 6);
		try {
			if (list.getTotalElements() != 0) {
				ArticleEntity dynamicExamine = list.getContent().get(0);
				String content = commonService.getArticleContent(dynamicExamine.getPath());
				dynamicExamine.setContent(content);
				modelMap.addAttribute("dynamicExamine", dynamicExamine);
			} else {
				modelMap.addAttribute("dynamicExamine", null);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		modelMap.addAttribute("dynamicExamineList", list.getContent());
		
		// 工作动态--巡查工作
		list = articleService.listByType(10, 0, 6);
		try {
			if (list.getTotalElements() != 0) {
				ArticleEntity dynamicPatrol = list.getContent().get(0);
				String content = commonService.getArticleContent(dynamicPatrol.getPath());
				dynamicPatrol.setContent(content);
				modelMap.addAttribute("dynamicPatrol", dynamicPatrol);
			} else {
				modelMap.addAttribute("dynamicPatrol", null);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		modelMap.addAttribute("dynamicPatrolList", list.getContent());
		
		// 工作动态--宣传工作
		list = articleService.listByType(11, 0, 6);
		try {
			if (list.getTotalElements() != 0) {
				ArticleEntity dynamicPublic = list.getContent().get(0);
				String content = commonService.getArticleContent(dynamicPublic.getPath());
				dynamicPublic.setContent(content);
				modelMap.addAttribute("dynamicPublic", dynamicPublic);
			} else {
				modelMap.addAttribute("dynamicPublic", null);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		modelMap.addAttribute("dynamicPublicList", list.getContent());
		
		// 工作动态--队伍建设
		list = articleService.listByType(12, 0, 6);
		try {
			if (list.getTotalElements() != 0) {
				ArticleEntity dynamiTeam = list.getContent().get(0);
				String content = commonService.getArticleContent(dynamiTeam.getPath());
				dynamiTeam.setContent(content);
				modelMap.addAttribute("dynamiTeam", dynamiTeam);
			} else {
				modelMap.addAttribute("dynamiTeam", null);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		modelMap.addAttribute("dynamiTeamList", list.getContent());
		
		return "index";
	}
	
	@RequestMapping(value = "/login") 
	String login() {
		return "login";
	}
	
	@RequestMapping(value = "/home")
	String home(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("user", user);
		return "home";
	}

}
