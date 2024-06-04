package kr.project.sportscenter.admin;


public interface AdminService {
	
	boolean regist(AdminVO vo);

	AdminVO adminLogin(AdminVO vo); 

}