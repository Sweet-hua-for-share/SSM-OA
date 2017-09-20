package com.njiu.cs.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.njiu.cs.dao.AreaDao;
import com.njiu.cs.domain.Area;

@Service
public class AreaService {
	
	@Resource
	private AreaDao areaDao;
	
	public List<Area> findAll(){
		return areaDao.findAll();
	}
	
	public void deleteArea(String id) {
		areaDao.deleteArea(id);
	}
	
	public Area findAreaByID(String id) {
		return areaDao.findAreaByID(id);
	}
	public void addArea(Area area) {
		
		if(area.getParent_id()==null||"".equals(area.getParent_id())) {
			area.setParent_id("0");
		}
		if(area.getParent_ids()==null||"".equals(area.getParent_ids())) {
			area.setParent_ids("0");
		}
		areaDao.saveArea(area);
	}

}
