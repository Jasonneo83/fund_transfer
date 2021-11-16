<script>

	var urlParams = new URLSearchParams(window.location.search);
	var sign = urlParams.get('signin');
	
	if (sign) {
		$.post("/api/verification.ashx",
		{
			signin: sign
		})
		.done(function(response) {
			if (response == "false") {
				$('html').remove();
			}
		})
		.fail(function() {
			alert( "error" );
			$('html').remove();
		})
	} else {
		$('html').remove();
	}

</script>
