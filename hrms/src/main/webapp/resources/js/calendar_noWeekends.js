$.datepicker.setDefaults({
	closeText: "닫기",
	prevText: "이전달",
	nextText: "다음달",
	currentText: "오늘",
	monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
		"7월", "8월", "9월", "10월", "11월", "12월"
	],
	monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
		"7월", "8월", "9월", "10월", "11월", "12월"
	],
	dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
	dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
	dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
	weekHeader: "주",
	dateFormat: "yy-mm-dd", // 날짜형태 예)yy년 m월 d일
	firstDay: 0,
	isRTL: false,
	showMonthAfterYear: true,
	yearSuffix: "년"
})

/*function noWeekendsOrHolidays(date) {
	var noWeekend = $.datepicker.noWeekends(date);
	return noWeekend[0] ? [true] : noWeekend;
}*/

/*$(".datepicker").datepicker({
	beforeShowDay: function(date){
		console.log("js test");
		return [(date.getDay() != 0 && date.getDay() != 6)];
	}
})*/

function iClickFn(clicked) {
	clicked.focus();
}