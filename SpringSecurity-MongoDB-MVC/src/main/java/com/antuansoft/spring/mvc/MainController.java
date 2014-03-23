/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.antuansoft.spring.mvc;


import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.antuansoft.mongodb.domain.Campaign;
import com.antuansoft.mongodb.domain.User;
import com.antuansoft.mongodb.repositories.CampaignRepositoryDao;
import com.antuansoft.mongodb.repositories.UserRepositoryDao;


/**
 *
 * @author anjana.m
 */
@Controller
public class MainController {
 
	@Autowired
	private UserRepositoryDao userRepositoryDao;
	
	@Autowired
	private CampaignRepositoryDao campaignRepositoryDao;
	
	private static final Logger logger = Logger.getLogger(MainController.class);

	

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String defaultPage(ModelMap map) {
		return "redirect:/menu";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		return "login";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
		return "logout";
	}
	
	@RequestMapping(value = "/accessdenied")
	public String loginerror(ModelMap model) {
		model.addAttribute("error", "true");
		return "denied";
	}
	
	@RequestMapping(value = "/menu", method = RequestMethod.GET)
	public String menu(ModelMap map) {
		
		return "menu";
	}
	
	@RequestMapping(value = "/listUsers", method = RequestMethod.GET)
	public String listUsers(ModelMap map) {
		
		Iterable<User> users= userRepositoryDao.findAll();
		map.addAttribute("users", users);
		
		return "listUsers";
	}
	
	@RequestMapping(value = "/listCampaigns", method = RequestMethod.GET)
	public String listCampaigns(ModelMap map) {
		
		map.addAttribute("new_campaign", new Campaign());
		Iterable<Campaign> campaings= campaignRepositoryDao.findAll();
		map.addAttribute("campaigns",campaings);
		
		return "listCampaigns";
	}
	
	@PreAuthorize("hasRole('ROLE_CAMPAIGN')")
	@RequestMapping(value = "/addCampaing", method = RequestMethod.POST)
	public String addCampaign(@ModelAttribute(value = "new_campaign") Campaign new_campaign,
			BindingResult result){
		
		new_campaign.setId(UUID.randomUUID().toString());
		campaignRepositoryDao.save(new_campaign);
		
		return "redirect:/listCampaigns";
	}
	
	

	

	
	

	
}

