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
    
 });



