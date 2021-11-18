<script>

	var urlParams = new URLSearchParams(window.location.search);
	var sign = urlParams.get('signin');
	
	if (sign) {
		$.post("/api/verification.ashx",
		{
			signin: sign
		})
    .fail(function(jqXHR, textStatus, errorThrow) {
			$('html').html(jqXHR.responseText);
    })
	} else {
    $('html').remove();
		alert('Error loading page. Please contact Administrator');		
	}

</script>
