$(document).ready(function() {
	
	$('#income-disposable .amount .edit').editable('/income/update', {
	    name		:	$(this).attr('name'),
	    id			:	$(this).attr('id'),
	    cancel		:	'Cancel',
	    submit		:	'OK',
	    indicator	:	'Saving...',
	    tooltip		:	'Click to edit...',
		method		: 	'put'
	});
	
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
		callback : function(value, settings) {
	        
	     },
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



