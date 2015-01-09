/**
 * 
 */
package coop.ekologia.service;

import coop.ekologia.DTO.user.UserDTO;
import coop.ekologia.entity.user.User;

/**
 * @author imie
 *
 */
public class UserMapper {

	/**
	 * 
	 */
	public UserMapper() {
		// TODO Auto-generated constructor stub
	}

	public UserDTO mapFromEntity(User user) {
		UserDTO retour = new UserDTO();
		retour.setEmail(user.getEmail());
		retour.setPassword(user.getPassword());
		retour.setId(user.getId());
		return retour;
	}

	public User mapToEntity(UserDTO userDTO) {
		User retour = new User();
		retour.setEmail(userDTO.getEmail());
		retour.setPassword(userDTO.getPassword());
		if (userDTO.getId() != null) {
			retour.setId(userDTO.getId());
		}
		return retour;
	}

}
