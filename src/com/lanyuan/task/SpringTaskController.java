package com.lanyuan.task;

import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.util.Date;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.lanyuan.entity.ServerInfo;
import com.lanyuan.entity.ServerStatus;
import com.lanyuan.service.ServerInfoService;
import com.lanyuan.util.Common;
import com.lanyuan.util.EmailUtils;
import com.lanyuan.util.PropertiesUtils;

/**
 * Spring调度，指定时间执行
 * 利用了spring 3 中使用注解的方式来进行任务调度。 
 * @author lanyuan
 * 2013-11-19
 * @Email: mmm333zzz520@163.com
 * @version 1.0v
 */
@Component
public class SpringTaskController {
	@Autowired
	private ServerInfoService serverInfoService;

	public static void main(String[] args) {
		SpringTaskController action = new SpringTaskController();
		try {
			action.action();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 该方法为任务调度是自动调用的方法，在这里可以实现你要实现的功能
	 * 
	 * @throws Exception
	 */
	// @Scheduled(cron = "0 0 9  * * ? ")
	public void action() throws Exception {
		Properties prop = PropertiesUtils.getProperties();
		if (null != prop) {
			String data = null;
			try {
				Iterator<Entry<Object, Object>> itr = prop.entrySet().iterator();
				while (itr.hasNext()) {
					Entry<Object, Object> e = (Entry<Object, Object>) itr.next();
					int sun = e.getKey().toString().indexOf("jhost");
					if (sun > -1) {
						String name = e.getKey().toString().substring(5);
						data = this.task(name, e.getValue().toString());
					}
				}
				EmailUtils.sendMail(prop.getProperty("fromEmail"), prop.getProperty("toEmail"), prop.getProperty("emailName"), prop.getProperty("emailPassword"), "警报！警报！", data);
			} catch (Exception e) {
				EmailUtils.sendMail(prop.getProperty("fromEmail"), prop.getProperty("toEmail"), prop.getProperty("emailName"), prop.getProperty("emailPassword"), "执行异常出错", e.toString());
			}
		}
	}

	/**
	 * 与用户设置的使用率比较 spirng 调度
	 * 
	 * @throws Exception
	 */
	@Scheduled(cron = "1 * *  * * ? ")
	public void task() throws Exception {
		ServerStatus status = Common.getServerStatus();
		String cpuUsage = status.getCpuUsage();// CPU使用率
		String serverUsage = Common.fromUsage(status.getUsedMem(), status.getTotalMem());// 系统内存使用率
		String JvmUsage = Common.fromUsage(status.getJvmFreeMem(), status.getJvmTotalMem());// 计算ＪＶＭ内存使用率
		Properties prop = PropertiesUtils.getProperties();
		String cpu = prop.getProperty("cpu");
		String jvm = prop.getProperty("jvm");
		String ram = prop.getProperty("ram");
		String email = prop.getProperty("toEmail");
		// 当系统消耗内存大于或等于用户设定的内存时，发送邮件
		String cpubool = "";
		String jvmbool = "";
		String rambool = "";
		String mark = "<font color='red'>";
		if (Double.parseDouble(cpuUsage) > Double.parseDouble(cpu)) {
			cpubool = "style=\"color: red;font-weight: 600;\"";
			mark += "CPU当前：" + cpuUsage + "%,超出预设值  " + cpu + "%<br>";
		}
		if (Double.parseDouble(JvmUsage) > Double.parseDouble(jvm)) {
			jvmbool = "style=\"color: red;font-weight: 600;\"";
			mark += "JVM当前：" + JvmUsage + "%,超出预设值 " + jvm + "%<br>";
		}
		if (Double.parseDouble(serverUsage) > Double.parseDouble(ram)) {
			rambool = "style=\"color: red;font-weight: 600;\"";
			mark += "内存当前：" + serverUsage + "%,超出预设值  " + ram + "%";
		}
		mark += "</font>";
		// 邮件内容

		String title = "服务器预警提示";
		String centent = "当前时间是：" + Common.fromDateH() + "<br/><br/>" + "<style type=\"text/css\">" + ".common-table{" + "-moz-user-select: none;" + "width:100%;" + "border:0;" + "table-layout : fixed;" + "border-top:1px solid #dedfe1;" + "border-right:1px solid #dedfe1;" + "}" +

		"/*header*/" + ".common-table thead td,.common-table thead th{" + "    height:23px;" + "   background-color:#e4e8ea;" + "   text-align:center;" + "   border-left:1px solid #dedfe1;" + "}" +

		".common-table thead th, .common-table tbody th{" + "padding-left:7px;" + "padding-right:7px;" + "width:15px;" + "text-align:center;" + "}" +

		".common-table tbody td,  .common-table tbody th{" + "    height:25px!important;" + "border-bottom:1px solid #dedfe1;" + "border-left:1px solid #dedfe1;" + "cursor:default;" + "word-break: break-all;" + "-moz-outline-style: none;" + "_padding-right:7px;" + "text-align:center;" + "}</style>"
				+ "<table class=\"common-table\">" + "<thead>" + "<tr>" + "<td width=\"100\">名称</td>" + "<td width=\"100\">参数</td>" + "<td width=\"275\">预警设置</td>" + "</tr>" + "</thead>" + "<tbody id=\"tbody\">" + "<tr " + cpubool + "><td>CPU</td><td style=\"text-align: left;\">当前使用率：" + cpuUsage
				+ "</td><td>使用率超出  " + cpu + "%,,发送邮箱提示 </td></tr>" + "<tr " + rambool + "><td>服务器内存</td><td style=\"text-align: left;\">当前使用率：" + serverUsage + "</td><td>使用率超出  " + ram + "%,发送邮箱提示 </td></tr>" + "<tr " + jvmbool + "><td>JVM内存</td><td style=\"text-align: left;\">当前使用率：" + JvmUsage
				+ "</td><td>使用率超出  " + jvm + "%,,发送邮箱提示 </td></tr>" + "</tbody>" + "</table>";
		if (!Common.isEmpty(cpubool) || !Common.isEmpty(jvmbool) || !Common.isEmpty(rambool)) {
			try {
				EmailUtils.sendMail(prop.getProperty("fromEmail"), email, prop.getProperty("emailName"), prop.getProperty("emailPassword"), title, centent);
				// 保存预警信息
				ServerInfo vo = new ServerInfo();
				vo.setCpuUsage(cpuUsage);
				vo.setSetCpuUsage(cpu);
				vo.setJvmUsage(JvmUsage);
				vo.setSetJvmUsage(jvm);
				vo.setRamUsage(serverUsage);
				vo.setSetRamUsage(ram);
				vo.setEmail(email);
				vo.setOperTime(new Date());
				vo.setMark(mark);
				serverInfoService.add(vo);
				System.err.println("发送邮件！");
			} catch (Exception e) {
				System.err.println("发送邮件失败！");
			}
		}
	}

	public String task(String username, String pass) throws Exception {

		URL url = null;
		String data = "<font color='red'>";
		try {
			url = new URL("http://www.jhost.cn/os/loginCheck.action?user=" + username + "&pass=" + pass + "&module=login");

			HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
			httpConn.setRequestMethod("GET");
			httpConn.setConnectTimeout(15000);
			httpConn.setReadTimeout(20000);
			httpConn.connect();
			if (httpConn.getResponseCode() == 200) {
				String sessionId = "";
				String cookieVal = null;
				String key = null;
				for (int i = 1; (key = httpConn.getHeaderFieldKey(i)) != null; i++) {
					// System.out.println(key + "-----"+
					// httpConn.getHeaderField(i));
					if (key.equalsIgnoreCase("set-cookie")) {
						cookieVal = httpConn.getHeaderField(i);
						cookieVal = cookieVal.substring(0, cookieVal.indexOf(";"));
						// System.out.println(cookieVal);
						String[] str = sessionId.split(";");
						boolean flag = false;
						for (int t = 0; t < str.length; t++) {
							if (str[t] == cookieVal)
								flag = true;
						}
						if (!flag) {
							sessionId = sessionId + cookieVal + ";";
						}
					}
				}
				sessionId = sessionId.substring(0, sessionId.length() - 1);
				url = new URL("http://www.jhost.cn/user/userControl.action?addDay=3&action=ADD_TIME");
				httpConn = (HttpURLConnection) url.openConnection();
				httpConn.setRequestMethod("GET");
				// System.out.println("second:" + sessionId);
				httpConn.setRequestProperty("Cookie", sessionId);
				httpConn.setDoOutput(true);
				httpConn.setDoInput(true);
				httpConn.setConnectTimeout(15000);
				httpConn.setUseCaches(false);
				data = Common.fromDateH() + " 时刻的调用:<br>";
				data += Common.readHtml(httpConn.getInputStream(), "UTF-8");
			} else {
				data += "jhost 于" + Common.fromDateH() + "　返回服务器状态：" + httpConn.getResponseCode() + "　连接失败！！";
			}
		} catch (SocketTimeoutException e) {
			data += "jhost 于" + Common.fromDateH() + " 连接超时:　" + e;
		} catch (Exception e) {
			data += "jhost 于" + Common.fromDateH() + " 时刻的调用报错　" + e;
		}
		return data + "</font>";
	}
}
