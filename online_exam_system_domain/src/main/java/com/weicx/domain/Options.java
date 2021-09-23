package com.weicx.domain;/**
 * @author weicx
 * @create 2021-09-13 17:23
 */

/**
 * @ClassName Options
 * @Description 试题中的选项
 * @Author weicx
 * @date 17:23
 * @Version 1.0
 */
public class Options {
    private String qid	 ; //varcha  r(50)	No
    private String option	   ; //varchar(5000)	No
    private String optionid	   ; //varchar(13)	No
    private Integer is_img	   ; //tinyint(1)	No			该选项是否展示为图片
    private Integer img_width	   ; //int(10)	No			图片宽度
    private Integer img_height   ; //	int(10)	No			图片高度

    public String getQid() {
        return qid;
    }

    public void setQid(String qid) {
        this.qid = qid;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public String getOptionid() {
        return optionid;
    }

    public void setOptionid(String optionid) {
        this.optionid = optionid;
    }

    public Integer getIs_img() {
        return is_img;
    }

    public void setIs_img(Integer is_img) {
        this.is_img = is_img;
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
