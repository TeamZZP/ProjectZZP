<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<div class="container">
	<div class="row">
		<div class="col-lg-4">
			<jsp:include page="../admin/accountForm_admin.jsp" flush="true"></jsp:include><br>
		</div>
		<div class="col-lg-8">
			<jsp:include page="../admin/addressList_admin.jsp" flush="true"></jsp:include><br>
		</div>
	</div>
</div>