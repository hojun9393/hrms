function selectFn(obj) {
	let selected = obj.id;
	if (selected == "docu") {
		obj.setAttribute("class", "font-weight-bold text-primary py-1 mr-4 border-bottom-primary d-inline");
		document.querySelector("#vaca").setAttribute("class", "font-weight-bold text-secondary py-1 mr-4 d-inline");
		document.querySelector("#over").setAttribute("class", "font-weight-bold text-secondary py-1 d-inline");

		document.querySelector(".docuTable").setAttribute("class", "table table-bordered text-center docuTable");
		document.querySelector(".vacaTable").setAttribute("class", "table table-bordered text-center vacaTable d-none");
		document.querySelector(".overTable").setAttribute("class", "table table-bordered text-center overTable d-none");
	} else if (selected == "vaca") {
		obj.setAttribute("class", "font-weight-bold text-primary py-1 mr-4 border-bottom-primary d-inline");
		document.querySelector("#docu").setAttribute("class", "font-weight-bold text-secondary py-1 mr-4 d-inline");
		document.querySelector("#over").setAttribute("class", "font-weight-bold text-secondary py-1 d-inline");

		document.querySelector(".docuTable").setAttribute("class", "table table-bordered text-center docuTable d-none");
		document.querySelector(".vacaTable").setAttribute("class", "table table-bordered text-center vacaTable");
		document.querySelector(".overTable").setAttribute("class", "table table-bordered text-center overTable d-none");
	} else if (selected == "over") {
		obj.setAttribute("class", "font-weight-bold text-primary py-1 border-bottom-primary d-inline");
		document.querySelector("#docu").setAttribute("class", "font-weight-bold text-secondary py-1 mr-4 d-inline");
		document.querySelector("#vaca").setAttribute("class", "font-weight-bold text-secondary py-1 mr-4 d-inline");

		document.querySelector(".docuTable").setAttribute("class", "table table-bordered text-center docuTable d-none");
		document.querySelector(".vacaTable").setAttribute("class", "table table-bordered text-center vacaTable d-none");
		document.querySelector(".overTable").setAttribute("class", "table table-bordered text-center overTable");
	}
}