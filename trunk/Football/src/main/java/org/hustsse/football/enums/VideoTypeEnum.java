package org.hustsse.football.enums;

import org.hustsse.football.utils.ResourceBundleUtil;


public enum VideoTypeEnum {
	Shoot,Pass,Goal,PassMiddle,Faul,Lose,Card,OffSide,FreeShot;
	private static ResourceBundleUtil util = new ResourceBundleUtil(VideoTypeEnum.class.getName());

    public String getDescription() {
        return util.getProperty(this.toString());
    }
}
