package com.zs.pms.util;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @author Administrator
 *	时间工具类
 */

public class DateUtil {

	/**
	 * 获得当前时间的方法（字符串）
	 * @return 返回当前时间字符串
	 */
	public static String getStrDate() {
		//获得日历对象
		Calendar cal=Calendar.getInstance();
		//当前的年
		int year =cal.get(Calendar.YEAR);
		//当前的月(月份从0开始)
		int month=cal.get(Calendar.MONTH)+1;		
		//当前的日
		int date=cal.get(Calendar.DAY_OF_MONTH);
		//当前的小时
		int hour=cal.get(Calendar.HOUR_OF_DAY);
		//通过当前消失来判断是上午还是下午
		String str="";
		if (hour>=6&&hour<=11) {
			str="上午好";
		}else if (hour>11&&hour<=14) {
			str="中午好";
		}else if (hour>14&&hour<=18) {
			str="下午好";
		}else if (hour>18&&hour<=24) {
			str="晚上好";
		}else {
			str="玩你妹，滚去睡！！！";
		}
		return year+"-"+month+"-"+date+" "+str;
	}
	
	/**
	 * 字符串转date的方法
	 * @param time 字符串
	 * @param pattern 输入字符串的时间格式
	 * @return date的时间
	 * @throws ParseException
	 */
	public static Date getStrToDate(String time,String pattern) throws ParseException {
		//获得格式化对象
		SimpleDateFormat sdf=new SimpleDateFormat(pattern);
		//返回格式化好的时间
		return sdf.parse(time);
	}
	
	/**
	 * 时间转字符串的方法
	 * @param time 传入的时间
	 * @param pattern 输入字符串的时间格式
	 * @return String 的时间
	 */
	public static String getDateToStr(Date time,String pattern) {
		//获得格式化对象
		SimpleDateFormat sdf=new SimpleDateFormat(pattern);
		//返回格式化好的时间
		return sdf.format(time);
	}
	
	
}
