const menu1 = document.querySelector("#menu1");
const menu2 = document.querySelector("#menu2");
const menu3 = document.querySelector("#menu3");
const overtimeReqDiv = document.querySelector("#overtimeReqDiv");
const searchDiv = document.querySelector("#searchDiv");

function displayFn(obj){
	if(obj==1){
		menu1.style.display = "block";
		menu2.style.display = "none";
		menu3.style.display = "none";
		overtimeReqDiv.style.display = "block";
		searchDiv.style.display = "none";
	}else if(obj==2){
		menu1.style.display = "none";
		menu2.style.display = "block";
		menu3.style.display = "none";
		overtimeReqDiv.style.display = "block";
		searchDiv.style.display = "none";
	}else if(obj==3){
		menu1.style.display = "none";
		menu2.style.display = "none";
		menu3.style.display = "block";
		overtimeReqDiv.style.display = "none";
		searchDiv.style.display = "block";
	}
}