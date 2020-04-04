package helpjar;

import java.awt.image.BufferedImage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class VerifyCodeAction extends ActionSupport {
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();

	private VerifyCode verifyCode;

	public void setVerifyCode(VerifyCode verifyCode) {
		this.verifyCode = verifyCode;
	}

	public VerifyCode getVerifyCode() {
		return verifyCode;
	}

	@Override
	public String execute() throws Exception {
		/*
		 * 1.生成图片 2.保存图片上的文本到session域中 3.把图片响应给客户端
		 */
		BufferedImage image = verifyCode.getImage();
		request.getSession().setAttribute("session_vcode", verifyCode.getText());// 把图片上的文本保存到session域中
		VerifyCode.output(image, response.getOutputStream());
		return NONE;
	}

}
