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
	
	@Scheduled(cron = "0 00 12 * * ?")
//	@Scheduled(cron = "0/10 * * * * ? ")
	public void updateVacaStateToUse() {
		
		// 연차 사용완료로 변경 로직
		// 1. 업데이트 할 연차 리스트를 뽑는다.
		List<VacaVO> list = vacaService.selectVacaListToUpdate(calcCalendar.getTodayDate());
		
		if(list.size()!=0) {
			// 2. 1의 연차 리스트의 유저 보유, 사용 연차를 업데이트한다.
			int updateTimeCnt = vacaService.minusUserVaca(list);
			
			// 3. 1의 연차 상태를 사용완료로 변경한다.
			int updateStateCnt = vacaService.updateVacaStateToUse(list);
			
			System.out.println("리스트 사이즈: "+list.size());
			System.out.println("user 업데이트 여부: "+updateTimeCnt);
			System.out.println("vaca 업데이트 여부: "+updateStateCnt);
			
		}else {
			System.out.println("업데이트 할 항목 없음");
		}
		
	}
	
}
