package listeners;

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import beans.Food;
import dao.FoodDao;

/**
 * Application Lifecycle Listener implementation class GetAllFoodList
 *
 */
@WebListener
public class GetAllFoodList implements HttpSessionListener {

    /**
     * Default constructor. 
     */
    public GetAllFoodList() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent sessionEvent)  {
    	
		try {
			HttpSession session= sessionEvent.getSession();
			List<Food> allFoodList;
			FoodDao fd = new FoodDao();
			allFoodList = fd.selectFood("*");
			session.setAttribute("allFoodList", allFoodList);
			
			Map<String, Food> foodMap = allFoodList.stream().
													collect(Collectors.toMap(Food::getFoodNo,Function.identity()));
			session.setAttribute("foodMap", foodMap);	
		} catch (Exception e) {
			e.printStackTrace();
		}
        
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent sessionEvent)  { 
         // TODO Auto-generated method stub
    }
	
}
