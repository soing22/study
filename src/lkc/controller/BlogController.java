package lkc.controller;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;




















import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;





















import org.apache.catalina.connector.Request;
import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
 


















import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import lkc.context.*;
import lkc.java.pagingAction;
@Controller
public class BlogController {
	private Reader reader;
	private SqlMapClient sqlMapper;
	private int currentPage = 1;	//현재 페이지
	private int totalCount; 		// 총 게시물의 수
	private int blockCount = 10;	// 한 페이지의  게시물의 수
	private int blockPage = 5; 	// 한 화면에 보여줄 페이지 수
	private String pagingHtml; 	//페이징을 구현한 HTML
	private StringBuffer pagingHtml1;
	private pagingAction page; 	// 페이징 클래스
	 List<dbDTO> list=new ArrayList<dbDTO>();
	 List<dbDTO> list2=new ArrayList<dbDTO>();
	List <blogDTO> blogList=new ArrayList<blogDTO>();
	public BlogController() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	     
	} 
	@SuppressWarnings("unchecked")
	@RequestMapping("/createblog.do")
	public ModelAndView form11(@ModelAttribute String dto,HttpSession session) throws SQLException{
		ModelAndView m=new ModelAndView();
		//String id=(String)session.getAttribute("id");
	
		System.out.println("f");
	blogList=sqlMapper.queryForList("lkc.blogcreateselect");
	System.out.println("size="+blogList.size());	
	
	m.addObject("blogList",blogList);
	//.addObject("id",id);
	m.setViewName("/lkc/CreateBlog.jsp");	
		return m;
		
	}
	@RequestMapping("/createdb.do")
	public ModelAndView form15(@ModelAttribute String dto,HttpSession session) throws SQLException{
		ModelAndView m=new ModelAndView();
		//String id=(String)session.getAttribute("id");
		List<dbDTO> result=new ArrayList<dbDTO>();
		String [] a1={"한국","미국","독일","중국","일본","홍콩"};
		String [] a2={"서울","워싱턴","베이징","도쿄","일본","뉴욕"};
		String [] a3={"남산","지리산","한라산","후지산","백두산","맛동산"};
		String [] a4={"신화","빅뱅","지오디","엑소","젝스키스","아이콘"};
		String [] a5={"카라","포미닛","EXID","소녀시대","걸스데이","원더걸스"};
		String [] a6={"사원","대리","과장","차장","부장","이사"};
		String [] a7={"1","2","3","4","5","6"};
		String [] a8={"1","2","3","4","5","6"};
		String [] a9={"1","2","3","4","5","6"};
		dbDTO aa=new dbDTO();
		
		int b1=(int) (Math.random()*6);
		int b2=(int) (Math.random()*6);
		int b3=(int) (Math.random()*6);
		int b4=(int) (Math.random()*6);
		int b5=(int) (Math.random()*6);
		int b6=(int) (Math.random()*6);
		int b7=(int) (Math.random()*999999);
		int b8=(int) (Math.random()*999999);
		int b9=(int) (Math.random()*999999);
		aa.setGroup1(a1[b1]);
		aa.setGroup2(a2[b2]);
		aa.setGroup3(a3[b3]);
		aa.setMoney1(a4[b4]);
		aa.setMoney2(a5[b5]);
		aa.setMoney3(a6[b6]);
		aa.setNum1(b7+"");
		aa.setNum2(b8+"");
		aa.setNum3(b9+"");
		
		
		
		
		
	sqlMapper.insert("lkc.createdb",aa);
		
	
	//.addObject("id",id);
	m.setViewName("/lkc/createdb.jsp");	
		return m;
		
	}
 
	@RequestMapping("/javalist.do")
	public ModelAndView form2(@ModelAttribute String dto,HttpSession session,HttpServletRequest rq) throws SQLException{
		ModelAndView m=new ModelAndView();
		//String id=(String)session.getAttribute("id");
		currentPage=Integer.parseInt(rq.getParameter("currentPage"));
	
	list=sqlMapper.queryForList("lkc.javalist");
	totalCount = list.size(); // 전체 글 갯수를 구한다.
	page = new pagingAction(currentPage, totalCount, blockCount, blockPage); // pagingAction 객체 생성.
	pagingHtml = page.getPagingHtml().toString(); // 페이지 HTML 생성.

	// 현재 페이지에서 보여줄 마지막 글의 번호 설정.
	int lastCount = totalCount;

	// 현재 페이지의 마지막 글의 번호가 전체의 마지막 글 번호보다 작으면 lastCount를 +1 번호로 설정.
	if (page.getEndCount() < totalCount)
		lastCount = page.getEndCount() + 1;

	// 전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
	list = list.subList(page.getStartCount(), lastCount);
	System.out.println("aa"+list.size());
	m.addObject("pagingHtml",pagingHtml);
	m.addObject("list",list);
	//.addObject("id",id);
	m.setViewName("/lkc/list.jsp");	
		return m;
		
	}
     
	@RequestMapping("/dblist1.do")
	public ModelAndView form21(@ModelAttribute String dto,HttpSession session,HttpServletRequest rq) throws SQLException{
		ModelAndView m=new ModelAndView();
		//String id=(String)session.getAttribute("id");
		String cnt=rq.getParameter("cnt");
		String num1=rq.getParameter("num1");
		String num2=rq.getParameter("num2");
		String num3=rq.getParameter("num3");
		if(cnt==null){
			cnt="15";
		}
		pageDTO aaa= new pageDTO();

		if(cnt==null){
			aaa.setCnt("15");	
		}else{
			aaa.setCnt(cnt);
		}		
		if(num1==null){
			aaa.setNum1("0");	
		}else{
			aaa.setNum1(num1);	
		}
		if(num2==null){
			aaa.setNum2("0");	
		}else{
			aaa.setNum2(num2);
		}
		if(num3==null){
			aaa.setNum3("0");	
		}else{
			aaa.setNum3(num3);
		}
		int cnt1=Integer.parseInt(cnt);
		list=sqlMapper.queryForList("lkc.dblist1",aaa);
		System.out.println("aa"+list.size());
	
		if(list.size()>0){
			if(cnt1<list.size()){
			
				m.addObject("num1",list.get(cnt1-1).getNum1());
				m.addObject("num2",list.get(cnt1-1).getNum2());
				m.addObject("num3",list.get(cnt1-1).getNum3());
			
				pagingHtml="조회가 계속됩니다";
			}else{
				
				pagingHtml="조회가 완료되었습니다";
				
			}
			m.addObject("dblist1",list);
			m.addObject("cnt",list.size()-1);
		}else{
			m.addObject("cnt",0);
			pagingHtml="조회된 내용이 없습니다";
		}

	
	//.addObject("id",id);
	m.addObject("pagingHtml",pagingHtml);
	m.setViewName("/lkc/list2.jsp");	
		return m;
		
	}
	@RequestMapping("/dblist2.do")
	public ModelAndView form22(@ModelAttribute String dto,HttpSession session,HttpServletRequest rq) throws SQLException{
		ModelAndView m=new ModelAndView();
		//String id=(String)session.getAttribute("id");
		list2=sqlMapper.queryForList("lkc.javalist");
		
		String cnt=rq.getParameter("cnt");		
		String	num1=rq.getParameter("num1");
		if(cnt==null){
			cnt="15";
		}
		if(num1==null){
			num1="1";
		}
		pageDTO aaa= new pageDTO();
		aaa.setCnt(cnt);
		aaa.setNum1(num1);
	
		list=sqlMapper.queryForList("lkc.dblist2",aaa);
		System.out.println("aa"+list.size());
	
	
		
		
	m.addObject("dblist2",list);	
	m.addObject("cnt",cnt);
	m.addObject("num1",Integer.parseInt(num1)+1);
	m.setViewName("/lkc/list3.jsp");	
		return m;
		
	}
	@RequestMapping("/main.do")
	public ModelAndView form32(@ModelAttribute String dto,HttpSession session,HttpServletRequest rq) throws SQLException{
		ModelAndView m=new ModelAndView();
		
	m.setViewName("/project/menu/main2.jsp");	
		return m;
		
	}	

	
}
