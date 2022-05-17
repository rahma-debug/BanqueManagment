function deleteClient(index) {
	swal({
		title: "Are you sure?",
		text: "Once deleted, you will not be able to recover this Client!",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
		.then((willDelete) => {
			if (willDelete) {
				$.ajax({
					type: "POST",
					url: "ClientServlet",
					data: { 'action': 'delete-ajax', 'index': index },
					success: function() {
						swal("Poof! Your client has been deleted!", {
							icon: "success",
						});
						$("#" + index).remove();
					}
					
				});
			} else {
				swal("Your client is safe!");
			}
		});

}