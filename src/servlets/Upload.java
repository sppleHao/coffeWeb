package servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import beans.Food;
import dao.FoodDao;
import util.GetSrc;

/**
 * 添加餐品与上传图片
 */
@WebServlet("/Admin/foodUpload")
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//设置传输格式
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		DiskFileItemFactory factoy=new DiskFileItemFactory();
        //创建解析器
        ServletFileUpload sfu=new ServletFileUpload(factoy);
        //解析request

//      操作名称：<input type="text" name="opName" id="opName" readonly="readonly"><br>
//      餐品号:<input type="text" name="foodNo" id="foodNo">
//		餐品名:<input type="text" name="foodName" id="foodName">
//		餐品单价:<input type="text" name="foodPrice" id="foodPrice">
//		餐品库存：<input type="text" name="foodMount" id="foodMount">
//		餐品类型：<input type="text" name="foodType" id="foodType">
//		<input type="file" name="file"><br>
        
        try {
			@SuppressWarnings("unchecked")
			
			//request 对象内容
			List<FileItem> list = sfu.parseRequest(request);
			
			String fileName= list.get(0).getName();
			
			//操作名
			String opName = list.get(1).getString();
			
			if (opName.equals("insert")&&fileName==null) {
				out.print("mustImg");
				return;
			}
			
			//食物信息
			Food food = new Food();
			FoodDao fd = new FoodDao();
			
			String foodNo = list.get(2).getString("utf-8");
			food.setFoodNo(foodNo);
			
			String foodName = list.get(3).getString("utf-8");
			food.setFoodName(foodName);
			
			String foodPrice = list.get(4).getString("utf-8");
			food.setFoodPrice(Integer.parseInt(foodPrice));
			
			String foodMount = list.get(5).getString("utf-8");
			food.setFoodMount(Integer.parseInt(foodMount));
			
			String foodType = list.get(6).getString("utf-8");
			food.setFoodType(foodType);
			
			
			if (list.get(0)!=null){
				
				//设置图片
				
//				if(!fileName.toLowerCase().endsWith("jpg")){
//	                System.out.println("图片格式不是jpg");
//	                request.setAttribute("msg", "你的图片格式不是jpg格式");
//	                request.getRequestDispatcher("/adminjsps/a 	dmin/book/add.jsp").forward(request, response);
//	                return;
//	            }
				//设置保存地址
				
				//String path =request.getSession().getServletContext().getRealPath("")+java.io.File.separator+"Img";
				
				//String saveDir = foodType+java.io.File.separator+foodName+".png";
				
				String saveDir = GetSrc.getFoodSaveDir(foodType, foodNo);
				
				
				//保存图片
				File file = new File(saveDir);
				File fileParent = file.getParentFile();
				if (!fileParent.exists()) {
					fileParent.mkdirs();
				}
				
				if (opName.equals("update")) {
					if(file.exists()&&file.isFile())
			             file.delete();
						 System.out.println("删除成功！");
				}
				
				list.get(0).write(file);
			}
			else {
				out.println("图片无效");
			}
			
			if(opName.equals("insert")) {
				fd.add(food);
			}
			else {
				fd.update(food);
			}
			
			
			out.print("success");
			
		} catch (Exception e) {
			out.print(e.getMessage());
			e.printStackTrace();
		}
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
