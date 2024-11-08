package model2.mvcboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.Boardpage;

public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	MVCBoardDAO dao = new MVCBoardDAO();
	
	Map<String, Object> map = new HashMap<String, Object>();
	String searchField = req.getParameter("searchField");
	String searchWord = req.getParameter("searchWord");
	if(searchWord != null) {
		map.put("searchField", searchField);
		map.put("searchWord", searchWord);
	}
	int totalCount = dao.selectCount(map);
	
	ServletContext application = getServletContext();
	int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
	int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
	
	int pageNum = 1;
	String pageTemp = req.getParameter("pageNum");
	if(pageTemp != null && !pageTemp.equals(""))
		pageNum = Integer.parseInt(pageTemp);
	
	int start = (pageNum-1) * pageSize; // 첫게시물번호(MySQL은0부터시작)
	 map.put("start", start);
	 map.put("pageSize", pageSize);
	 
	 List<MVCBoardDTO> boardLists = dao.selectListPage(map);
	 dao.close();
	 
	 String pagingImg = Boardpage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../mvcboard/list.do");
	 map.put(pagingImg, pagingImg);
	 map.put("totalCount", totalCount);
	 map.put("pageSize", pageSize);
	 map.put("pageNum", pageNum);
	 
	 req.setAttribute("boardLists", boardLists);
	 req.setAttribute("map", map);
	 req.getRequestDispatcher("/14MVCBoard/List.jsp").forward(req, resp);
	} // doGet 끝
} // ListController 클래스 끝
