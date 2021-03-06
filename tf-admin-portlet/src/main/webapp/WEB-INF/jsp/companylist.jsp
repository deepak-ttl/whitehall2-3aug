<%@include file="init.jsp"%>
<%@ taglib uri="http://whitehall.com/jsp/tld/p" prefix="p"%>

<portlet:renderURL var="createURL">
	<portlet:param name="render" value="createCompany" />
</portlet:renderURL>

<portlet:renderURL var="defaultRenderURL" />

<portlet:actionURL var="getCompanyReportURL">
	<portlet:param name="company" value="getCompanyReport" />
</portlet:actionURL>

<portlet:resourceURL id="exportCompanies" var="exportCompaniesURL" ></portlet:resourceURL> 


<%-- <%@include file="suppliertabview.jsp"%> --%>

<div class="tab-content">


	<form:form commandName="companyModel" method="post"
		action="${createURL}" id="companyList" autocomplete="off" name="companyList">
		
	<input type="hidden" name="currentPage" 	id="currentPage"    	value="${paginationModel.currentPage}" />
	<input type="hidden" name="currPageSize" 	id="currPageSize"    	value="${paginationModel.pageSize}" /> 
	<input type="hidden" name="noOfRecords" 	id="noOfRecords"    	value="${paginationModel.noOfRecords}" />
	<input type="hidden" name="defaultURL" 		id="defaultURL" 		value="${defaultRenderURL}" />
	<input type="hidden" name="pageSize"        id="pageSize"      		value="${paginationModel.pageSize}" />
	<input type="hidden" name="exportUrl"       id="exportUrl"  		value="${exportCompaniesURL}" />
	     
	     
	    <input type="hidden" id="sortVal_order" name="sortVal_order" value="${sortCompany_order}"/>
		<input type="hidden" id="sort_Column" name="sort_Column" value="${sort_Column}" />
		<input type="hidden" id="sort_order" name="sort_order" value="${sort_order}"/>

		<div id="scf-tab" class="tab-pane">
			<c:choose>
				<c:when test="${permissionChecker.isOmniadmin()}">
					<div class="title-container clearfix">
					 	<div class="main-title">Manage my Company</div>
					 	
					 	<div class="btn-wrapper">
					 		<aui:button cssClass="btnBrGrSm btnIconSm filter-btn active"  icon="icomoon-filter"></aui:button>
			  				<input type="button" class="btnBgGreenSm" value="Export"  id="exportCompanies"/>
			  				<%-- <a href="${exportCompaniesURL}" class="btnBgGreenSm" >Export</a> --%>
			  			</div>
					 </div>
					<div class="customWell filter-container">
						<div class="row-fluid">
							<div class="span3 spanSm6">
								<div class="control-group">
									<div class="input-append">
										<input name="Search" type="text" placeholder="Search"
											id="search" value="${search}" />&nbsp;<span><i
											class="icon-info-sign tooltipPhone" data-toggle="tooltip"
											title="Please search by Name/Registration no"></i></span>
									</div>
									<div>
										&nbsp;&nbsp;
									</div>
									
								</div>

							</div>
							
								
							
							<div class="span3 spanSm6 mtXs10">
								<div class="control-group">

									<div class="input-append">
										<input type="button" value="Search" id="companyReport"
											class="btnBgBuSm" />
									</div>
								</div>
							</div>

						</div>
					</div>
				</c:when>
				<c:otherwise>
					 <div class="title-container clearfix">
					 	<div class="main-title">Manage my Company</div>
					 </div>
				</c:otherwise>			
			</c:choose>	
			
			
		</div>
		<div class="lfr-pagination">			
				<p:paginate  paginationModel="${paginationModel}"/>
				
				<div class="lfr-pagination-controls">
					<div class="btn-group">
					  <a class="btn btn-default dropdown-toggle" role="button" data-toggle="dropdown" href="#">${paginationModel.pageSize} items per page <i class="caret"></i></a>
					  <ul id="menu1" class="dropdown-menu" role="menu" aria-labelledby="drop4">
					  	  <li role="presentation" pageSize="2"><a role="menuitem" href="#">2 items per page</a></li>
		                  <li role="presentation" pageSize="5"><a role="menuitem" href="#">5 items per page</a></li>
		                  <li role="presentation" pageSize="10"><a role="menuitem" href="#">10 items per page</a></li>
		                  <li role="presentation" pageSize="20"><a role="menuitem" href="#">20 items per page</a></li>
		                  <li role="presentation" pageSize="30"><a role="menuitem" href="#">30 items per page</a></li>
		                  <li role="presentation" pageSize="45"><a role="menuitem" href="#">45 items per page</a></li>
		                  <li role="presentation" pageSize="60"><a role="menuitem" href="#">60 items per page</a></li>
		                  <li role="presentation" pageSize="75"><a role="menuitem" href="#">75 items per page</a></li>
		                </ul> 		              
					</div>
					
					<small class="search-results">Showing ${(paginationModel.currentPage-1)*paginationModel.pageSize+1} - 
					<c:choose>
							<c:when test="${paginationModel.currentPage*paginationModel.pageSize >= paginationModel.noOfRecords}">${paginationModel.noOfRecords}</c:when>
							<c:otherwise>${paginationModel.currentPage*paginationModel.pageSize}</c:otherwise>
					</c:choose>
					 of ${paginationModel.noOfRecords} Results.</small>				
					
				</div>
		  </div>
		<div class="customTableContainer">
			<table class="table table-hover tablesorter table-bordered"  id="companyListTable">
				<thead>
					<tr>
						<th>Name <br><img id="cnameAsc" column-name="name" class="sortColumn" src="<%=themeDisplay.getPathThemeImages()%>/up.png" alt="asc" order="asc"/><img id="cnameDesc" column-name="name" class="sortColumn" src="<%=themeDisplay.getPathThemeImages()%>/down.png" alt="desc" order="desc"/>
						</th>
						<th>Registration No.<br><img id="cregnumberAsc" column-name="regNumber" class="sortColumn" src="<%=themeDisplay.getPathThemeImages()%>/up.png" alt="asc" order="asc"/><img id="regNumber" column-name="regNumber" class="sortColumn" src="<%=themeDisplay.getPathThemeImages()%>/down.png" alt="desc" order="desc"/>
						</th>
						<th>Address Registered<br><img id="caddregisteredAsc" column-name="add.region" class="sortColumn" src="<%=themeDisplay.getPathThemeImages()%>/up.png" alt="asc" order="asc"/><img id="caddregisteredDesc" column-name="add.region" class="sortColumn" src="<%=themeDisplay.getPathThemeImages()%>/down.png" alt="desc" order="desc"/>
						</th>
						<th>Established date<br><img id="dateestablishedAsc" column-name="dateestablished" class="sortColumn" src="<%=themeDisplay.getPathThemeImages()%>/up.png" alt="asc" order="asc"/><img id="dateestablishedDesc" column-name="dateestablished" class="sortColumn" src="<%=themeDisplay.getPathThemeImages()%>/down.png" alt="desc" order="desc"/>						  
						</th>
						<!-- <th>URL</th> -->
						<th>Tel Number<br><img id="telnumberAsc" column-name="telnumber" class="sortColumn" src="<%=themeDisplay.getPathThemeImages()%>/up.png" alt="asc" order="asc"/><img id="telnumberDesc" column-name="telnumber" class="sortColumn" src="<%=themeDisplay.getPathThemeImages()%>/down.png" alt="desc" order="desc"/>
						</th>
						<th>Type of Company<br><img id="companytypeAsc" column-name="companyType" class="sortColumn" src="<%=themeDisplay.getPathThemeImages()%>/up.png" alt="asc" order="asc"/><img id="companytypeDesc" column-name="companyType" class="sortColumn" src="<%=themeDisplay.getPathThemeImages()%>/down.png" alt="desc" order="desc"/>
						</th>
						<th>Status<br><img id="activestatusAsc" column-name="activestatus" class="sortColumn" src="<%=themeDisplay.getPathThemeImages()%>/up.png" alt="asc" order="asc"/><img id="activeStatusDesc" column-name="activestatus" class="sortColumn" src="<%=themeDisplay.getPathThemeImages()%>/down.png" alt="desc" order="desc"/>
						</th>						
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(allCompanies) gt 0}">
							<c:forEach items="${allCompanies}" var="company">
								<tr onclick="window.location.href='${createURL}&companyID=${company.id}'">
									<td>${company.name} </td>
									<td>${company.regNumber}</td>
									<c:if test="${empty company.address.region}">
									<td>${company.address.country}</td>
									</c:if>
									<c:if test="${ not empty company.address.region}">
									<td>${company.address.region}, ${company.address.country}</td>
									</c:if>
									
									<td class="text-center"><fmt:formatDate pattern="dd-MM-yyyy" value="${company.dateestablished}" /></td>
									<%-- <td>${company.website}</td> --%>
									<td>${company.telnumber}</td>
								<c:if test="${company.companyType == '1'}">
							         <td>Primary Investor</td>
							    </c:if>
							         <c:if test="${company.companyType == '2'}">
							         <td>Secondary Investor</td>
							         </c:if>
							         <c:if test="${company.companyType == '3'}">
							         <td>Admin</td>
							         </c:if>
							         <c:if test="${company.companyType == '4'}">
							         <td>Seller</td>
							         </c:if>
							         <c:if test="${company.companyType == '5'}">
							         <td>SCF Company</td>
							         </c:if>
									<%-- <td>${company.companyType}</td> --%>
									<td>${company.activestatus}</td>							
									
								</tr>
							</c:forEach>
						 </c:when>
						 <c:otherwise>
							<tr>
								<td colspan="7" align="center">No Record Found!</td>
							</tr>
						</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
		
			<div class="lfr-pagination">			
				<p:paginate  paginationModel="${paginationModel}"/>
				
				<div class="lfr-pagination-controls">
					<div class="btn-group">
					  <a class="btn btn-default dropdown-toggle" role="button" data-toggle="dropdown" href="#">${paginationModel.pageSize} items per page <i class="caret"></i></a>
					  <ul id="menu1" class="dropdown-menu" role="menu" aria-labelledby="drop4">
					  	  <li role="presentation" pageSize="2"><a role="menuitem" href="#">2 items per page</a></li>
		                  <li role="presentation" pageSize="5"><a role="menuitem" href="#">5 items per page</a></li>
		                  <li role="presentation" pageSize="10"><a role="menuitem" href="#">10 items per page</a></li>
		                  <li role="presentation" pageSize="20"><a role="menuitem" href="#">20 items per page</a></li>
		                  <li role="presentation" pageSize="30"><a role="menuitem" href="#">30 items per page</a></li>
		                  <li role="presentation" pageSize="45"><a role="menuitem" href="#">45 items per page</a></li>
		                  <li role="presentation" pageSize="60"><a role="menuitem" href="#">60 items per page</a></li>
		                  <li role="presentation" pageSize="75"><a role="menuitem" href="#">75 items per page</a></li>
		                </ul> 		              
					</div>
					
					<small class="search-results">Showing ${(paginationModel.currentPage-1)*paginationModel.pageSize+1} - 
					<c:choose>
							<c:when test="${paginationModel.currentPage*paginationModel.pageSize >= paginationModel.noOfRecords}">${paginationModel.noOfRecords}</c:when>
							<c:otherwise>${paginationModel.currentPage*paginationModel.pageSize}</c:otherwise>
					</c:choose>
					 of ${paginationModel.noOfRecords} Results.</small>				
					
				</div>
		  </div>
		<c:if test="${permissionChecker.isOmniadmin()}">
			
			<div class="actionContainer text-left">
				<a href="${createURL}"	class="btn btnBgBuSm" >Add Company</a>			
			</div>
		</c:if>
	</form:form>



</div>
