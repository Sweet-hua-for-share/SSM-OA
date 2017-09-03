package com.njiu.cs.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.njiu.cs.dao.UserDao;
import com.njiu.cs.domain.User;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Resource
	private UserDao userDao;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(User model, HttpSession session) {
		User user = userDao.findByUsername(model.getLogin_name());
		if (user !=null) {
			return new ModelAndView("index");
		} else {
			return new ModelAndView("error");
		}
	}

}
