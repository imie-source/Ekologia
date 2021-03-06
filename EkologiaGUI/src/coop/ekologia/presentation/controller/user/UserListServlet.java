package coop.ekologia.presentation.controller.user;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coop.ekologia.DTO.user.UserDTO;
import coop.ekologia.presentation.EkologiaServlet;
import coop.ekologia.service.user.UserServiceInterface;

/**
 * Servlet implementation class User
 */
@WebServlet(UserListServlet.routing)
public class UserListServlet extends EkologiaServlet {
	private static final long serialVersionUID = 1L;
	public static final  String routing = "/admin/userList";
	
	public static final String routing(HttpServletRequest request) {
		return getUrl(request, routing);
	}

	@EJB
	UserServiceInterface userService;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		List<UserDTO> users = userService.getAllUser();

		request.setAttribute("filteredUsers", users);
		
		forwardToJsp("user/userList.jsp", request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

}
