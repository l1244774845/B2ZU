package com.oracle.web.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.mapper.BookMapper;
import com.oracle.web.bean.Book;
import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.SubBook;
import com.oracle.web.service.BookService;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookMapper bookMapper;

	@Override
	@Transactional
	public int addBooks(Book book) {

		return this.bookMapper.insert(book);

	}

	@Override
	@Transactional
	public void delete(String[] arr) {

		this.bookMapper.deleteByPrimaryKey(arr);

	}

	@Override
	@Transactional(readOnly = true)
	public Book queryoneBook(Integer id) {

		return this.bookMapper.selectByPrimaryKey(id);

	}

	@Override
	@Transactional
	public void update(Book book) {

		this.bookMapper.updateByPrimaryKey(book);

	}

	@Override
	@Transactional(readOnly = true)
	public PageBean<SubBook> selectAllByPageHelper(int pageNow) {

		PageBean<SubBook> pb = new PageBean<SubBook>();

		// 当前页的数据

		PageHelper.startPage(pageNow, 5);

		// 分页好的数据

		List<SubBook> list = this.bookMapper.selectAllByPageHelper();

		pb.setBeanList(list);

		// 总记录数

		PageInfo<SubBook> pi = new PageInfo<SubBook>(list);

		pb.setCounts((int) pi.getTotal());

		// 当前页

		pb.setPageNow(pi.getPageNum());

		// 每页显示的条数-自定义

		pb.setPageSize(pi.getPageSize());

		return pb;
	}

	@Override
	public List<SubBook> list() {
		// TODO Auto-generated method stub
		return this.bookMapper.selectAll();
	}

	@Override
	public PageBean<SubBook> selectAllByPageHelperAndWhere(Book where, int pageNow) {

		PageBean<SubBook> pb = new PageBean<SubBook>();

		// 当前页的数据

		PageHelper.startPage(pageNow, 5);

		// 分页好的数据

		List<SubBook> list = this.bookMapper.selectAllByPageHelperAndWhere(where);

		pb.setBeanList(list);

		// 总记录数

		PageInfo<SubBook> pi = new PageInfo<SubBook>(list);

		pb.setCounts((int) pi.getTotal());

		// 当前页

		pb.setPageNow(pi.getPageNum());

		// 每页显示的条数-自定义

		pb.setPageSize(pi.getPageSize());

		return pb;
	}

	@Override
	public List<SubBook> list2() {
		// TODO Auto-generated method stub
		return this.bookMapper.selectAll2();
	}

	@Override
	public List<SubBook> queryBooks(String[] arr) {
		// TODO Auto-generated method stub
		return this.bookMapper.queryBooks(arr);
	}

	@Override
	public Book validateBName(String bname) {
		// TODO Auto-generated method stub
		return this.bookMapper.validateBName(bname);
	}

}
