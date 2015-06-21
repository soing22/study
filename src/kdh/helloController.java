package kdh;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.ibatis.sqlmap.client.SqlMapClient;

import kdh.dao.*;
	@Controller
	public class helloController {
		private Reader reader;
		private SqlMapClient sqlMapper;
		
		public helloController() throws IOException {
			reader = Resources.getResourceAsReader("sqlMapConfig.xml");
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
			reader.close();
		 
		}

		 
	     
		  
				
				@RequestMapping("/kdh.do")
				public ModelAndView form9(@ModelAttribute String dto,HttpSession session) throws SQLException{
					ModelAndView m=new ModelAndView();
					//String id=(String)session.getAttribute("id");
				
					System.out.println("김동희");
					
					m.setViewName("/kdh/NewFile.jsp");
				//.addObject("id",id);
					
					return m;
					
				}

	     
		  
				
				@RequestMapping("/Newid.do")
				public ModelAndView form5(@ModelAttribute NewidDTO dto,HttpSession session,HttpServletRequest rq) throws SQLException{
					ModelAndView m=new ModelAndView();
					//String id=(String)session.getAttribute("id");
					
					List<NewidDTO> dbnewid2=new ArrayList<NewidDTO>();
					NewidDTO dbnewid=new NewidDTO();
					dbnewid2=sqlMapper.queryForList("kdh.idlist");
					System.out.println("사이즈"+dbnewid2.size());
					dbnewid.setId(dto.getId());
					dbnewid.setPasswd(dto.getPasswd());
					dbnewid.setName(dto.getName());
					dbnewid.setJumin1(dto.getJumin1());
					dbnewid.setJumin2(dto.getJumin2());
					dbnewid.setEmail(dto.getEmail());
					dbnewid.setBlog(dto.getBlog());
					dbnewid.setReg_date("dqw");
					
					sqlMapper.insert("kdh.newtable",dbnewid);
				
					System.out.println("dsgsdF");
					String id=	dto.getId();
					System.out.println("아이디는"+id);
					String pw=	dto.getPasswd();
					System.out.println("비번은"+pw);
					m.setViewName("/kdh/NewFile.jsp");
				//.addObject("id",id);
					
					return m;
					
				}



		
	}


