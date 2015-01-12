package coop.ekologia.service.cms;

import java.util.List;

import javax.ejb.Local;

import coop.ekologia.DTO.cms.PageDTO;
import coop.ekologia.DTO.group.GroupDTO;
import coop.ekologia.DTO.user.UserDTO;

@Local
public interface PageServiceInterface {

	PageDTO getPageFromUrl(String url);

	public List<PageDTO> getAllPage();
	
	public PageDTO getPageById(PageDTO dto);

	public PageDTO updatePage(PageDTO dto);

	public PageDTO insertPage(PageDTO dto);

	public void deletePage(PageDTO dto);

}
