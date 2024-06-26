package config;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.zaxxer.hikari.HikariDataSource;

import kr.project.sportscenter.util.AdminLoginInterceptor;
import kr.project.sportscenter.util.LoginInterceptor;

@Configuration
@ComponentScan(basePackages = { "kr.project.sportscenter" })
@EnableWebMvc
@MapperScan(basePackages = { "kr.project.sportscenter" }, annotationClass = Mapper.class) // 인터페이스 스캔
@EnableTransactionManagement
@EnableScheduling
public class MvcConfig implements WebMvcConfigurer {
	// 파일업로드
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipart = new CommonsMultipartResolver();
		// 파일사이즈
		multipart.setMaxUploadSize(1024 * 1024 * 5);
		multipart.setDefaultEncoding("utf-8");
		return multipart;
	}

	// db.properties에 있는 속성
	@Value("${db.driver}")
	private String driver;
	@Value("${db.url}")
	private String url;
	@Value("${db.username}")
	private String username;
	@Value("${db.password}")
	private String password;

	// ViewResolver 설정(JSP 경로)
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/views/", ".jsp");
	}

	// 정적페이지 처리(컨트롤러가 아니라 톰캣에서 처리하기 위해)
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	// 비즈니스 로직이 필요없는 URL 매핑
	@Override
	public void addViewControllers(ViewControllerRegistry reg) {
		reg.addViewController("/login.do");
		reg.addViewController("/user/join.do");
		reg.addViewController("/home.do");
		// db 연동 상관 없는 애들은 controller를 만들어주지 않고,MvcConfig에 작성하면 됨
		reg.addViewController("/subject/usageInfo.do");
		reg.addViewController("/subject/registInfo.do");
		reg.addViewController("/subject/swimDetail.do");
		reg.addViewController("/subject/healthDetail.do");
		reg.addViewController("/subject/squashDetail.do");
		reg.addViewController("/subject/zumbaDetail.do");
		reg.addViewController("/subject/aquacizeDetail.do");
		reg.addViewController("/subject/spinningDetail.do");
		reg.addViewController("/subject/pilatesDetail.do");
		reg.addViewController("/subject/jumpingDetail.do");
		reg.addViewController("/subject/flyingDetail.do");
		reg.addViewController("/center/centerHp.do");
		reg.addViewController("/center/facility.do");
		
	}

	// HikariCP
	@Bean
	public HikariDataSource dataSource() {
		HikariDataSource dataSource = new HikariDataSource();
//			dataSource.setDriverClassName("oracle.jdbc.OracleDriver");
//			dataSource.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:XE");
		dataSource.setDriverClassName(driver);
		dataSource.setJdbcUrl(url);
		dataSource.setUsername(username);
		dataSource.setPassword(password);
		return dataSource;
	}

	// MyBatis
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean ssf = new SqlSessionFactoryBean();
		ssf.setDataSource(dataSource()); // CP 객체 주입
		return ssf.getObject();
	}

	// 트랜잭션 설정
	@Bean
	public PlatformTransactionManager transactionManager() {
		DataSourceTransactionManager dtm = new DataSourceTransactionManager(dataSource());
//			dtm.setDataSource(dataSource());
		return dtm;
	}

	// 로그인인터셉터 빈등록
	@Bean
	public LoginInterceptor loginInterception() {
		return new LoginInterceptor();
	}

	// 로그인인터셉터 admin 빈등록
	@Bean
	public AdminLoginInterceptor AdminloginInterception() {
		return new AdminLoginInterceptor();
	}

	// 인터셉터 설정
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// url 설정
		registry.addInterceptor(loginInterception()).excludePathPatterns("/user/login.do")
				.excludePathPatterns("/reply/index.do").excludePathPatterns("/reply/view.do")
				.addPathPatterns("/member/edit.do")
				.addPathPatterns("/mypage/**").addPathPatterns("/mypage/verifyPassword.do").addPathPatterns("/mypage/classHistory.do")
				.addPathPatterns("/class/payCheck.do");

		registry.addInterceptor(AdminloginInterception()).addPathPatterns("/notice/edit.do")
				.addPathPatterns("/admin/**").excludePathPatterns("/admin/adminLogin.do");
	}

	// properties 설정
	@Bean
	public static PropertyPlaceholderConfigurer propreties() {
		PropertyPlaceholderConfigurer config = new PropertyPlaceholderConfigurer();
		config.setLocations(new ClassPathResource("db.properties"));
		return config;
	}
	
	
	@Configuration
	public class JdbcTemplateConfig {

	    @Bean
	    public JdbcTemplate jdbcTemplate(HikariDataSource dataSource) {
	        return new JdbcTemplate(dataSource);
	    }
	}
	
	
}