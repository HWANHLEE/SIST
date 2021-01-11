package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/*CheckList
 * 기사제목, 링크 배열에 담기(-)
 * 이미지 기사 이미지 가져오기...후 좋은방법은 아닌거 같은대 가져오니까 되어써..pass(-)
 * no image인건 title만 가져오는거로? 아니면 바스락로고이미지?
 * 축야농배일(-)
 * rss링크는 은지가 알려준거로(-)
 */

@Controller
@RequestMapping("/news")
public class NewsController{
   
   //기사보기 클릭시 보이는 화면 > 일단 스포츠일반페이지로 설정
   @RequestMapping(value="/news", method = RequestMethod.GET)
   public String news(HttpServletResponse response,Model model){//동아스포츠 종합일반
      String selectedNews = "news";
      ArrayList<String>titles = new ArrayList<String>();
      ArrayList<String>links = new ArrayList<String>();
      ArrayList<String>descriptions = new ArrayList<String>();
      ArrayList<String>images = new ArrayList<String>();
      
      try {
         String url = "http://rss.donga.com/sports.xml";//이미지때매 일단 동아일보로
         response.setCharacterEncoding("utf-8");
         Document rss = Jsoup.connect(url).get();
         //System.out.println("rss = "+rss);//확인용
         //PrintWriter out = response.getWriter();
         
         Elements items = rss.select("item");
          
         for(int i = 0 ; i<=22;i++){//기사는 20개만
            titles.add(items.select("title").get(i).text());//기사제목읽은거titles배열에 담기
            links.add(items.select("link").get(i).text());//기사url읽은거 links배열에 담기
            //descriptions.add(items.select("description").get(i).text());//기사url읽은거 links배열에 담기
            String description = items.select("description").get(i).text().
                                 substring(items.select("description").get(i).text().lastIndexOf(">")+1);//기사url읽은거 links배열에 담기
            descriptions.add(description);
            //descriptions.add(description[1]+"maxlength = 150");
            String[] image = items.select("description").get(i).text().split("align");
            //System.out.println(i+"번째 description = "+descriptions);//확인용
            if(image[0].startsWith("<img src")){
               images.add(image[0]+"style='width:180px; height:150px; margin:0,auto;' class='img-rounded'/>");
            } else if(!image[0].startsWith("<img src")){images.add("<img src = '/basrak/images/basrakLogo2_small.png; class='img-rounded'/>");}
         }
         model.addAttribute("titles",titles);
         model.addAttribute("links",links);
         model.addAttribute("images",images);
         model.addAttribute("descriptions",descriptions);
         model.addAttribute("selectedNews", selectedNews);
         
      }catch(Exception e) {
         System.out.print(e.getMessage());
      }
      return "news/news";
   }
   
   @RequestMapping(value="/getsoccer", method = RequestMethod.GET)
   public String news_soccer(HttpServletResponse response,Model model){//동아스포츠 축구
      String selectedNews = "soccer";
      ArrayList<String>titles = new ArrayList<String>();
      ArrayList<String>links = new ArrayList<String>();
      ArrayList<String>descriptions = new ArrayList<String>();
      ArrayList<String>images = new ArrayList<String>();
      
      try {
         String url = "https://rss.donga.com/sportsdonga/soccer.xml";//이미지때매 일단 동아일보로
         response.setCharacterEncoding("utf-8");
         Document rss = Jsoup.connect(url).get();
         //System.out.println("rss = "+rss);//확인용
         //PrintWriter out = response.getWriter();
         
         Elements items = rss.select("item");
          
         for(int i = 0 ; i<=22;i++){//기사는 20개만
            titles.add(items.select("title").get(i).text());//기사제목읽은거titles배열에 담기
            links.add(items.select("link").get(i).text());//기사url읽은거 links배열에 담기
            //descriptions.add(items.select("description").get(i).text());//기사url읽은거 links배열에 담기
            String description = items.select("description").get(i).text().
                                 substring(items.select("description").get(i).text().lastIndexOf(">")+1);//기사url읽은거 links배열에 담기
            descriptions.add(description);
            //descriptions.add(description[1]+"maxlength = 150");
            String[] image = items.select("description").get(i).text().split("align");
            //System.out.println(i+"번째 description = "+descriptions);//확인용
            if(image[0].startsWith("<img src")){
               images.add(image[0]+"style='width:180px; height:150px; margin:0,auto;' class='img-rounded'/>");
            } else if(!image[0].startsWith("<img src")){images.add("<img src = '/basrak/images/basrakLogo2_small.png; class='img-rounded'/>");}
         }
         model.addAttribute("titles",titles);
         model.addAttribute("links",links);
         model.addAttribute("images",images);
         model.addAttribute("descriptions",descriptions);
         model.addAttribute("selectedNews", selectedNews);
         
      }catch(Exception e) {
         System.out.print(e.getMessage());
      }
      return "news/news";
   }
   
   @RequestMapping(value="/getbaseball", method = RequestMethod.GET)
   public String news_baseball(HttpServletResponse response,Model model){//동아스포츠 야구
      String selectedNews = "baseball";
      ArrayList<String>titles = new ArrayList<String>();
      ArrayList<String>links = new ArrayList<String>();
      ArrayList<String>descriptions = new ArrayList<String>();
      ArrayList<String>images = new ArrayList<String>();
      
      try {
         String url = "https://rss.donga.com/sportsdonga/baseball.xml";//이미지때매 일단 동아일보로
         response.setCharacterEncoding("utf-8");
         Document rss = Jsoup.connect(url).get();
         //System.out.println("rss = "+rss);//확인용
         //PrintWriter out = response.getWriter();
         
         Elements items = rss.select("item");
          
         for(int i = 0 ; i<=22;i++){//기사는 20개만
            titles.add(items.select("title").get(i).text());//기사제목읽은거titles배열에 담기
            links.add(items.select("link").get(i).text());//기사url읽은거 links배열에 담기
            //descriptions.add(items.select("description").get(i).text());//기사url읽은거 links배열에 담기
            String description = items.select("description").get(i).text().
                                 substring(items.select("description").get(i).text().lastIndexOf(">")+1);//기사url읽은거 links배열에 담기
            descriptions.add(description);
            //descriptions.add(description[1]+"maxlength = 150");
            String[] image = items.select("description").get(i).text().split("align");
            //System.out.println(i+"번째 description = "+descriptions);//확인용
            if(image[0].startsWith("<img src")){
               images.add(image[0]+"style='width:180px; height:150px; margin:0,auto;' class='img-rounded'/>");
            } else if(!image[0].startsWith("<img src")){images.add("<img src = '/basrak/images/basrakLogo2_small.png; class='img-rounded'/>");}
         }
         model.addAttribute("titles",titles);
         model.addAttribute("links",links);
         model.addAttribute("images",images);
         model.addAttribute("descriptions",descriptions);
         model.addAttribute("selectedNews", selectedNews);
         
      }catch(Exception e) {
         System.out.print(e.getMessage());
      }
      return "news/news";
   }
   
   @RequestMapping(value="/getbasketball", method = RequestMethod.GET)
   public String news_basketball(HttpServletResponse response,Model model){//스포츠타임스 농구
      String selectedNews = "basketball";
      ArrayList<String>titles = new ArrayList<String>();
      ArrayList<String>links = new ArrayList<String>();
      
      try {
         String url = "http://www.thesportstimes.co.kr/rss/S1N5.xml";
         response.setCharacterEncoding("utf-8");
         Document rss = Jsoup.connect(url).get();
         //System.out.println("rss = "+rss);//확인용
         //PrintWriter out = response.getWriter();
         
         Elements items = rss.select("item");
         
         for(Element item : items) {
            titles.add(item.select("title").first().text());//기사제목읽은거titles배열에 담기
            links.add(item.select("link").first().text());//기사url읽은거 links배열에 담기
         }
         model.addAttribute("titles",titles);
         model.addAttribute("links",links);
         model.addAttribute("selectedNews", selectedNews);
         
      }catch(Exception e) {
         System.out.print(e.getMessage());
      }
      return "news/news";
   }
   
   @RequestMapping(value="/getvolleyball", method = RequestMethod.GET)
   public String news_volleyball(HttpServletResponse response,Model model){//스포츠타임스 배구
      String selectedNews = "volleyball";
      ArrayList<String>titles = new ArrayList<String>();
      ArrayList<String>links = new ArrayList<String>();
      
      try {
         String url = "http://www.thesportstimes.co.kr/rss/S1N6.xml";
         response.setCharacterEncoding("utf-8");
         Document rss = Jsoup.connect(url).get();
         //System.out.println("rss = "+rss);//확인용
         //PrintWriter out = response.getWriter();
         
         Elements items = rss.select("item");
         
         for(Element item : items) {
            titles.add(item.select("title").first().text());//기사제목읽은거titles배열에 담기
            links.add(item.select("link").first().text());//기사url읽은거 links배열에 담기
         }
         model.addAttribute("titles",titles);
         model.addAttribute("links",links);
         model.addAttribute("selectedNews", selectedNews);
         
      }catch(Exception e) {
         System.out.print(e.getMessage());
      }
      return "news/news";
   }

   @RequestMapping(value="/getliban", method = RequestMethod.GET)
   public String news_liban(HttpServletResponse response,Model model){//동아스포츠 종합일반
      String selectedNews = "liban";
      ArrayList<String>titles = new ArrayList<String>();
      ArrayList<String>links = new ArrayList<String>();
      ArrayList<String>descriptions = new ArrayList<String>();
      ArrayList<String>images = new ArrayList<String>();
      
      try {
        String url = "http://rss.donga.com/sports.xml";//이미지때매 일단 동아일보로
         //String url = "http://rss.donga.com/sportsdonga/sports_general.xml";//얘가 농구/배구...?이미지때매 일단 동아일보로
         response.setCharacterEncoding("utf-8");
         Document rss = Jsoup.connect(url).get();
         //System.out.println("rss = "+rss);//확인용
         //PrintWriter out = response.getWriter();
         
         Elements items = rss.select("item");
          
         for(int i = 0 ; i<=22;i++){//기사는 20개만
            titles.add(items.select("title").get(i).text());//기사제목읽은거titles배열에 담기
            links.add(items.select("link").get(i).text());//기사url읽은거 links배열에 담기
            //descriptions.add(items.select("description").get(i).text());//기사url읽은거 links배열에 담기
            String description = items.select("description").get(i).text().
                                 substring(items.select("description").get(i).text().lastIndexOf(">")+1);//기사url읽은거 links배열에 담기
            descriptions.add(description);
            //descriptions.add(description[1]+"maxlength = 150");
            String[] image = items.select("description").get(i).text().split("align");
            //System.out.println(i+"번째 description = "+descriptions);//확인용
            if(image[0].startsWith("<img src")){
               images.add(image[0]+"style='width:180px; height:150px; margin:0,auto;' class='img-rounded'/>");
            } else if(!image[0].startsWith("<img src")){images.add("<img src = '/basrak/images/basrakLogo2_small.png; class='img-rounded'/>");}
         }
         model.addAttribute("titles",titles);
         model.addAttribute("links",links);
         model.addAttribute("images",images);
         model.addAttribute("descriptions",descriptions);
         model.addAttribute("selectedNews", selectedNews);
         
      }catch(Exception e) {
         System.out.print(e.getMessage());
      }
      return "news/news";
   }
}