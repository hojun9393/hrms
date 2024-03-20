package edu.hrms.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class CalcCalendar {

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
	
	public int getWeekOfYear(String date) {    
		Calendar calendar = Calendar.getInstance();   
		String[] dates = date.split("-");    
		int year = Integer.parseInt(dates[0]);    
		int month = Integer.parseInt(dates[1]);    
		int day = Integer.parseInt(dates[2]);    
		calendar.set(year, month - 1, day);
		
		return calendar.get(Calendar.WEEK_OF_YEAR);
	}
	
	public Map<String, String> getFirstLastDays(String date) {
		Calendar calendar = Calendar.getInstance();   
		String[] dates = date.split("-");    
		int year = Integer.parseInt(dates[0]);    
		int month = Integer.parseInt(dates[1]);    
		int day = Integer.parseInt(dates[2]);    
		calendar.set(year, month - 1, day);
		
		Map<String, String> map = new HashMap<>();
		
		calendar.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		map.put("startDay", sdf.format(calendar.getTime()));
			
		calendar.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
		map.put("endDay", sdf.format(calendar.getTime()));
		
		return map;
	}
	
	
	

}
