package kr.project.sportscenter.class1;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

import lombok.Data;

@Data
public class ClassVO {
    private int classid;
    private int subtype;
    private int classyear;
    private int classmonth;
    private String classname;
    private int classlevel;
    private int classtime;
    private String classday;
    private int classprice;
    private int classlimit;
    private int classcnt;
    
    private String searchType;
    private String searchWord;
    private int page; // 사용자가 요청한 페이지 번호
    private int startIdx; // limit 앞에 들어갈 시작인덱스값
    
    public ClassVO() {
        this.page = 1;
    }
    
    public int getStartIdx() {
        return (page-1) * 10;
    }

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

    public void setClassday(String classday) {
        String[] days = classday.split("\\^");
        StringBuilder sb = new StringBuilder();
        for(String day : days) {
            switch(day) {
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
        this.classday = sb.toString();
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
                return "자유";
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
