package com.weicx.domain;/**
 * @author weicx
 * @create 2021-09-27 14:32
 */

import net.sf.jsqlparser.statement.drop.Drop;

/**
 * @ClassName Question_img
 * @Description TODO
 * @Author weicx
 * @date 14:32
 * @Version 1.0
 */
public class Question_img {
    private String 	qid;	             //	试题唯一性ID
	private String 	image;	            //		图片路径
	private Integer 	img_width;	   //	图片宽度
	private Integer 	img_height ;  //	图片高度

    public String getQid() {
        return qid;
    }

    public void setQid(String qid) {
        this.qid = qid;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getImg_width() {
        return img_width;
    }

    public void setImg_width(Integer img_width) {
        this.img_width = img_width;
    }

    public Integer getImg_height() {
        return img_height;
    }

    public void setImg_height(Integer img_height) {
        this.img_height = img_height;
    }
}
