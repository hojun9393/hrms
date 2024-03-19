const menu1 = document.querySelector("#menu1");
const menu2 = document.querySelector("#menu2");

function displayFn(obj){
	if(obj==1){
		menu1.style.display = "block";
		menu2.style.display = "none";
	}else if(obj==2){
		menu1.style.display = "none";
		menu2.style.display = "block";
	}
}