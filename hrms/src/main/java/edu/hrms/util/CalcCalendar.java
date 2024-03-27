package edu.hrms.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class CalcCalendar {

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
	Calendar calendar = Calendar.getInstance();
	LocalDate todayDate = LocalDate.now();
	
	public Map<String, String> getFirstLastDays(String date) {
		String[] dates = date.split("-");    
		int year = Integer.parseInt(dates[0]);    
		int month = Integer.parseInt(dates[1]);    
		int day = Integer.parseInt(dates[2]);    
		calendar.set(year, month - 1, day);
		
		Map<String, String> map = new HashMap<>();
		map.put("weekOfYear", Integer.toString(calendar.get(Calendar.WEEK_OF_YEAR)));
		calendar.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		map.put("startDay", sdf.format(calendar.getTime()));
		calendar.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
		map.put("endDay", sdf.format(calendar.getTime()));
		
		return map;
	}
	
	
	public String getTodayDate() {
		return todayDate.toString();
	}
	
	public String getNowTime() {
		LocalDateTime now = LocalDateTime.now();
		return now.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
	}
	
	public boolean compareDatetime(String timeParam){
		
		SimpleDateFormat sdfDatetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time;
		Date now = new Date();
		boolean result = false;
		try {
			time = sdfDatetime.parse(timeParam);
			result = now.after(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean compareDatetimeBefore(String timeParam){
		
		SimpleDateFormat sdfDatetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date startTime;
		Date now = new Date();
		boolean result = false;
		try {
			startTime = sdfDatetime.parse(timeParam);
			result = now.before(startTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
