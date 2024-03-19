package edu.hrms.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

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
	
	

}
