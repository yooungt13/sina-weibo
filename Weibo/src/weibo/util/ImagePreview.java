package weibo.util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import sun.misc.BASE64Encoder;
import javax.imageio.*;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.output.DeferredFileOutputStream;
import org.apache.log4j.Logger;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;


public class ImagePreview {
	private final static Logger LOGGER = Logger.getLogger(ImagePreview.class);
	public ImagePreview(){
		
	}
	
	public String ProcessRequest(HttpServletRequest request) throws ServletException, IOException{
		BASE64Encoder encoder = new BASE64Encoder();
		
		byte[] bs = null;
		long filesize = 0;
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		int width = 0;
		int height = 0;
		
		InputStream inputStream = null;
		ByteArrayOutputStream op = null;
		DeferredFileOutputStream dfo = null;
		
		try{
			factory.setSizeThreshold(4096);// 设置缓冲,这个值决定了是fileinputstream还是bytearrayinputstream
			//factory.setRepository(new File("d:\\temp"));//设置临时存放目录,默认是new File(System.getProperty("java.io.tmpdir"))
			ServletFileUpload sfileUpLoad = new ServletFileUpload(factory);
			sfileUpLoad.setSizeMax(10*1024*1024);//10M
			List items = sfileUpLoad.parseRequest(request);
			Iterator it = items.iterator();
			//暂时只考虑单文件
			while(it.hasNext()){
				FileItem fileItem = (FileItem)it.next();
				if(!fileItem.isFormField()){
					inputStream = fileItem.getInputStream();
					filesize = fileItem.getSize();
					bs = new byte[(int)filesize];
					
				}else{
					if (fileItem.getFieldName().equals("width")) {
						dfo = (DeferredFileOutputStream) fileItem.getOutputStream();
						width = Integer.parseInt(new String(dfo.getData()));
					}
					if (fileItem.getFieldName().equals("height")) {
						dfo = (DeferredFileOutputStream) fileItem.getOutputStream();
						height = Integer.parseInt(new String(dfo.getData()));
					}
				}
			}
			
			op = ResizeImg(inputStream, width, height);
			
			bs = op.toByteArray();
			
			String imgpath = "data:image/jpeg;base64," ;
			String img = encoder.encode(bs);
			
			imgpath += img;
			
			return imgpath;
		}catch (FileUploadException e) {
			e.printStackTrace();
			LOGGER.error(e);
		} catch (IOException e) {
			e.printStackTrace();
			LOGGER.error(e);
		}finally{
			if(dfo != null){
				dfo.close();
			}
			if(inputStream != null){
				inputStream.close();
			}
			if(op!= null){
				op.close();
			}
		}
		
		//blankimage
		return "data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==";
		
	}
	
	//只对jpg缩放
	public ByteArrayOutputStream ResizeImg(InputStream inputStream,int maxWidth,int maxHeight) throws IOException{
		
		BufferedImage bufferimage = ImageIO.read(inputStream);
		int curWidth = bufferimage.getWidth();
		int curHeight = bufferimage.getHeight();
		
//		double desiredRatio = Math.min((double)(maxWidth)/(double)curWidth,(double)maxHeight/(double)curHeight);
//		curWidth =  (int) (curWidth*desiredRatio);
//		curHeight = (int)(curHeight*desiredRatio);
		double ratio = 0; 
		Image itemp = bufferimage.getScaledInstance(maxWidth, maxHeight, bufferimage.SCALE_SMOOTH);      
        // 计算比例      
        if ((bufferimage.getHeight() > maxHeight) || (bufferimage.getWidth() > maxWidth)) {      
            if (bufferimage.getHeight() > bufferimage.getWidth()) {      
                ratio = (new Integer(maxHeight)).doubleValue() / bufferimage.getHeight();      
            } else {      
                ratio = (new Integer(maxWidth)).doubleValue() / bufferimage.getWidth();      
            }      
            AffineTransformOp op = new AffineTransformOp(AffineTransform.getScaleInstance(ratio, ratio), null);      
            itemp = op.filter(bufferimage, null);      
        }
        
		
		BufferedImage bufftmp = new BufferedImage(curWidth,curHeight,BufferedImage.TYPE_INT_RGB);
		Graphics2D g2D = bufftmp.createGraphics();
		
		g2D.setColor(Color.white);
		g2D.fillRect(0, 0, curWidth, curHeight);
//		g2D.drawImage(bufferimage, null, 0, 0);
		
		if (maxWidth == itemp.getWidth(null))      
			g2D.drawImage(itemp, 0, (maxHeight - itemp.getHeight(null)) / 2, itemp.getWidth(null), itemp.getHeight(null), Color.white, null);      
        else     
        	g2D.drawImage(itemp, (maxWidth - itemp.getWidth(null)) / 2, 0, itemp.getWidth(null), itemp.getHeight(null), Color.white, null);      
		g2D.dispose();      
//        itemp = bufftmp;
		
		ByteArrayOutputStream op = new ByteArrayOutputStream();
		
		JPEGImageEncoder imageEncoder = JPEGCodec.createJPEGEncoder(op);
		
		imageEncoder.encode((BufferedImage)itemp);
		
		return op;
	}
	

}
