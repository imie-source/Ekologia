<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="coop.ekologia.presentation.controller.user.LoginConnectionServlet" %>
<%@ page import="coop.ekologia.presentation.controller.user.LoginDeconnectionServlet" %>
<%@ page import="coop.ekologia.presentation.controller.user.RegistrationServlet" %>
<%@ page import="coop.ekologia.presentation.controller.cms.PageServlet" %>
<%@ page import="coop.ekologia.presentation.controller.user.UserCreateServlet" %>
<fmt:setLocale value="${ currentLanguage }" />
<fmt:setBundle basename="i18n.main" />
<div class="header">
	<div class="header-degrade">
				<!-- .row implique max-width: 62.5rem, soit quelque chose de limité ^^' -->
				<!-- Equivalent à .container .row de Bootstrap -->
				<div class="row">
					<!-- Equivalent à .col-lg-2 de Bootstrap -->
					<div class="logo large-2 columns">
						<!--blablabla-->
						<a href="<%= PageServlet.routingHome(request) %>"></a>
					</div>
					<div class="large-8 columns"> 
										<!-- Ici, .row réinitialise une grille de 12 colonnes, donc la largeur des colonnes sera moins importante que pour le .row parent (cf. ligne 14) -->
										<!-- Les sauts de ligne mettent en évidence les différentes lignes. -->
						<ul class="row no-bullet">
							<li class="large-3 columns"><a class="header-link" href="<%= PageServlet.routing(request,"qui-sommes-nous") %>">Qui sommes nous?</a></li>
							<li class="large-3 columns"><a class="header-link" href="<%= PageServlet.routing(request,"communaute") %>">La communauté</a></li>
							<li class="large-3 columns"><a class="header-link" href="<%= PageServlet.routing(request,"forum-ouvert") %>">Forum ouvert</a></li>
					   </ul>
							
					</div>
					<c:choose>
							<c:when test="${empty connectedUser}">

					<div class="large-2 columns">
							<!-- styles à exporter en css plus tard, jsute des tests rapides ici -->
						<div style="border:1px solid #aaa;border-radius:2px;padding:0">
								<h5 style="text-align:center;padding: 5px; margin: 0;background-color: #eee">Mon compte</h5>
							<hr style="margin: 0; padding: 2px"/>
							<ul class="no-bullet" style="font-size:12px;margin: 5px">
								<li><a href="<%= RegistrationServlet.routing(request) %>">Créer un compte</a></li>
								<li><a href="<%= LoginConnectionServlet.routing(request) %>">Se connecter</a></li>
							</ul>
						</div>
					</div>
							</c:when>
							<c:otherwise>
								<div>
									<div>
										<c:out value="${connectedUser.email}" />
									</div>
								</div>
								<div class="large-2 columns">
										<!-- styles à exporter en css plus tard, jsute des tests rapides ici -->
										<div style="border:1px solid #aaa;border-radius:2px;padding:0">
											<h5 style="text-align:center;padding: 5px; margin: 0;background-color: #eee">Mon compte</h5>
											<hr style="margin: 0; padding: 2px"/>
											<ul class="no-bullet" style="font-size:12px;margin: 5px">
												<li><a class="uk-button uk-width-1-1"
										href="<%= LoginDeconnectionServlet.routing(request) %>">déconnection</a></li>
											
											</ul>
										</div>
								</div>
							</c:otherwise>
						</c:choose>
		</div>
	</div>

	<div class="contain-to-grid sticky">
			<div class="nav-bar-color">
				<nav class="top-bar" data-topbar role="navigation" data-options="sticky_on: large">
					<ul class="title-area">
						<li class="name">
						  <h1><a href="#">Ekologia</a></h1>
						</li>
					</ul>

					<section class="top-bar-section">
						<ul class="right"></ul>
						<ul class="left">
							<li class="active"><a href="<%= PageServlet.routingHome(request) %>">Home</a></li>
							<li><a href="<%= PageServlet.routing(request,"page1") %>">Page 1</a></li>
							<li class="has-dropdown">
								<a href="<%= PageServlet.routing(request,"page2") %>">Page 2</a>
								<ul class="dropdown">
									<li><a href="<%= PageServlet.routing(request,"page2-1") %>">Sous-page 2.1</a></li>
									<li><a href="<%= PageServlet.routing(request,"page2-2") %>">Sous-page 2.2</a></li>
								</ul>
							</li>
						</ul>
					</section>
				</nav>
			</div>
        </div>
</div>