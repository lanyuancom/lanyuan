package com.lanyuan.util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import com.lanyuan.entity.QunMessages;

/**
 * QQ群信息排序
 * @author lanyuan
 * 2013-11-19
 * @Email: mmm333zzz520@163.com
 * @version 1.0v
 */
public class MessageSort {
	
	/**
	 * 文件流
	 * @param inputStream
	 * @return
	 * @throws Exception 
	 */
	public List<QunMessages> sortQQ(InputStream inputStream) throws Exception {
		BufferedReader bfr = new BufferedReader(new InputStreamReader(inputStream,"utf-8"));// 分割字符流
		return toQQInfp(bfr);
	}
	/**
	 * 文件路径
	 * @param filePath
	 * @return　Map<String, Integer>
	 * @throws Exception 
	 */
	public List<QunMessages> sortQQ(String filePath) throws Exception {
		FileReader fr = new FileReader(filePath);// 创建字符流
		BufferedReader bfr = new BufferedReader(fr);// 分割字符流
		return toQQInfp(bfr);
	}
	
	/**
	 * 返回排序好的数据
	 * @param BufferedReader
	 * @return Map<String, Integer>
	 */
	public List<QunMessages> toQQInfp(BufferedReader bfr) {
		List<String> strList = new ArrayList<String>();// 存放所有消息记录
		Map<String, Integer> strMap = new HashMap<String, Integer>();
		HashSet<String> strSet = new HashSet<String>();// HashSet由于数据不会重复的．所以记录某个群的成员数量
		List<QunMessages> qms = new ArrayList<QunMessages>();//存放排序后的数据
		try {
			while (bfr.read() != -1) {// 循环读取
				String tmp = bfr.readLine();
				if (tmp.lastIndexOf(" ") > 0) {
					if (tmp.indexOf("(") >= 0) {
						if (tmp.lastIndexOf(" ") < tmp.lastIndexOf(")")) {
							tmp = tmp.substring(tmp.lastIndexOf(" ") + 1,
									tmp.lastIndexOf(")") + 1);
							strList.add(tmp);// 添加到List一份
							strSet.add(tmp);
						}
					} else if (tmp.indexOf("<") >= 0) {
						if (tmp.lastIndexOf(" ") < tmp.lastIndexOf(">")) {
							tmp = tmp.substring(tmp.lastIndexOf(" ") + 1,
									tmp.lastIndexOf(">") + 1);
							strList.add(tmp);// 添加到List一份
							strSet.add(tmp);
						}
					}
				}

			}
			for (String map : strSet) {
				boolean b = false;
				if(map.lastIndexOf("(")>-1&&map.lastIndexOf(")")>-1){
					String sun = map.substring(map.lastIndexOf("(") + 1,map.lastIndexOf(")"));
					if(isNum(sun)){
						b=true;
					}
				}else if(map.indexOf("@qq.com")>-1){
					b=true;
				}
				if(b){
					int count = 0;
					for (int j = 0; j < strList.size(); j++) {
						//String tmp = (String) strSet.toArray()[i];
						if (map.equals(strList.get(j))) {
							++count;
							strMap.put(map, count);
							strList.remove(j);
						} else {
							continue;
						}
					}
//					int count = 0;
//					for (String s : strList) {
//						if (map.equals(s)) {
//							++count;
//							strMap.put(map, count);
//							strList.remove(s);
//						}
//					}
				}
			}
			ArrayList<Integer> lists = new ArrayList<Integer>();//排序
			 for (Map.Entry<String, Integer> entity : strMap.entrySet()) {   
				 lists.add(entity.getValue());//存放次数
			 };
			Collections.sort(lists);//Collections内置提供的升序
			for (Integer sb : lists) {
				 for (Map.Entry<String, Integer> entity : strMap.entrySet()) {  
					 QunMessages qq=new QunMessages();
					 Integer value = entity.getValue();
					if(value.equals(sb)){
						//System.out.println(entity.getKey()+"：发表　"+entity.getValue()+"　次");
						boolean b = false;
						String map = entity.getKey();
						String sun="";
						String name="";
						if(map.lastIndexOf("(")>-1&&map.lastIndexOf(")")>-1){
							sun = map.substring(map.lastIndexOf("(") + 1,map.lastIndexOf(")"));
							b=true;
							name =  map.substring(0,map.lastIndexOf("("));
							qq.setName(name);
							qq.setQq(sun);
						}else if(map.lastIndexOf("<")>-1&&map.lastIndexOf(">")>-1){
							sun =map.substring(map.lastIndexOf("<")+1,map.lastIndexOf(">"));
							name =  map.substring(0,map.lastIndexOf("<"));
							qq.setName(name);
							qq.setQq(sun);
							b=true;
						}
						if(b){
							qq.setMark("发表：");
							qq.setCount(entity.getValue().toString());
							qms.add(qq);
						}
						continue;
					}
				 }
			};
			//去除重复
//			for (QunMessages qq : qms) {
//				for (QunMessages qq2 : qms) {
//					if(qq.getQq().equals(qq2.getQq())){
//						if(Integer.parseInt(qq.getCount())<Integer.parseInt(qq2.getCount())){
//							qms.remove(qq);
//						}
//					}
//				}
//			}
			   for (int i = 0; i < qms.size() - 1; i++) {                             //循环遍历集体中的元素
			         for (int j = qms.size() - 1; j > i; j--) {                         //这里非常巧妙，这里是倒序的是比较
			              if (qms.get(j).getQq().equals(qms.get(i).getQq())) {
			            	  qms.remove(i);
			              }
			        }
			    }
		} catch (Exception e) {
		}
		return qms;
	}

	public boolean isNum(String str) {
		return str.matches("^[-+]?(([0-9]+)([.]([0-9]+))?|([.]([0-9]+))?)$");
	}

	public void quick(Integer[] str) {
		if (str.length > 0) { // 查看数组是否为空
			_quickSort(str, 0, str.length - 1);
		}
	}

	public void _quickSort(Integer[] list, int low, int high) {
		if (low < high) {
			int middle = getMiddle(list, low, high); // 将list数组进行一分为二
			_quickSort(list, low, middle - 1); // 对低字表进行递归排序
			_quickSort(list, middle + 1, high); // 对高字表进行递归排序
		}
	}

	public int getMiddle(Integer[] list, int low, int high) {
		int tmp = list[low]; // 数组的第一个作为中轴
		while (low < high) {
			while (low < high && list[high] > tmp) {
				high--;
			}
			list[low] = list[high]; // 比中轴小的记录移到低端
			while (low < high && list[low] < tmp) {
				low++;
			}
			list[high] = list[low]; // 比中轴大的记录移到高端
		}
		list[low] = tmp; // 中轴记录到尾
		return low; // 返回中轴的位置
	}
}
