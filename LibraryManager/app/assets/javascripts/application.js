// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
	$('.showBookSearch').click(function(){
		$('#book_select').slideToggle("fast");
	});

	$('#searchBookData').keyup(function(){
		var searchTerm = $(this).val();
		
		if(searchTerm !== '') {
			var url = '/books/ajaxsearchbooks';
			var searchdata = { 'searchterm' : searchTerm };
			console.log(url);
			console.log(searchdata);
			
			$.ajax({
				url: url,
				type: "POST",
				dataType:'html',
				data: searchdata,
				success: function(data){
					console.log(data);
					$('#bookSearchResults').css('visibility','visible');
					$('#bookSearchResults').empty();
					$('#bookSearchResults').append(data);
				}
			});
		}
		else
		{
			$('#bookSearchResults').empty();
			$('#bookSearchResults').css('visibility','hidden');
		}
	});

//	setTimeout(function(){
 // window.location.reload(1);
//}, 5000);

});