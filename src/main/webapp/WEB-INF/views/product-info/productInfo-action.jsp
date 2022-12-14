<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h2>${titlePage}</h2>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_content">
						<c:if test="${modelForm.imgUrl != null}">
							<c:url value="${modelForm.imgUrl }" var="imgUrl" />
							<img alt="Error Image" src="${imgUrl }"
								style="max-width: 20%; height: auto;" />
						</c:if>
						<br /> <br />
						<form:form modelAttribute="modelForm"
							cssClass="form-horizontal form-label-left"
							servletRelativeAction="/product-info/save" method="POST"
							enctype="multipart/form-data">
							<form:hidden path="id" />
							<form:hidden path="createDate" />
							<form:hidden path="imgUrl" />
							<form:hidden path="activeFlag" />
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="cateId">Category <span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<c:choose>
										<c:when test="${!viewOnly }">
											<form:select path="cateId"
												cssClass="form-control col-md-7 col-xs-12">
												<form:options items="${mapCategory }" />
											</form:select>
											<div class="has-error">
												<form:errors path="cateId" cssClass="help-block"></form:errors>
											</div>
										</c:when>

										<c:otherwise>
											<form:input path="category.name"
												cssClass="form-control col-md-7 col-xs-12" disabled="true" />
										</c:otherwise>
									</c:choose>
								</div>
								<div class="clearfix"></div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="code">Code <span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<form:input path="code"
										cssClass="form-control col-md-7 col-xs-12"
										disabled="${viewOnly}" />
									<div class="has-error">
										<form:errors path="code" cssClass="help-block"></form:errors>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="name">Name <span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<form:input path="name"
										cssClass="form-control col-md-7 col-xs-12"
										disabled="${viewOnly}" />
									<div class="has-error">
										<form:errors path="name" cssClass="help-block"></form:errors>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="form-group">
								<label for="description"
									class="control-label col-md-3 col-sm-3 col-xs-12">Description
									<span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<form:textarea path="description"
										cssClass="form-control col-md-7 col-xs-12"
										disabled="${viewOnly}" />
									<div class="has-error">
										<form:errors path="description" cssClass="help-block"></form:errors>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<c:if test="${!viewOnly }">
								<div class="form-group">
									<label for="multipartFile" class="control-label col-md-3">Image
										Upload <span class="required">*</span>
									</label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<form:input path="multipartFile"
											cssClass="form-control col-md-7 col-xs-12" type="file"
											style="" />
										<div class="has-error">
											<form:errors path="multipartFile" cssClass="help-block"></form:errors>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
							</c:if>
							<div class="ln_solid"></div>
							<div class="form-group">
								<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3 ">
									<button class="btn btn-primary" type="button"
										onclick="cancel();">Cancel</button>
									<c:if test="${!viewOnly }">
										<button class="btn btn-primary" type="reset">Reset</button>
										<button type="submit" class="btn btn-success">Submit</button>
									</c:if>
								</div>
								<div class="clearfix"></div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('#product-infolistId').addClass('current-page').siblings()
						.removeClass('current-page');
				var parent = $('#product-infolistId').parents('li');
				parent.addClass('active').siblings().removeClass('active');
				$('#product-infolistId').parents().show();
			});
	function cancel() {
		window.location.href = '<c:url value="/product-info/list"/>'
	}
</script>