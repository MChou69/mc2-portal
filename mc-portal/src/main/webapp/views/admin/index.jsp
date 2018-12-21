<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h4>${pageName}</h4>
			<div class="table-responsive">
				<table id="mytable" class="table table-bordred table-striped">
	
					<thead>
						<tr>
							<th><input type="checkbox" id="checkall" /></th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Address</th>
							<th>Email</th>
							<th>Contact</th>
							
							<th>Edit</th>
							<th>Delete</th>
						</tr>						
					</thead>
					<tbody>
	
						<tr>
							<td><input type="checkbox" class="checkthis" /></td>
							<td>Mohsin</td>
							<td>Irshad</td>
							<td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
							<td>isometric.mohsin@gmail.com</td>
							<td>+923335586757</td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Edit">
									<button class="btn btn-primary btn-xs" data-title="Edit"
										data-toggle="modal" data-target="#edit">
										<i class="fa fa-pencil-square-o"></i>
									</button>
								</p></td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Delete">
									<button class="btn btn-danger btn-xs" data-title="Delete"
										data-toggle="modal" data-target="#delete">
										<i class="fa fa-trash"></i>
									</button>
								</p></td>
						</tr>
	
						<tr>
							<td><input type="checkbox" class="checkthis" /></td>
							<td>Mohsin</td>
							<td>Irshad</td>
							<td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
							<td>isometric.mohsin@gmail.com</td>
							<td>+923335586757</td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Edit">
									<button class="btn btn-primary btn-xs" data-title="Edit"
										data-toggle="modal" data-target="#edit">
										<i class="fa fa-pencil-square-o"></i>
									</button>
								</p></td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Delete">
									<button class="btn btn-danger btn-xs" data-title="Delete"
										data-toggle="modal" data-target="#delete">
										<i class="fa fa-trash"></i>
									</button>
								</p></td>
						</tr>
	
	
						<tr>
							<td><input type="checkbox" class="checkthis" /></td>
							<td>Mohsin</td>
							<td>Irshad</td>
							<td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
							<td>isometric.mohsin@gmail.com</td>
							<td>+923335586757</td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Edit">
									<button class="btn btn-primary btn-xs" data-title="Edit"
										data-toggle="modal" data-target="#edit">
										<i class="fa fa-pencil-square-o"></i>
									</button>
								</p></td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Delete">
									<button class="btn btn-danger btn-xs" data-title="Delete"
										data-toggle="modal" data-target="#delete">
										<i class="fa fa-trash"></i>
									</button>
								</p></td>
						</tr>
						<tr>
							<td><input type="checkbox" class="checkthis" /></td>
							<td>Mohsin</td>
							<td>Irshad</td>
							<td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
							<td>isometric.mohsin@gmail.com</td>
							<td>+923335586757</td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Edit">
									<button class="btn btn-primary btn-xs" data-title="Edit"
										data-toggle="modal" data-target="#edit">
										<i class="fa fa-pencil-square-o"></i>
									</button>
								</p></td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Delete">
									<button class="btn btn-danger btn-xs" data-title="Delete"
										data-toggle="modal" data-target="#delete">
										<i class="fa fa-trash"></i>
									</button>
								</p></td>
						</tr>
						<tr>
							<td><input type="checkbox" class="checkthis" /></td>
							<td>mc</td>
							<td>mc</td>
							<td>lyon</td>
							<td>mchou120@gmail.com</td>
							<td>+55512345600</td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Edit">
									<button class="btn btn-primary btn-xs" data-title="Edit"
										data-toggle="modal" data-target="#edit">
										<i class="fa fa-pencil-square-o"></i>
									</button>
								</p></td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Delete">
									<button class="btn btn-danger btn-xs" data-title="Delete"
										data-toggle="modal" data-target="#delete">
										<i class="fa fa-trash"></i>
										
									</button>
								</p></td>
						</tr>	
					</tbody>	
				</table>	
				<div class="clearfix"></div>
				<ul class="pagination pull-right">
	              <li class="disabled"><a href="#">«</a></li>
	              <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
	              <li><a href="#">2</a></li>
	              <li><a href="#">3</a></li>
	              <li><a href="#">4</a></li>
	              <li><a href="#">5</a></li>
	              <li><a href="#">»</a></li>
	            </ul>	
			</div>
		</div>
	</div>
</div>
