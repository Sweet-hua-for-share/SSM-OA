package com.njiu.cs.controller;

import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.njiu.cs.domain.Area;
import com.njiu.cs.domain.User;
import com.njiu.cs.service.AreaService;


@Controller
@RequestMapping(value = "/area")
public class AreaController{
	
	@Autowired
	private AreaService areaService;
	
	@RequestMapping(value = "/getAreaList", method = RequestMethod.GET)
	public String getAreaList(Model model, HttpSession session) {
		model.addAttribute("list", areaService.findAll());
		return "area/area_list";
	}
	
	@RequestMapping(value = "/addArea", method = RequestMethod.POST)
	public String addArea(Area area,HttpSession session) {
		if(area.getId() == null || "".equals(area.getId())) {
			area.setId(this.getUUID());
		}
		User user = (User) session.getAttribute("user");
		area.setCreateDate(new Date());
		area.setCreateBy(user.getLogin_name());
		area.setUpdateBy(user.getLogin_name());
		area.setUpdateDate(new Date());
		area.setSort(30);
		area.setDelFlag("0");
        areaService.addArea(area);
		return "area/area_list";
	}
	
	@RequestMapping(value = "/deleteArea", method = RequestMethod.GET)
	public String deleteArea(@RequestParam("id") String id) {
		areaService.deleteArea(id);
		return "redirect:getAreaList";
	}
	
	@RequestMapping(value = "/findAreaByID", method = RequestMethod.GET)
	public String findAreaByID(@RequestParam("id") String id, Model model) {
		model.addAttribute("findByID", areaService.findAreaByID(id));
		return "";
	}
	
	public static String getUUID(){
        UUID uuid=UUID.randomUUID();
        String str = uuid.toString(); 
        String uuidStr=str.replace("-", "");
        return uuidStr;
    }
	
}
