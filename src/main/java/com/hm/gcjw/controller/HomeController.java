package com.hm.gcjw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	/**
	 * 总览
	 */
	@RequestMapping(value = "/overview")
	String overview(ModelMap modelMap) {
		return "pages/overview";
	}
	
}
