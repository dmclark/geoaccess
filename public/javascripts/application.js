$(function() {
	if ($('#directions').length > 0) {
		getdirections;
	};
})

function getdirections() {
	$.getscript("/directions/create.js")
}

