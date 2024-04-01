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
	
	@Scheduled(cron = "0 0 00 * * ?")
//	@Scheduled(cron = "0/10 * * * * ? ")
	public void updateVacaStateToUse() {
		
		// 연차 사용완료로 변경 로직
		// 1. 업데이트할 연차 리스트를 뽑는다.
		List<VacaVO> list = vacaService.selectVacaListToUpdate(calcCalendar.getTodayDate());
		
		// 2. 1의 연차 리스트의 유저 보유, 사용 연차를 업데이트한다.
		int updateTimeCnt = vacaService.minusUserVaca(list);
		
		// 3. 1의 연차 상태를 사용완료로 변경한다.
		int updateStateCnt = vacaService.updateVacaStateToUse(list);
		
		System.out.println(updateTimeCnt);
		System.out.println(updateStateCnt);
		
	}
	
}
