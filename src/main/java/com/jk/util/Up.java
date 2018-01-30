package com.jk.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Up {

    public static String upImag1(MultipartFile artImg,HttpServletRequest req) throws IOException{
        //获取文件名
        String fileName=artImg.getOriginalFilename();
        //时间戳
        SimpleDateFormat  sdf=new  SimpleDateFormat("yyyyMMddHHmmss");
        String onlyFileName = sdf.format(new Date())+fileName.substring(fileName.lastIndexOf('.'));
        String folderPath=req.getSession().getServletContext().getRealPath("/")
                +"upimg/";
        //是否存在
        File file=new File(folderPath);
        if(!file.exists()){
            file.mkdir();
        }
        FileOutputStream fos = new FileOutputStream(folderPath+onlyFileName);
        System.out.println(folderPath+onlyFileName);
        fos.write(artImg.getBytes());
        fos.flush();
        fos.close();
        System.out.println(onlyFileName);
        //返回
        return onlyFileName;
    }
    public static String upfile(MultipartFile upfile,HttpServletRequest req)throws IOException{
        //获取文件名
        String fileName=upfile.getOriginalFilename();
        //时间戳
        SimpleDateFormat  sdf=new  SimpleDateFormat("yyyyMMddHHmmss");
        String onlyFileName = sdf.format(new Date())+fileName.substring(fileName.lastIndexOf('.'));
        String folderPath=req.getSession().getServletContext().getRealPath("/")
                +"upfile/";
        //是否存在
        File file=new File(folderPath);
        if(!file.exists()){
            file.mkdir();
        }
        FileOutputStream fos = new FileOutputStream(folderPath+onlyFileName);
        System.out.println(folderPath+onlyFileName);
        fos.write(upfile.getBytes());
        fos.flush();
        fos.close();
        System.out.println(onlyFileName);
        //返回
        return onlyFileName;
    }

}
