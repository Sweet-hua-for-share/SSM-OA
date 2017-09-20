package com.njiu.cs.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.njiu.cs.dao.UserDao;
import com.njiu.cs.domain.User;

/**
 * demo
 * @author sweet.hua
 *
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Resource
	private UserDao userDao;

	/**
	 * 登录
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(User model, HttpSession session, HttpServletRequest request) {
		User user = userDao.findByUsername(model.getLogin_name());
		request.getSession(true).setAttribute("user", user); 
		if (user !=null) {
			return new ModelAndView("index");
		} else {
			return new ModelAndView("error");
		}
	}
	
	/**
	 * 获取所有可用用户信息
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/getUserList", method = RequestMethod.GET)
	public ModelAndView getUserList(Model model, HttpSession session) {
		List<User> userList = userDao.findAllUser();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userList", userList);
		modelAndView.setViewName("user/user_list");
		return modelAndView;
	}
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
	public String deleteUser(@RequestParam("id") String id) {
		userDao.deleteUser(id);
		return "redirect:getUserList";
	}
	
}
