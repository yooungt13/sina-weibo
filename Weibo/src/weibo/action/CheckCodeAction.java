package weibo.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import weibo.hibernate.UserinfoDAO;
import weibo.servive.UserServ;
import weibo.util.ImplUtil;

import com.opensymphony.xwork2.ActionContext;

public class CheckCodeAction extends BaseAction {
	// 定义图片宽度、长度
	private static int WIDTH = 60;
	private static int HEIGHT = 20;
	
	private ByteArrayInputStream inputStream;
	private String checkCodeNumber;
	
	
	//验证输入的验证码
	public String getCheckCodeNumber() {
		return checkCodeNumber;
	}

	public void setCheckCodeNumber(String checkCodeNumber) {
		this.checkCodeNumber = checkCodeNumber;
	}

	
	public ByteArrayInputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(ByteArrayInputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String execute() throws IOException {

		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		
		Map<String,Object> session = ActionContext.getContext().getSession();
		//HttpSession session = request.getSession();					// 获取HttpSession对象
		response.setContentType("image/jpeg");						// 设置编码格式
		ServletOutputStream sos = response.getOutputStream();  		// 获取输出流
		
		// 设置浏览器不要缓存图片
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		
		// 穿件内存图像并获取其图形上下文
		BufferedImage image = 
			new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		char [] rands = generateCheckCode();
		
		// 产生图像
		drawBackground(g);
		drawRands(g,rands);
		g.dispose();
		
		// 将图像输出客户端
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		ImageOutputStream imageOut = ImageIO.createImageOutputStream(bos);	
		ImageIO.write(image, "JPEG", imageOut);
		imageOut.close();
		
		byte [] buf = bos.toByteArray();
		response.setContentLength(buf.length);
		sos.write(buf);		
		
		// 将当前验证码存入到Session中
		session.put("check_code", new String(rands));
		
		ByteArrayInputStream input = new ByteArrayInputStream(buf);
		this.setInputStream(input);
		
		bos.close();
		sos.close();
		
		return SUCCESS;		
	}

	// 输出没有干扰元素的验证码图片
	private void drawRands(Graphics g, char[] rands) {
		// TODO Auto-generated method stub
		g.setColor(Color.BLACK);
		g.setFont(new Font(null,Font.ITALIC|Font.BOLD,18));
		
		// 在不同的高度上输出验证码的每个字符
		g.drawString("" + rands[0], 1, 17);
		g.drawString("" + rands[1], 16, 15);
		g.drawString("" + rands[2], 31, 18);
		g.drawString("" + rands[3], 46, 16);	
	}

	// 输入有干扰元素的验证码图片
	private void drawBackground(Graphics g) {
		// TODO Auto-generated method stub
		// 画背景
		g.setColor(new Color(0xDCDCDC));
		g.fillRect(0, 0, WIDTH, HEIGHT);
		
		// 随即产生120个干扰点
		for( int i = 0; i < 120; i++ ){
			int x = (int)(Math.random() * WIDTH);
			int y = (int)(Math.random() * HEIGHT);
			int red = (int)(Math.random() * 255);
			int green = (int)(Math.random() * 255);
			int blue = (int)(Math.random() * 255);
			g.setColor(new Color(red,green,blue));
			g.drawOval(x, y, 1, 0);			
		}
	}

	private char[] generateCheckCode() {
		// TODO Auto-generated method stub
		String chars = "0123456789abcdefghijklmnopqrstuvwxyz";
		
		char [] rands = new char[4];
		for( int i = 0; i < 4; i++){
			int rand = (int)(Math.random() * 36);
			rands[i] = chars.charAt(rand);
		}	
		return rands;
	}
	
	public String validateCheckCode(){
		try {
			// 创建response
			HttpServletResponse response; 
	        response=ServletActionContext.getResponse(); 
	        response.setContentType( "text/json;charset=utf-8"); 
	        response.setHeader( "Cache-Control", "no-cache"); 
	        response.setHeader( "Pargma", "no-cache"); 
	        PrintWriter out;
	        
	        Map<String,Object> session = ActionContext.getContext().getSession();
	        // 创建响应输出，通过out将返回值写入response
			out = response.getWriter();
	        
	        //JSONObject js = new JSONObject();
			String sessionCode = (String) session.get("check_code");
			
			if ( sessionCode.equals(this.checkCodeNumber) ){
				out.write("true"); 
			}
			else{
				out.write("false");
			}
	        out.close();
	        
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		return null;
	}
	
	
}
