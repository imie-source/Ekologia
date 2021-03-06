package coop.ekologia.presentation.controller.user;

import java.io.IOException;

import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coop.ekologia.DTO.user.UserDTO;
import coop.ekologia.presentation.EkologiaServlet;
import coop.ekologia.presentation.controller.FormErrors;
import coop.ekologia.presentation.controller.cms.HomeServlet;
import coop.ekologia.presentation.controller.cms.PageServlet;
import coop.ekologia.presentation.request.RoutingCentral;
import coop.ekologia.presentation.session.LoginSession;
import coop.ekologia.service.user.UserService.BadPasswordException;
import coop.ekologia.service.user.UserService.UnknownUserException;
import coop.ekologia.service.user.UserServiceInterface;

/**
 * Login page used to log in the user.
 */
@WebServlet("/login")
public class LoginServlet extends EkologiaServlet {
	public static final String WEB_INF_LOGIN_JSP = "/user/login.jsp";

	private static final long serialVersionUID = 1L;
	
    @Inject
    RoutingCentral routingCentral;

	public static final String routing(HttpServletRequest request) {
		return getUrl(request, "/login");
	}

	@EJB
	private UserServiceInterface userService;

	@Inject
	private LoginSession loginSession;
	
	@Inject
	private FormErrors formErrors;

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		forwardToJsp(WEB_INF_LOGIN_JSP, request, response);
	}

	/**
	 * Ce post traite le formulaire de login, vérifie le passw par rapport aux
	 * users en session et stocke ce user en session si passw ok
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String loginParameter = request.getParameter("login");
		String passwParameter = request.getParameter("passw");
		UserDTO loginUser = new UserDTO();
		loginUser.setEmail(loginParameter);
		loginUser.setPassword(passwParameter);
		boolean error=false;
		try {
			loginUser = userService.getSecuredUser(loginUser);
			loginSession.setUser(loginUser);
			if (loginSession.getPreviousUrl() != null) {
                response.sendRedirect(loginSession.getPreviousUrl());
                loginSession.setPreviousUrl(null);
            } else {
                response.sendRedirect(routingCentral.getHomepage());
            }
		} catch (BadPasswordException e) {
			formErrors.addError("badPassword", null);
			error=true;
		} catch (UnknownUserException e) {
			formErrors.addError("unknownUser", null);
			error=true;
		}
		if (error) {
			forwardToJsp(WEB_INF_LOGIN_JSP, request, response);
		}

	}

}
