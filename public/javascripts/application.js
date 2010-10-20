$(document).ready(function() {
	
	$('.budget-edit').editable('/budget/update', {
	    name		:	$(this).attr('name'),
	    id			:	$(this).attr('id'),
	    cancel		:	'Cancel',
	    submit		:	'OK',
	    indicator	:	'Saving...',
	    tooltip		:	'Click to edit...',
		method		: 	'put'
	  });
	
	$('.item-edit').editable('/item/update', {
	    name		:	$(this).attr('name'),
	    id			:	$(this).attr('id'),
	    cancel		:	'Cancel',
	    submit		:	'OK',
	    indicator	:	'Saving...',
	    tooltip		:	'Click to edit...',
		method		: 	'put',
		submitdata 	: 	{attribute : "name"}
	  });
	
	$('.item-amount').editable('/item/update', {
	    name		:	$(this).attr('name'),
	    id			:	$(this).attr('id'),
	    cancel		:	'Cancel',
	    submit		:	'OK',
	    indicator	:	'Saving...',
	    tooltip		:	'Click to edit...',
		method		: 	'put',
		submitdata 	: 	{attribute : "amount"}
	  });
	
	$('a.delete').click (function(){
	        if(confirm("Are you sure?")){
	            return true;
	        } else {
	            //they clicked no.
	            return false;
	        }
	});
	
 });



