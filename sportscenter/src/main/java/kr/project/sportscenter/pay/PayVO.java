package kr.project.sportscenter.pay;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

import lombok.Data;

@Data
public class PayVO {
	private int payid;
	private int classid;
	private int usernum;	
	private int paystate;
	private int cancelstate;
	private int refundstate;
	private int price;
	private String paymethod;
	private String imp_uid;
	
	private String username;
	
	// 사용자로부터 전송되어지는 값(검색, 페이징, 필터링(조건))
	private String searchType;
	private String searchWord;
	private int page; // 사용자가 요청한 페이지 번호
	private int startIdx; // limit 앞에 들어갈 시작인덱스값
			
	public PayVO() {
		this.page = 1;
	}
			
	public int getStartIdx() {
		return (page-1) * 10;
	}
	
	private int subtype;
	private int classyear;
    private int classmonth;
    private int classlevel;
    private int classtime;
    private String classday;
    
    public String getSubtypeName() {
        Map<Integer, String> subtypeMap = new HashMap<>();
        subtypeMap.put(1, "수영");
        subtypeMap.put(2, "헬스");
        subtypeMap.put(3, "스쿼시");
        subtypeMap.put(4, "줌바댄스");
        subtypeMap.put(5, "아쿠아로빅");
        subtypeMap.put(6, "스피닝");
        subtypeMap.put(7, "필라테스");
        subtypeMap.put(8, "점핑 트램플린");
        subtypeMap.put(9, "플라잉요가");
        
        return subtypeMap.getOrDefault(subtype, "알 수 없음");
    }
    
    public String getClassYoil() {
    	String[] days = classday.split("\\^");
    	// for(String day : days) {System.out.println(day);}
        StringBuilder sb = new StringBuilder();
        for(String day : days) {
        	switch (day) {
    			case "1":
                    sb.append("월,");
                    break;
                case "2":
                    sb.append("화,");
                    break;
                case "3":
                    sb.append("수,");
                    break;
                case "4":
                    sb.append("목,");
                    break;
                case "5":
                    sb.append("금,");
                    break;
    			}
        	}
        	if(sb.length() > 0) sb.setLength(sb.length() - 1);
            return sb.toString();
    }
    
    public String getClasslevelName() {
        switch (classlevel) {
            case 1:
                return "초급";
            case 2:
                return "중급";
            case 3:
                return "상급";
            case 4:
                return "연수";
            case 5:
            	return "FREE";
            default:
                return "";
        }
    }
    public String getFormattedClasstime() {
        int hours = classtime;
        DecimalFormat df = new DecimalFormat("00");
        return df.format(hours) + ":" + "00";
    }
} 