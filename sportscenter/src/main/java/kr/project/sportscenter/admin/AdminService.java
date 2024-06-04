package kr.project.sportscenter.admin;


public interface AdminService {
	
	boolean regist(AdminVO vo);

	AdminVO adminlogin(AdminVO vo); 

}