package syj.blog.model;


import java.io.*;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.*;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView {
 
	public DownloadView() {
		setContentType("application/download; charset=utf-8");
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		File file = (File) model.get("downloadFile");
		String orgName = (String)model.get("orgName");
		
		response.setContentType(getContentType());
		response.setContentLength((int) file.length());

		String userAgent = request.getHeader("User-Agent");
		String fileName = null;
		
		if ( userAgent.indexOf("MSIE") > -1) {
			fileName = URLEncoder.encode(orgName, "utf-8");
		}else if (userAgent.indexOf("Trident") > - 1){
			fileName = URLEncoder.encode(orgName, "UTF-8").replaceAll("\\+", "%20");
		}else {
			fileName = new String(orgName.getBytes("utf-8"),"iso-8859-1");
		}

		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");

		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;

		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException ioe) {
				}
			}
		}
		out.flush();
	}
}
