package edu.hrms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.hrms.service.MessageService;
import edu.hrms.vo.MsgReceiveVO;

@Controller
@RequestMapping(value = "/message")
public class MessageController {
	
	@Autowired
	MessageService messageService;
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main() {
		
		return "/message/main";
	}
	
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public String write() {
		
		return "/message/write";
	}
	
   
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String write(@RequestParam List<Integer> userId, String content) {
		if(content != null && !content.equals("")) {
			
		}else {
			
		}
		for(int i=0; i<userId.size(); i++) {
			System.out.println(userId.get(i));
		}
		System.out.println("content : "+content);
		return "/message/main";
	}
	
	@RequestMapping(value = "/receiverPlus.do")
	@ResponseBody
	public Map<String, Object> receiverPlus() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<MsgReceiveVO> receiverList = messageService.selectReceiverAll();
		List<Map<String, String>> deptCount = messageService.selectDeptCount();
		map.put("receiverList", receiverList);
		map.put("deptCount", deptCount);
		return map;
	}
	
}
