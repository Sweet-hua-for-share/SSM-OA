package com.njiu.cs.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.njiu.cs.domain.Area;

@MapperScan
public interface AreaDao {
	
	public void saveArea(Area area);
	
	public List<Area> findAll();
	
	public void deleteArea(String id);
	
	public Area findAreaByID(String id);

}
