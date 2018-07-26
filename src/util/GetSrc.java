package util;

import java.io.File;

public class GetSrc {
	private final static String sp =File.separator;
	private final static String folderPath="D:"+ sp +"coffeWeb" +sp + "Img"+sp;
	public static String getFoodSaveDir(String foodType,String foodNo) {
		return folderPath+foodType+sp+foodNo+".png";
	}
	public static String getFoodSrc(String foodType,String foodNo) {
		return foodType+sp+foodNo+".png";
	}
}
