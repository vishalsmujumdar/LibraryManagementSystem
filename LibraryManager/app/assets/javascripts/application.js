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
//= require turbolinks
//= require_tree .

$(document).ready(function(){

	$('.usersubmit').click(function(){
		var form = $(this);
		console.log(form.attr('id'));
	});

	$('#searchData').keyup(function(){
		var searchTerm = $(this).val();
		
		if(searchTerm !== '') {
			var host = window.location.host;
			var url = 'http://' + host + '/users/ajaxsearchusers';
			var searchdata = { 'searchterm' : searchTerm };

			$.ajax({
				url: url,
				type: "POST",
				dataType:'html',
				data: searchdata,
				success: function(data){
					$('#searchResults').css('visibility','visible');
					$('#searchResults').empty();
				//	$.each(data,function(key,value){
				//		var user = eval(value);
				//		var html = '<div id="id_' + user.employee_id + '" class="user"><p>' +
				//						user.name + '&nbsp&nbsp' + user.employee_id +
				//						'<br />' + user.email +
				//						'<input type="button" id="id_' + user.employee_id + '" class="user_selector" value="Select" />'
				//				   '</p><hr>';
						//data = data.replace(/&lt;/g,'<').replace(/&gt;/g,'>');
						$('#searchResults').append(data);
				//

				//	});
					console.log(data);	
				}
			});
		}
		else
		{
			$('#searchResults').empty();
			$('#searchResults').css('visibility','hidden');
		}
	});

	


});


function userSelect(){
	var user = $(this);

	alert(user.attr('id'));

	return false;
}