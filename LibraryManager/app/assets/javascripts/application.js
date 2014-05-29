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
var previousPageURL = document.referrer;

$(document).ready(function(){
	$('#default-banner #site-title').css("visibility","hidden");			
	$('#default-banner #site-title').hide();

	$('.signin').click(function(){
		$('.login-box').css('visibility','visible');
		$('.login-box').addClass('show');
		$('.arrow-up').css('visibility','visible');
		$('.arrow-up').addClass('show');
	});

	$('.modal-close').click(function(){
	  	var divToClose = $(this).parent().parent();
      	console.log(divToClose);
      	divToClose.css("visibility","hidden");
      	divToClose.removeClass('in');
      	divToClose.removeClass('show');
      	if(divToClose.hasClass('login-box')){
      		anotherDivToClose = divToClose.prev();
	      	anotherDivToClose.css("visibility","hidden");
	      	anotherDivToClose.removeClass('in');
	      	anotherDivToClose.removeClass('show');      		
      	}

	});

	$('.showBookSearch').click(function(){
		$('#book_select').slideToggle("fast");
	});

	$('#searchBookData').keyup(function(event){
		var searchTerm = $(this).val();
		
		if(event.keyCode != 27)
		{
			if(searchTerm !== '') {
				var url = '/books/ajaxsearchbooks';
				var searchdata = { 'searchterm' : searchTerm };
				$.ajax({
					url: url,
					type: "POST",
					dataType:'html',
					data: searchdata,
					success: function(data){
						$('#bookSearchResults').css('visibility','visible');
						$('.book-search-results-content').empty();
						$('.book-search-results-content').append(data);
					}
				});
			}
			else
			{
				$('.book-search-results-content').empty();
				$('#bookSearchResults').css('visibility','hidden');
			}
		}
	});

	$("#main-container .serial-number[title]").tooltips();

	$('#excel_submit').bind('click',function(){
		var file = $('#file').val();
		if(file == ''){
			alert('Please select a file.');
			return false;	
		}
		else
		{
			var ext = file.split('.').pop();
			if($.inArray(ext,['csv','xls','xlsx']) == -1 ){
				alert("Please upload a .csv , .xls , or .xlsx file");
				return false;
			}
			else
			{
				console.log("valid format");
				return true;
			}
		}    
	});
	        
	$('.tabs-container ul').each(function(){
        var $links = $(this).find('a');
        var $active = $($links.filter('[href="' + location.hash + '"]')[0] || $links[0]);
        $active.parent().addClass('active');
        $content = $($active.attr('href'));
        $content.show();
        $links.not($active).each(function () {
           $(this.hash).hide();
        });


        $(this).on('click', 'a', function(e){
          $active.parent().removeClass('active');
          $content.hide();

          $active = $(this);
          $content = $(this.hash);

          $active.parent().addClass('active');
          $content.show();

          e.preventDefault();
        });
    });

// End of Document.ready
});

$(window).keyup(function(event){
	if(event.keyCode == 27)
	{
		if(!$('#bookSearchResults').is('hidden'))
		{
			$('.book-search-results-content').empty();
			$('#bookSearchResults').css('visibility','hidden');
		}
	}
});

$(window).mouseup(function(event){
	var clickedElement = $(event.target);
	var parentsTree = clickedElement.parents();
	var flag = false; 

	$.each(parentsTree,function(key,value){
		if($(value).hasClass('book-search-results')){
			flag = true;
			return false;
		}
	});


	if(!flag)
	{
		if($('#bookSearchResults').css("visibility") == "visible")
		{
			$('.book-search-results-content').empty();
			$('#bookSearchResults').css('visibility','hidden');
		}
	}
});

$(window).scroll(function(){
	var top = $(window).scrollTop();
	if(top >= 56)
	{
		$('.default-banner-wrapper').addClass('fixed');
		$('#default-banner #site-title').css("visibility","visible");
		$('#default-banner #site-title').show("slow");
	}
	else if (top < 56)
	{
		$('.default-banner-wrapper').removeClass('fixed');	
		$('#default-banner #site-title').css("visibility","hidden");			
		$('#default-banner #site-title').hide();
	}
});

function Randomize() {
	var images = new Array('1.jpg',
						   '2.jpg',
						   '3.jpg',
						   '7.jpg',
						   '8.jpg',
						   '9.jpg',
						   '10.jpg',
						   '11.jpg',
						   '12.jpg',
						   '13.jpg',
						   '14.jpg'
						   );
	var imageNum = Math.floor(Math.random() * images.length);
	document.getElementById("banner").style.background = "asset-data-url('" + images[imageNum] + "')";
}

window.onload = Randomize;