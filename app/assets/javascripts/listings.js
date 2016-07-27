$(document).ready(function(){

	// $.rails.fire = function(obj, name, data) {
	//   var event = $.Event(name);

	//   // Custom code:
	//   // e.g. "Fire ajax:before for my-form!"
	//   console.log("Fire " + name + " for " + obj.attr('id') + "!");

	//   obj.trigger(event, data);
	//   return event.result !== false;
	// };

	// function search(form) {
	// 	form.preventDefault();
	// 	var str=$('#search').serializeArray();
	// 	$.ajax({
	// 	  	url: '/listings/search',
	// 	  	method: "POST",
	// 	  	data: str,
	// 	  	contentType: 'application/x-javascript'
	// 	  	success:function(data){
	// 	  		debugger
	// 	  		$('#block').load('#block')
	//   		}
	//   	})
	// }
	function fill_date(start_date, end_date){
		$.each($('input#reservation_start_date'), function(index, el){
			$(el).val(start_date);
		});

		$.each($('input#reservation_end_date'), function(index, el){
			$(el).val(end_date);
		});
	}

	function submit_search(e){
		form = $(e.target).parent('form');
		// .siblings('input[type="submit"]').click();
		submit_btn = form.find('input[type="submit"]');
		submit_btn.trigger('click');
	}

	$('.daterange').daterangepicker({
	    minDate: moment(),
	    endDate: moment().add(1, 'days'),
	    locale: {
	    	format: 'DD-MM-YYYY'
	    }
	});

	$('.daterange').on('apply.daterangepicker',function(e){
		submit_search(e);
	});

	$('#search').on('input',function(e){
		submit_search(e);
	});

	$('input[type=checkbox]').on('change',function(e){
		submit_search(e);
	});

	$('.daterange').on('change', function(e){
		dates = $(e.target).val().split(' - ');
		start_date = dates[0];
		end_date = dates[1];
		fill_date(start_date, end_date);
	});
})