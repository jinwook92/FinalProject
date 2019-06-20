package com.mar.BController;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mar.ActService.ActService;
import com.mar.BService.BoardService;
import com.mar.BVO.BoardVO;
import com.mar.BVO.ReplyBoardVO;
import com.mar.UVO.UserVO;
import com.mar.myBService.myBoardService;
import com.mar.simsimi.developer.RequestParam1;
import com.mar.simsimi.developer.SimsimiAPI;

@Controller
public class BoardController {
    @Autowired
    private BoardService service;
    @Autowired
    private ActService actservice;
    @Autowired
    private myBoardService myservice;

    @RequestMapping(value = "/main")
    public String main() {

        return "main/content";
    }
    /*
     * @RequestMapping(value = "/main" , method = Req`uestMethod.GET) public
     * String Search (@RequestParam(value = "s" , required = false) String s ,
     * Model model) {
     *
     * return "board/BoardList"; }
     */

    @RequestMapping(value = "/insert")
    public String insert(HttpServletRequest req, BoardVO boardVO) {
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("session_id");
        return "board/BoardInsert";
    }

    @RequestMapping(value = "/insertok")
    public String insertok(HttpServletRequest req, @ModelAttribute("boardVO") BoardVO boardVO, Errors error,
                           Model model, @RequestParam("board_image") MultipartFile Bimg) throws Exception {

        String Mcheck = boardVO.getMovielink();
        String content = boardVO.getBoard_content();

        // �����϶� �ڿ� ','����
        if (Mcheck == null || "".equals(Mcheck)) {
            boardVO.setBoard_content(content.substring(0, content.length() - 1));
            //boardVO.setBoard_content(boardVO.getBoard_content().replace("\r\n","<br>"));
        }
        // �������϶� ����','
        else {
            boardVO.setBoard_content(content.substring(1));
            //boardVO.setBoard_content(boardVO.getBoard_content().replace("\r\n","<br>"));
        }

        //String tagcheck = boardVO.getBoard_content();
        int tchexsh = 0;
        int tchsh = 0;
        List<Object> chsh = new ArrayList<Object>();
        List<Object> chexsh = new ArrayList<Object>();
        //System.out.println("dd");
        //Scanner scan = new Scanner(System.in);

        //String message = scan.nextLine();
        String message = boardVO.getBoard_content() + " ";
        message = message.replace("\r\n", "<br>");
        //String message = " #����#�ȳ�#�ݰ���#�����ƻ�#���� ## #####��2 #��3#��";
        System.out.println(message);
        message = message + " ";
        for (int i = 0; i < message.length(); i++) {
            if (message.charAt(i) == ' ' || message.charAt(i) == '?' || message.charAt(i) == '!' || message.charAt(i) == '<' || message.charAt(i) == '#' || message.charAt(i) == '.' || message.charAt(i) == ',') {
                chexsh.add(i);
                tchexsh++;

            }
            if (message.charAt(i) == '#') {
                chsh.add(i);
                tchsh++;
            }

        }
        System.out.println("#����:" + tchsh);
        if (tchsh == 0) {

            boardVO.setBoard_content_tag(message);
        } else {


            System.out.println(message);
            System.out.println("Ư��_���� ����:" + tchexsh);
            for (int i = 0; i < chsh.size(); i++) {
                System.out.print(chsh.get(i) + "  ");

            }
            System.out.println("");
            for (int i = 0; i < chexsh.size(); i++) {
                System.out.print(chexsh.get(i) + "  ");
            }

            System.out.println("");

            System.out.println("");
            HashMap<Integer, Integer> rep = new HashMap<Integer, Integer>();

            for (int i = 0; i < chsh.size(); i++) {
                for (int j = 0; j < chexsh.size(); j++) {
                    //0-4
                    //13-15
                    //17-21
                    //26-28
                    if ((int) chsh.get(i) < (int) chexsh.get(j)) {
                        System.out.println("# ��ġ:" + chsh.get(i) + ", ������ �ڸ�:" + chexsh.get(j));
                        rep.put(Integer.parseInt(chsh.get(i).toString()), Integer.parseInt(chexsh.get(j).toString()));

                        break;
                    }//if
                }//for-j
            }//for-i


            TreeMap<Integer, Integer> treeMap = new TreeMap<Integer, Integer>(rep);
            Iterator<Integer> treeMapIter = treeMap.keySet().iterator();

            List<String> tagcheck = new ArrayList<String>();

            while (treeMapIter.hasNext()) {
                boolean tag_result = false;
                boolean spell_check = false;
                int key = treeMapIter.next();
                int value = treeMap.get(key);
                String tag = message.substring(key + 1, value);
                System.out.println(key + ":" + value + "=>" + tag);

                for (int i = 0; i < tagcheck.size(); i++) {
                    if (tagcheck.get(i).equals(tag)) {
                        tag_result = true;
                    }

                    if (!("").equals(tag) && tagcheck.get(i).indexOf(tag) >= 0) {
                        //�մٴ°�..
                        System.out.println("��ġ�°� �ִ�.����...�Ф�");

                    }


                }

                if (tag_result) {
                    System.out.println("������ �ִ�.");
                    rep.remove(key);

                } else {
                    System.out.println("������ ����.");
                    tagcheck.add(tag);
                    System.out.println(tagcheck);
                }


            }

            // System.out.println("------------");
            TreeMap<Integer, Integer> treeMapReverse = new TreeMap<Integer, Integer>(Collections.reverseOrder());
            treeMapReverse.putAll(rep);
            System.out.println("�Ųٷ� ��� �ϱ� ----------");
            Iterator<Integer> treeMapReverseIter = treeMapReverse.keySet().iterator();
            while (treeMapReverseIter.hasNext()) {

                String ch_message;
                int key = treeMapReverseIter.next();
                int value = treeMapReverse.get(key);
                String change = message.substring(key, value);

                String tag = message.substring(key + 1, value);


                System.out.println("�ؽ��±�:" + change);
                System.out.println("�±�:" + tag);

                System.out.println(key + ":" + value);
                if (tag == null || ("").equals(tag)) {


                } else {

                    message = message.replaceAll(change, "<a href='search?s=" + tag + "'>" + change + "</a>");
                    System.out.println("check:" + message);

                }
                boardVO.setBoard_content_tag(message);
                System.out.println("����:" + message);
            }

        }


        // System.out.println(boardVO.getBoard_content());
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("session_id");
        OutputStream out = null;
        if (Bimg != null) {
            try {
                String fname = Bimg.getOriginalFilename();
                byte[] bytes = Bimg.getBytes();
                String path = "resources/upload/" + fname;
                String uploadPath = req.getSession().getServletContext().getRealPath("/" + path);
                File file = new File(uploadPath);
                out = new FileOutputStream(file);
                out.write(bytes);
                boardVO.setBoard_image(path);
            } catch (IOException e) {
                System.out.println(e);
            } finally {
                if (out != null)
                    try {
                        out.close();
                    } catch (IOException e) {
                    }
            }
        }
        System.out.println("--------------���� �κ�");
        System.out.println(boardVO.getBoard_content());
        System.out.println(boardVO.getBoard_content_tag());
        service.insert(boardVO);

        return "redirect:/list";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String imageList(HttpServletRequest req, BoardVO boardVO, Model model) {
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("session_id");
        List<BoardVO> list = service.boardlist(id);
        model.addAttribute("list", list);

        List<UserVO> frlist = myservice.frlist(id);
        model.addAttribute("frlist", frlist);

        // model.addAttribute("boardVO", boardVO);

        return "board/BoardList";

    }

    /*
     * @RequestMapping(value = "/imageShow/{num}", method = { RequestMethod.GET
     * }) public void imageShow(@PathVariable int num, HttpServletResponse
     * response) throws IOException, SerialException, SQLException {
     *
     * BoardVO data = service.getimage(num); System.out.println(response);
     *
     * response.setHeader("Content-Disposition", "inline;filename=\"" +
     * data.getImg_name() + "\""); outputStream = response.getOutputStream();
     * response.setContentType(data.getImg_type()); SerialBlob blob = new
     * SerialBlob(data.getBoard_img()); IOUtils.copy(blob.getBinaryStream(),
     * outputStream);
     *
     * outputStream.flush(); outputStream.close(); }
     */

    @RequestMapping("/delete/board_num={num}")
    public String delete(HttpServletRequest req, @PathVariable int num) {
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("session_id");
        service.delete(num);
        return "redirect:/list";
    }

    @RequestMapping("/detail{num}")
    public String detail(HttpServletRequest req, @PathVariable int num, Model model) {
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("session_id");
        BoardVO data = new BoardVO();
        data = service.detail(num, id);
        model.addAttribute("data", data);
        return "board/BoardDetail";
    }

    @RequestMapping("/reply/{board_num}")

    public String repboard(HttpServletRequest req, @PathVariable("board_num") int num,
                           @RequestParam(required = false) String repid, @RequestParam(required = false) String content) {

        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("session_id");
        if (content == null)
            content = "";
        service.repwrite(num, id, content);
        int replynum = service.selectreplynum(num, id, content);
        System.out.println(replynum);
        actservice.replyact(num, id, replynum);
        return "redirect:/detail{board_num}";
    }

    @RequestMapping("/replylist/{board_num}")
    public String replylist(HttpServletRequest req, @PathVariable("board_num") int num, Model model) {
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("session_id");
        System.out.println("controller;;;;");
        List<ReplyBoardVO> list = service.replist(num);
        model.addAttribute("list", list);
        return "/board/sub/BoardSubList";
    }

    @RequestMapping("/subdelete/{reply_num}&{board_num}")
    public String subdelete(HttpServletRequest req, @PathVariable("reply_num") int num,
                            @PathVariable("board_num") int bnum) {
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("session_id");
        service.subdelete(num);
        System.out.println("��ۻ���");
        System.out.println(num + "&" + bnum);
        actservice.replydelete(num);
        System.out.println("�α׻���1");
        return "redirect:/detail{board_num}";
    }

    @RequestMapping("/modify{board_num}")
    public String modify(HttpServletRequest req, @PathVariable("board_num") int num, Model model) {
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("session_id");
        BoardVO data = service.detail(num, id);
        model.addAttribute("data", data);
        return "board/BoardModify";
    }

    @RequestMapping("/modifyok")
    public String modifyok(HttpServletRequest req, @ModelAttribute("data") BoardVO data) {
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("session_id");

        //String tagcheck = boardVO.getBoard_content();
        int tchexsh = 0;
        int tchsh = 0;
        List<Object> chsh = new ArrayList<Object>();
        List<Object> chexsh = new ArrayList<Object>();
        //System.out.println("dd");
        //Scanner scan = new Scanner(System.in);

        //String message = scan.nextLine();
        String message = data.getBoard_content() + " ";
        //String message = " #����#�ȳ�#�ݰ���#�����ƻ�#���� ## #####��2 #��3#��";
        System.out.println(message);
        message = message + " ";
        for (int i = 0; i < message.length(); i++) {
            if (message.charAt(i) == ' ' || message.charAt(i) == '?' || message.charAt(i) == '!' || message.charAt(i) == '<' || message.charAt(i) == '#' || message.charAt(i) == '.') {
                chexsh.add(i);
                tchexsh++;

            }
            if (message.charAt(i) == '#') {
                chsh.add(i);
                tchsh++;
            }

        }
        System.out.println("#����:" + tchsh);
        System.out.println("Ư��_���� ����:" + tchexsh);
        for (int i = 0; i < chsh.size(); i++) {
            System.out.print(chsh.get(i) + "  ");

        }
        System.out.println("");
        for (int i = 0; i < chexsh.size(); i++) {
            System.out.print(chexsh.get(i) + "  ");
        }

        System.out.println("");

        System.out.println("");
        HashMap<Integer, Integer> rep = new HashMap<Integer, Integer>();

        for (int i = 0; i < chsh.size(); i++) {
            for (int j = 0; j < chexsh.size(); j++) {
                //0-4
                //13-15
                //17-21
                //26-28
                if ((int) chsh.get(i) < (int) chexsh.get(j)) {
                    System.out.println("# ��ġ:" + chsh.get(i) + ", ������ �ڸ�:" + chexsh.get(j));
                    rep.put(Integer.parseInt(chsh.get(i).toString()), Integer.parseInt(chexsh.get(j).toString()));

                    break;
                }//if
            }//for-j
        }//for-i

        TreeMap<Integer, Integer> treeMap = new TreeMap<Integer, Integer>(rep);
        Iterator<Integer> treeMapIter = treeMap.keySet().iterator();

        List<String> tagcheck = new ArrayList<String>();

        while (treeMapIter.hasNext()) {
            boolean tag_result = false;
            boolean spell_check = false;
            int key = treeMapIter.next();
            int value = treeMap.get(key);
            String tag = message.substring(key + 1, value);
            System.out.println(key + ":" + value + "=>" + tag);

            for (int i = 0; i < tagcheck.size(); i++) {
                if (tagcheck.get(i).equals(tag)) {
                    tag_result = true;
                }

                if (!("").equals(tag) && tagcheck.get(i).indexOf(tag) >= 0) {
                    //�մٴ°�..
                    System.out.println("��ġ�°� �ִ�.����...�Ф�");

                }


            }

            if (tag_result) {
                System.out.println("������ �ִ�.");
                rep.remove(key);

            } else {
                System.out.println("������ ����.");
                tagcheck.add(tag);
                System.out.println(tagcheck);
            }


        }
        // System.out.println("------------");
        TreeMap<Integer, Integer> treeMapReverse = new TreeMap<Integer, Integer>(Collections.reverseOrder());
        treeMapReverse.putAll(rep);
        System.out.println("�Ųٷ� ��� �ϱ� ----------");
        Iterator<Integer> treeMapReverseIter = treeMapReverse.keySet().iterator();
        while (treeMapReverseIter.hasNext()) {

            String ch_message;
            int key = treeMapReverseIter.next();
            int value = treeMapReverse.get(key);
            String change = message.substring(key, value);

            String tag = message.substring(key + 1, value);


            System.out.println("�ؽ��±�:" + change);
            System.out.println("�±�:" + tag);

            System.out.println(key + ":" + value);
            if (tag == null || ("").equals(tag)) {


            } else {

                message = message.replaceAll(change, "<a href='search?s=" + tag + "'>" + change + "</a>");
                System.out.println(message);

            }
            System.out.println("���� �޼���?:" + message);
            data.setBoard_content_tag(message);
        }

        System.out.println(message);

        System.out.println("modicont");
        System.out.println(data.getBoard_num());

        service.modify(data);
        return "redirect:/list";
    }

    /*
     * @RequestMapping("like/{board_num}/{id}") public String
     * like(HttpServletRequest req, @PathVariable("board_num") int
     * num, @PathVariable("id") String id) { HttpSession
     * session=req.getSession(); String
     * sid=(String)session.getAttribute("session_id"); service.like(num, id);
     * actservice.likeinsert(id, num); return "redirect:/list"; }
     */

    @RequestMapping("like/{id}/{boardnum}")
    public @ResponseBody
    String addlike(HttpServletRequest req, @PathVariable String id,
                   @PathVariable(name = "boardnum") int num, Model model) {
        HttpSession session = req.getSession();
        String sid = (String) session.getAttribute("session_id");

        Map<String, Object> result = new HashMap<String, Object>();
        result = service.like(num, id);
        String check = result.get("check").toString();
        System.out.println(check);
        if (check.equals("0")) {
            System.out.println(id + ";;" + num);
            actservice.likeact(id, num);
        } else {
            System.out.println(id + "ggg" + num);
            actservice.likelogdelete(id, num);
        }
        String allcount = result.get("allcount").toString();
        String r = check + "," + allcount;

        return r;
    }

    @RequestMapping("/simsimi")
    public String Simsimi(HttpServletRequest req, @RequestParam String messages, Model model) {

        HttpSession session = req.getSession();
        String sid = (String) session.getAttribute("session_id");

        System.out.println("simsimiController");
        System.out.println(messages);

        RequestParam1 requestParam = new RequestParam1();
        SimsimiAPI simsimiAPI = new SimsimiAPI();
        requestParam.setText(messages);
        requestParam.setLc("ko");

        // A response for requesting information. Response consists of JSON
        // format.
        String result = simsimiAPI.request(requestParam);

        // Exception handling
        if (result == null) {
            System.out.println("Exception is generated.");
            result = "�ùٸ��� �Է����ּ���!";
            //model.addAttribute("response",response);
            System.out.println(result);
        } else {
            System.out.println(result);
            //model.addAttribute("response",response);
        }
        System.out.println("result:" + result);
        model.addAttribute("result", result);
        return "chatting/simsimi/simsimi";
    }

}