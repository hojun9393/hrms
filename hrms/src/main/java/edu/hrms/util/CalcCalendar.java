package edu.hrms.util;

import java.text.DateFormat;
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
		return todayDate.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
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
	
	public boolean isParamBeforeNow(String timeParam){
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
	
	
	
	public int getVacationDays(String startDate, String endDate) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date dateStartDate = null;
		Date dateEndDate = null;
	    try {
	        dateStartDate = df.parse(startDate);
	        dateEndDate = df.parse(endDate);
	    } catch (ParseException parseException) {
	        System.out.println(parseException.getStackTrace());
	    }

	    Calendar cal1 = Calendar.getInstance();
	    cal1.setTime(dateStartDate);
	    Calendar cal2 = Calendar.getInstance();
	    cal2.setTime(dateEndDate);
	    int vacationDays = 1;
	    int weekendDays = 0;

	    while (cal1.before(cal2)) {
	        if (Calendar.SATURDAY != cal1.get(Calendar.DAY_OF_WEEK) && (Calendar.SUNDAY != cal1.get(Calendar.DAY_OF_WEEK))) {
	        	vacationDays++;
	        }else {
	        	weekendDays++;
	        }
	        cal1.add(Calendar.DATE, 1);
	        startDate = df.format(cal1.getTime());
	    }
	    System.out.println("vacationDays : " + vacationDays);
	    System.out.println("weekendDays : " + weekendDays);
	    
	    return vacationDays;
	}
	
	public int getUseHour(String startDate, String endDate) {
		
		int useHours = 0;
		int vacationDays = getVacationDays(startDate, endDate);
		
		
		
		return useHours;
	}
	
	
	
	
	
	
	
	
	

}
