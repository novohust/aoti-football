package org.hustsse.football.enums;

import org.hustsse.football.utils.ResourceBundleUtil;

public enum PeriodEnum {
	Morning,Afternoon;

    private static ResourceBundleUtil util = new ResourceBundleUtil(PeriodEnum.class.getName());

    public String getDescription() {
        return util.getProperty(this.toString());
    }
}
