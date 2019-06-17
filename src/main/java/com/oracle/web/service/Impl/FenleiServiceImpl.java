package com.oracle.web.service.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.PageBean;
import com.oracle.web.mapper.FenleiMapper;
import com.oracle.web.service.FenleiService;



@Service
public  class FenleiServiceImpl implements FenleiService {
	
	@Autowired
	private FenleiMapper fenleiMapper;


	@Override
	@Transactional(readOnly = true)
	public List<Fenlei> list() {
		// TODO Auto-generated method stub
		return this.fenleiMapper.selectAll();
		
	}

	@Override
	@Transactional
	public int save(Fenlei fenlei) {
		// TODO Auto-generated method stub
		
		return this.fenleiMapper.insert(fenlei);
	}

	
	@Override
	@Transactional
	public int counts() {
		// TODO Auto-generated method stub
		return this.fenleiMapper.counts();
	}

	/*@Override
	@Transactional
	public void delete(Fenlei fenlei) {
		// TODO Auto-generated method stub
		
		 this.fenleiMapper.deleteByPrimaryKey(fenlei.getFid());
		
	}*/

	
	
	@Override
	@Transactional(readOnly = true)
	public Fenlei selectByPrimaryKey(Integer fid) {
		// TODO Auto-generated method stub
		return this.fenleiMapper.selectByPrimaryKey(fid);
	}

	@Override
	@Transactional
	public void update(Fenlei fenlei) {
		// TODO Auto-generated method stub
		 this.fenleiMapper.updateByPrimaryKey(fenlei);
	}

	@Override
	public Fenlei queryone(String fname) {
		// TODO Auto-generated method stub
		return this.fenleiMapper.selectFenleiByFname(fname); 
	}

	@Override
	@Transactional
	public PageBean<Fenlei> selectAllByPageHelper(Integer pageNow) {
		// TODO Auto-generated method stub
		PageBean<Fenlei> pb = new PageBean<Fenlei>();

		// 当前页的数据
		PageHelper.startPage(pageNow,5);

		//已经是分页好的数据了
		List<Fenlei> list = this.fenleiMapper.selectAllByPageHelper();

		pb.setBeanList(list);
		
		//总记录数
		PageInfo<Fenlei> pi=new PageInfo<Fenlei>(list);
		
		pb.setCounts((int)pi.getTotal());
		
		// 当前页
		//pb.setPageNow(pageNow);
		pb.setPageNow(pi.getPageNum());

		// 每页显示的条数-自定义
		//pb.setPageSize(3);
		pb.setPageSize(pi.getPageSize());

		return pb;
	}

	

	

	@Override
	public List<Fenlei> outPutFenleiAll() {
		// TODO Auto-generated method stub
		
		return this.fenleiMapper.selectAllByPageHelper();
		
	}

	@Override
	@Transactional
	public List<Fenlei> outPutFenleiIds(String ids1) {
		// TODO Auto-generated method stub
		String[] a = ids1.split(",");
		 
		 List<Integer> list =new ArrayList<Integer>();
		 for (int i = 0; i < a.length; i++) {
	           
				list.add(Integer.parseInt(a[i]));
				 
			}
		return this.fenleiMapper.selectOutPutIds(list);
	}
/*
	@Override
	@Transactional
	public Fenlei yzfenleiupdate(String fname) {
		// TODO Auto-generated method stub
		return this.fenleiMapper.selectFenleiByFname(fname); 
	}*/



	@Override
	@Transactional
	public void delete(String[] arr) {
		// TODO Auto-generated method stub
		this.fenleiMapper.deleteByPrimaryKey(arr);
	}

	

	

	


	

	

	

	

	

}
