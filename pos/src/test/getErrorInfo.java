package test;
import java.lang.*;
public class getErrorInfo{
	
	public String getErrorInfo(String result, String resultDesc){
	String retInfo = "";
	int a;
	int b;
	if (!"".equals(result)) 
	{
		a = Integer.parseInt(result);
	}else{
		a = 0;
	}
	if(!"".equals(resultDesc)){
	b = Integer.parseInt(resultDesc);
	}else{
		b = 0;
	}	

	if(a == 1){
		retInfo ="支付成功";
		return retInfo;
	}
	else
		{
			switch(b){
				case 0:
					retInfo = "充值失败";
					break;
				case 1:
					retInfo = "系统错误";
					break;
				case 2:
					retInfo = "订单超时";
					break;
				case 11:
					retInfo = "系统维护";
					break;
				case 12:
					retInfo = "无效商户";
					break;
				case 13:
					retInfo = "余额不足";
					break;
				case 14:
					retInfo = "超过支付限额";
					break;
				case 15:
					retInfo = "卡号或卡密错误";
					break;
				case 16:
					retInfo = "不合法的IP地址";
					break;
				case 17:
					retInfo = "重复订单金额不符";
					break;
				case 18:
					retInfo = "卡密已被使用";
					break;
				case 19:
					retInfo = "订单金额错误";
					break;
				case 20:
					retInfo = "支付的类型错误";
					break;
				case 21:
					retInfo = "卡类型有误";
					break;
				case 22:
					retInfo = "卡信息不完整";
					break;
				case 23:
					retInfo = "卡号，卡密，金额不正确";
					break;
				case 24:
					retInfo = "不能用此卡继续做交易";
					break;
				case 25:
					retInfo = "订单无效";
					break;
				case 26:
					retInfo = "卡无效";
					break;
				default:
					retInfo = "支付失败";
					break;
				}

				return retInfo;
			}
		}
public static void main(String agrs[]) {
	getErrorInfo m = new getErrorInfo();
	System.out.println("result=24;resultDesc=0024:"+m.getErrorInfo("24","0024"));
	System.out.println("result=1;resultDesc=0000:"+m.getErrorInfo("1","0000"));
	System.out.println("result=33;resultDesc=0033:"+m.getErrorInfo("33","0033"));
	System.out.println("result=2;resultDesc=0002:"+m.getErrorInfo("2","0002"));
	System.out.println("result= ;resultDesc=:"+m.getErrorInfo("",""));

	}
}
