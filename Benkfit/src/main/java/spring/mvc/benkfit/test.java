package spring.mvc.benkfit;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import spring.mvc.benkfit.persistence.DAOImpl_lia;
import spring.mvc.benkfit.persistence.DAO_lia;

public class test {
	public static void main(String[] args) throws IOException {
		ProcessBuilder pb = new ProcessBuilder("python", "C:/DEV43/python/source/coin.py");
		Process p = pb.start();   //프로세스 호출
		
		// 프로세시의 실행결과를 스트림으로 리턴
		BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
		 
		String line = "";
		
		StringBuilder sb = new StringBuilder();
		
		ArrayList<String> list = new ArrayList<>();
		
		while((line = br.readLine()) != null) {
			list.add(line.toString());
		}
		
		
		ArrayList<ArrayList> set = new ArrayList<ArrayList>();
		
		for(String str : list) {
			String[] coin = str.substring(1, str.length()-1).split(",");
			ArrayList<String> subset = new ArrayList<>();
			
			for(int i=0; i<coin.length; i++) {
				/*System.out.println(i + " : " + coin[i].replace("'", "").trim());*/
				subset.add(coin[i].replace("'", "").trim());
			}
			set.add(subset);
			Map<String, String> name = new HashMap<String, String>();
			name.put("name", subset.get(0));
			
		}
		
		DAO_lia dao = new DAOImpl_lia();
		
		// 변동값 업데이트
		for(int i=0; i<set.size(); i++) {
			/*System.out.println(i + " : " + set.get(i));*/
			System.out.println(set.get(i).get(0) + "/" 
			+ set.get(i).get(1) + "/" 
					+ set.get(i).get(2).toString().trim() 
			+ " / " + set.get(i).get(3).toString().trim() + "/" 
			+ set.get(i).get(4) + "/" 
			+ set.get(i).get(5).toString().replace("JO", "조").replace("UCK", "억"));
			
			Map<String, Object> vals = new HashMap<String, Object>();
			vals.put("name", set.get(i).get(0).toString());
			vals.put("marketprice", set.get(i).get(1));
			vals.put("changeNum", set.get(i).get(2).toString().trim());
			vals.put("changePer", set.get(i).get(3).toString().trim());
			vals.put("sort_amount", set.get(i).get(4));
			vals.put("total", set.get(i).get(5).toString().replace("JO", "조").replace("UCK", "억"));
			System.out.println("vals put완료");
			int cnt = dao.updateCoins(vals);
			System.out.println(i + " : " + cnt);
		}
		
		//자원해제
		br.close();
	}
}
