package com.bzrglxt.utils;

import java.util.GregorianCalendar;
import java.util.Locale;

public class DateUtils {
	public static String getBhDate(){
		//按年月日时分秒毫秒反回字符串
		String bh="";
		GregorianCalendar cal = new GregorianCalendar(Locale.CHINA);
		int year = cal.get(cal.YEAR);
		
		int month = cal.get(cal.MONTH)+1;
		String strMon = month<10?"0"+month:""+month;
		
		int date = cal.get(cal.DATE);
		String strDate = date<10?"0"+date:""+date;
		
		int hour = cal.get(cal.HOUR);
		String strHour = hour<10?"0"+hour:""+hour;
		
		int min = cal.get(cal.MINUTE);
		String strMin = min<10?"0"+min:""+min;
		
		int sec = cal.get(cal.SECOND);
		String strSec = sec<10?"0"+sec:""+sec;;
		
		int mill = cal.get(cal.MILLISECOND);
		String strMill="";
		if(mill<10)
			strMill = "00"+mill;
		else if((mill>=10&&mill<100))
			strMill = "0"+mill;
		else 
			strMill=""+mill;
		
		bh = year+""+strMon+""+strDate+""+strHour+""+strMin+""+strSec+""+strMill;
		return bh;
	}
	
	public static String getShortStrDate(){
		String bh="";
		GregorianCalendar cal = new GregorianCalendar(Locale.CHINA);
		int year = cal.get(cal.YEAR);
		
		int month = cal.get(cal.MONTH)+1;
		String strMon = month<10?"0"+month:""+month;
		
		int date = cal.get(cal.DATE);
		String strDate = date<10?"0"+date:""+date;

		bh=year+"-"+strMon+"-"+strDate;
		return bh;
	}
	public static void main(String[] args){/*
		try{
		for(long i=1;i<10;i++){
				System.out.println(DateUtils.getBhDate());
				Thread thread = Thread.currentThread();
				thread.sleep(1000/30);
		}
		}catch(Exception e){
			e.printStackTrace();
		}
	*/}
}
