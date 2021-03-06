<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<fmt:setLocale value="${ currentLanguage }"/>
<fmt:setBundle basename="i18n.main"/>

<div class="header">
    <div class="header-degrade">
        <!-- .row implique max-width: 62.5rem, soit quelque chose de limité ^^' -->
        <!-- Equivalent à .container .row de Bootstrap -->
        <div class="row">
            <!-- Equivalent à .col-lg-2 de Bootstrap -->
            <div class="logo large-2 columns">
                <a href="${routing.homepage}"></a>
            </div>
            <div class="large-8 columns">
                <!-- Ici, .row réinitialise une grille de 12 colonnes, donc la largeur des colonnes sera moins importante que pour le .row parent (cf. ligne 14) -->
                <!-- Les sauts de ligne mettent en évidence les différentes lignes. -->
                <ul class="row no-bullet">
                    <li class="large-6 columns"><a class="header-link"
                                                   href="${routing.getPage("qui-sommes-nous")}"><h2>
                        Qui sommes-nous? </h2></a></li>
                    <li class="large-6 columns"><a class="header-link"
                                                   href="${routing.getPage("communaute")}"><h2> La
                        communauté </h2></a></li>
                    <li class="large-6 columns"><a class="header-link"
                                                   href="${routing.getPage("forum-ouvert")}">
                        <h2>Forum ouvert </h2></a></li>
                </ul>
            </div>

            <div class="large-2 columns">
                <!-- styles à exporter en css plus tard, juste des tests rapides ici -->
                <div style="border: 1px solid #aaa; border-radius: 2px; padding: 0">
                    <%-- <h5
                        style="text-align: center; padding: 5px; margin: 0; background-color: #eee">Mon
                        compte</h5>
                    <hr style="margin: 0; padding: 2px" />
                    --%>
                    <c:choose>
                        <c:when test="${empty connectedUser}">
                            <ul class="no-bullet" style="font-size: 12px; margin: 5px">
                                <li><a href="${routing.registration}">
                                    Créer un compte </a></li>
                                <li><a href="${routing.connection}"> Se connecter </a></li>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <c:choose>
                                <c:when test="${empty connectedUser.avatar}">
                                    <div style="padding: 0 5px">
                                        <c:out value="${connectedUser.email}"/>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <img alt="" src="${connectedUser.avatar}">
                                </c:otherwise>

                            </c:choose>
                            <a class="uk-button uk-width-1-1"
                               href="${routing.deconnection}">déconnexion</a><%--
							<ul class="no-bullet" style="font-size: 12px; margin: 5px">
								<li><a class="uk-button uk-width-1-1"
									href="${routing.deconnection}">déconnexion</a></li>
							</ul>--%>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

    <div class="contain-to-grid sticky">
        <div class="nav-bar-color">
            <nav class="top-bar" data-topbar role="navigation">
                <ul class="title-area">
                    <li class="name">
                        <h1>
                            <a href="${routing.homepage}">Ekologia</a>
                        </h1>
                    </li>
                </ul>

                <section class="top-bar-section">
                    <!-- TODO: Active page management -->
                    <ul class="right">
                        <c:forEach var="menu" items="${ globalMenus }">
                            <c:if test="${menu.key != 'all'}">
                                <li class="has-dropdown not-click">
                                    <a href="#">${ applicationRoles.get(menu.key) }</a>
                                    <ul class="dropdown">
                                        <c:forEach var="menuItem" items="${ menu.value }">
                                            <c:choose>
                                                <c:when test="${menuItem.children.isEmpty()}">
                                                    <li><a href="${menuItem.route}">${menuItem.name}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="has-dropdown">
                                                        <a href="#">${menuItem.name}</a>
                                                        <ul class="dropdown">
                                                            <c:forEach var="menuItemChild"
                                                                       items="${ menuItem.children }">
                                                                <li>
                                                                    <a href="${ menuItemChild.route }">${ menuItemChild.name }</a>
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </ul>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                    <ul class="left">
                        <c:forEach var="menuItem" items="${ globalMenus.get('all') }">
                            <c:choose>
                                <c:when test="${menuItem.children.isEmpty()}">
                                    <li><a href="${menuItem.route}">${menuItem.name}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="has-dropdown">
                                        <a href="#">${menuItem.name}</a>
                                        <ul class="dropdown">
                                            <c:forEach var="menuItemChild" items="${ menuItem.children }">
                                                <li><a href="${ menuItemChild.route }">${ menuItemChild.name }</a></li>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </ul>
                </section>
            </nav>
        </div>
    </div>
</div>