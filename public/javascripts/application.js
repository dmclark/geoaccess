$(function() {
       // alert('hi there');
       $('#direction_submit').click(function(){
               $('#directions').html('<%= escape_javascript(render("directions")) %>');
         $('#directions').addClass('highlight');
       });
})


function getdirections() {
	$.getscript("/directions/create.js");
}

