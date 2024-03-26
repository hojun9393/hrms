function selectFn(obj){
	let selected = obj.id;
	if(selected=="received"){
		obj.setAttribute("class", "font-weight-bold text-primary py-1 mr-4 border-bottom-primary d-inline");
		document.querySelector("#sent").setAttribute("class", "font-weight-bold text-secondary py-1 d-inline");
		
		document.querySelector(".received").setAttribute("class", "table table-bordered text-center received");
		document.querySelector(".sent").setAttribute("class", "table table-bordered text-center sent d-none");
	}else if(selected=="sent"){
		obj.setAttribute("class", "font-weight-bold text-primary py-1 mr-4 border-bottom-primary d-inline");
		document.querySelector("#received").setAttribute("class", "font-weight-bold text-secondary py-1 mr-4 d-inline");
		
		document.querySelector(".received").setAttribute("class", "table table-bordered text-center received d-none");
		document.querySelector(".sent").setAttribute("class", "table table-bordered text-center sent");
	}
}