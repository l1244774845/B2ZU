package com.oracle.web.mapper;

import com.oracle.web.bean.Fenlei;

import java.util.List;

public interface FenleiMapper {

	/*int deleteByPrimaryKey(Integer fId);*/

	int insert(Fenlei record);

	Fenlei selectByPrimaryKey(Integer fId);

	List<Fenlei> selectAll();

	int updateByPrimaryKey(Fenlei record);

	int counts();

	List<Fenlei> selectAllByPageHelper();

	Fenlei selectFenleiByFname(String fname);

	 int deleteMany(String [] ids);
	
	List<Fenlei> selectOutPutIds(List<Integer> list);

	
	void deleteByPrimaryKey(String[] arr);


	

}