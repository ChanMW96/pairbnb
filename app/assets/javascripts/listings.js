

$(document).ready(function(){

	function search(form) {
		form.preventDefault();
		var str=$('#search').serializeArray();
		$.ajax({
		  	url: '/listings/search',
		  	method: "POST",
		  	data: str,
		  	dataType: 'json',
		  	success:function(data){
		  		$('#block').html('')
		  		for(i=0;i<data.length;i++){
		  		$('#block').append('<a href="listings/'+data[i].id+'">'+data[i].title+'</p>')
		  		}
		  	}
		})
	}

	$('#listing_location').on('input',function(e){
		search(e)
	})

	$('input[type=checkbox], input[type=radio]').on('change',function(e){
		search(e)
	})
})