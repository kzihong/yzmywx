package cn.easycode.yzmywx.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;


public class ReadExcel {

	@SuppressWarnings("finally")
	public static List<List<String>> getExcelContents(String filepath,int beginRowIndex, int ColumnLength){
		List<List<String>> RowList = new ArrayList<List<String>>();
		List<String> columnList = null;
		File file = new File(filepath);
		try {
			//得到工作簿
			Workbook workbook = Workbook.getWorkbook(file);
			//得到sheet
			Sheet sheet = workbook.getSheet(0);
			Cell cell = null;
			 for (int i = beginRowIndex; i < sheet.getRows(); i++) {
				 boolean flag = true;
				 columnList = new ArrayList<String>();
	             for (int j = 0; j < ColumnLength; j++) {
	            	 cell = sheet.getCell(j, i);
	            	 if(!cell.getContents().equals("")){
	            		 columnList.add(cell.getContents());
	            		 flag = true;
	            	 }
	            	 else{
	            		 flag = false;
	            		 break;	            		 
	            	 }
				}
	            if(flag){
	            	RowList.add(columnList);	            	 
	            }
			}
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
			RowList = null;
		}finally{
			return RowList;			
		}
	}
}
