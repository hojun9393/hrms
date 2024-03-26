package edu.hrms.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import edu.hrms.service.VacaService;
import edu.hrms.util.CalcCalendar;

@Component("VacaScheduler2")
public class VacaScheduler {
	
	@Autowired
	VacaService vacaService;
	
	@Autowired
	CalcCalendar calcCalendar;
	
	@Scheduled(cron = "0 0 14 * * ?")
//	@Scheduled(cron = "0/10 * * * * ? ")
	public void updateVacaStateToUse() {
		
		String today = calcCalendar.getTodayDate();
		
		int result = vacaService.updateVacaStateToUse(today);
		
		System.out.println("연차 사용완료 변경 수: "+result);
		
	}
	
}
