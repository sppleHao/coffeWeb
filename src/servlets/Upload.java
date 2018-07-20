package servlets;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import beans.Food;
import dao.FoodDao;

/**
 * 添加餐品与上传图片
 */
@WebServlet("/Upload")
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
		
		DiskFileItemFactory factoy=new DiskFileItemFactory();
        //创建解析器
        ServletFileUpload sfu=new ServletFileUpload(factoy);
        //解析request
        
//      餐品号:<input type="text" name="foodNo" id="foodNo">
//		餐品名:<input type="text" name="foodName" id="foodName">
//		餐品单价:<input type="text" name="foodPrice" id="foodPrice">
//		餐品库存：<input type="text" name="foodMount" id="foodMount">
//		餐品类型：<input type="text" name="foodType" id="foodType">
//		<input type="file" name="file"><br>
        
        try {
			@SuppressWarnings("unchecked")
			List<FileItem> list = sfu.parseRequest(request);
			Food food = new Food();
			FoodDao fd = new FoodDao();
			String foodNo = list.get(0).getString("utf-8");
			food.setFoodNo(foodNo);
			String foodName = list.get(1).getString("utf-8");
			food.setFoodName(foodName);
			String foodPrice = list.get(2).getString("utf-8");
			food.setFoodPrice(Integer.parseInt(foodPrice));
			String foodMount = list.get(3).getString("utf-8");
			food.setFoodMount(Integer.parseInt(foodMount));
			String foodType = list.get(4).getString("utf-8");
			food.setFoodType(foodType);
			
//			fd.add(food);
			
			//图片地址
			String fileName= list.get(5).getName();
//			if(!fileName.toLowerCase().endsWith("jpg")){
//                System.out.println("图片格式不是jpg");
//                request.setAttribute("msg", "你的图片格式不是jpg格式");
//                request.getRequestDispatcher("/adminjsps/admin/book/add.jsp").forward(request, response);
//                return;
//            }
			
			//保存地址
			String saveDirectory = "d:\\test"+foodName+".png";
			
			//保存图片
			File file = new File(saveDirectory);
			list.get(5).write(file);
			
		} catch (Exception e) {
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
