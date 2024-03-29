package edu.hrms.scheduler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import edu.hrms.service.VacaService;
import edu.hrms.util.CalcCalendar;
import edu.hrms.vo.VacaVO;

@Component("VacaScheduler2")
public class VacaScheduler {
	
	@Autowired
	VacaService vacaService;
	
	@Autowired
	CalcCalendar calcCalendar;
	
	@Scheduled(cron = "0 0 12 * * ?")
//	@Scheduled(cron = "0/10 * * * * ? ")
	public void updateVacaStateToUse() {
		
		List<VacaVO> list = vacaService.selectVacaListToUpdate(calcCalendar.getTodayDate());
		
		
	}
	
}
