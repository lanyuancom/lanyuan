package com.lanyuan.base;

import java.util.List;

import com.lanyuan.util.PageView;

/**
 * @author lanyuan
 *
 * 2013-1-30 下午11:28:22
 *
 * Email:mmm333zzz520@163.com
 * 
 * 集合持久层的公用的增，删，改，查接口
 * <T> 表示传入实体类
 */
public interface BaseDao<T> {
	/**
	 * 返回分页后的数据
	 * @param pageView
	 * @param t
	 * @return
	 */
	public PageView query(PageView pageView,T t);
	/**
	 * 返回所有数据
	 * @param t
	 * @return
	 */
	public List<T> queryAll(T t);
	public void delete(String id);
	public void modify(T t);
	public T getById(String id);
	public void add(T t);
}
