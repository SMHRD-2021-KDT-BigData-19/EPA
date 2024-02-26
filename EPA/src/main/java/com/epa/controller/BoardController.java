package com.epa.controller;



import java.io.File;
import java.io.IOException;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.epa.mapper.BoardMapper;


import com.epa.entity.Board;
import com.epa.entity.Comment;
import com.epa.entity.image;
import com.epa.entity.imageList;



@Controller
public class BoardController {
   @Autowired
   private BoardMapper mapper;

   @RequestMapping("/boardList.do")
   public String boardList(Model model) {
      List<Board> list = mapper.boardList();
      model.addAttribute("list", list);
      return "boardList";

   }
   @RequestMapping("/boardList2.do")
   public String boardList2(Model model) {
      List<Board> list2 = mapper.boardList2();
      model.addAttribute("list2", list2);
      return "boardList2";

   }
   @RequestMapping("/boardList3.do")
   public String boardList3(Model model) {
      List<Board> list3 = mapper.boardList3();
      model.addAttribute("list3", list3);
      return "boardList3";

   }
   @RequestMapping("/boardList4.do")
   public String boardList4(Model model) {
      List<Board> list4 = mapper.boardList4();
      model.addAttribute("list4", list4);
      return "boardList4";

   }



   @RequestMapping("/boardForm.do")
   public void boardForm() {

   }
   
   


   @PostMapping("/boardInsert.do")
      public String boardInsert(Board vo, MultipartHttpServletRequest file) {
         
         // user_id, category, title, content DB에 업로드
         mapper.boardInsert(vo);
         
         
         int BD_NO = vo.getBD_NO();
         
         // 업로드한 이미지 파일을 서버에 저장 할 경로
         String uploadFolder = "C:\\image\\post\\" + BD_NO;
         
         // 이미지 파일 리스트에 저장
         List<MultipartFile> list = file.getFiles("file");
         
         // 이미지 파일 서버에 저장
         for(int i = 0; i<list.size(); i++) {
            String fileRealName = list.get(i).getOriginalFilename();
            
            
            // 폴더가 존재하지 않으면 생성
            File folder = new File(uploadFolder);
              if (!folder.exists()) {
                  folder.mkdirs();
              }
            
            File saveFile = new File(uploadFolder + "\\" + fileRealName);
            
            try {
               list.get(i).transferTo(saveFile);
            } catch (IllegalStateException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            } catch (IOException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
            
            // 게시물 이미지 DB에 저장
            // picture_id = i+1, post_id = post_id, folder = uploadFolder, file_name = fileRealName
            image Ivo = new image(fileRealName,BD_NO, uploadFolder);
            
            
            mapper.imageUp(Ivo);
            
         }
         return "redirect:/boardList.do";
      }
   
   @RequestMapping("/commentInsert.do")
   public String commentInsert(Comment co) {
      mapper.commentInsert(co);
      return "redirect:/boardContent.do/"+co.getBD_NO();
   }

   @RequestMapping("/boardContent.do/{BD_NO}")
   public String boardContent(@PathVariable("BD_NO") int BD_NO, Model model) {

      Board vo = mapper.boardContent(BD_NO);
      
      List<Comment> comment = mapper.commnetContent(BD_NO);
      
      List<imageList> Ivo = mapper.imageContent(BD_NO);
      System.out.println(Ivo.toString());

      model.addAttribute("vo", vo);
      model.addAttribute("comment",comment);
      model.addAttribute("Ivo", Ivo);


      return "boardContent";
   }

   @RequestMapping("/boardDelete.do/{BD_NO}")
   public String boardDelete(@PathVariable("BD_NO") int BD_NO) {

      mapper.boardDelete(BD_NO);

      return "redirect:/boardList.do";
   }
   @RequestMapping("/commentDelete.do")
   public String commentDelete(@RequestParam("COM_NO") int COM_NO,Comment co) {

      mapper.commentDelete(COM_NO);

      return "redirect:/boardContent.do/"+co.getBD_NO();
   }

   @RequestMapping("/boardUpdateForm.do")
   public String boardUpdateForm(int BD_NO, Model model) {
      Board vo = mapper.boardContent(BD_NO);
      model.addAttribute("vo", vo);

      return "boardUpdateForm";
   }

   @RequestMapping("/boardUpdate.do")
   public String boardUpdate(Board vo) {

      mapper.boardUpdate(vo);

      return "redirect:/boardList.do";
   }
   
   
   


}