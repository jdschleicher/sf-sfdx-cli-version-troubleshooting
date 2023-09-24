/**
 * @description       : 
 * @author            : jonathon.schleicher@b3groupinc.com
 * @group             : 
 * @last modified on  : 03-22-2021
 * @last modified by  : jonathon.schleicher@b3groupinc.com
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   03-19-2021   jonathon.schleicher@b3groupinc.com   Initial Version
**/
public with sharing class SimpleTestController {
    
    public Integer addDigits(Integer firstInteger, Integer secondInteger) {
        return (firstInteger + secondInteger);
    }

    public Integer subtractDigits(Integer firstInteger, Integer secondInteger) {
        return (firstInteger - secondInteger);
    }

}