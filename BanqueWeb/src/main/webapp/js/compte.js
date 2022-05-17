function deleteCompte(rib) {
	
	swal({
		title: "Are you sure?",
		text: "Once deleted, you will not be able to recover this account!",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
		.then((willDelete) => {
			if (willDelete) {
				$.ajax({
					type: "POST",
					url: "CompteServlet",
					data: { 'action': 'delete-ajax', 'rib': rib},
					success: function() {
						swal("Poof! Your account has been deleted!", {
							icon: "success",
						});
						$("#" + rib).remove();
					}
					
				});
			} else {
				swal("Your account is safe!");
				
			}
		});

}