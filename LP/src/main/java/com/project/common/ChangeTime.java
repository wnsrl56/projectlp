package com.project.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class ChangeTime {
	

	private Date realRegDate;
	
	
	public String changeDate(Date realRegDate){
		
		String dateToString = null;
		long timenum;
		System.out.println(realRegDate);
		timenum=realRegDate.getTime();
		System.out.println("realtime:"+timenum);
		
		
		Calendar calendar = Calendar.getInstance();	
		Date todaytimenum = calendar.getTime();
		long ttimeNum = todaytimenum.getTime();
        String todaylength = (new SimpleDateFormat("yyyy-MM-dd-HH시mm분ss초").format(todaytimenum));
	//	System.out.println("오늘날짜:"+todaylength);
		
		
		long timediff = ttimeNum - timenum;
		System.out.println(timediff);
		timediff = timediff/1000;
		
		if(timediff < 60){
			dateToString =  timediff + " 초 전";
		}else if(timediff < 3600){
			dateToString = (timediff/60) + " 분 전";
		}else if(timediff < 86400){
			dateToString = (timediff/3600) + " 시간 전";
		}else{
			dateToString =  (new SimpleDateFormat("yyyy-MM월-dd일-HH시").format(realRegDate));
		}
		
		
	//	System.out.println("현재 차이 시간:"+timediff);
	//	System.out.println(dateToString);
		
		
		return dateToString;
	}
	

}
