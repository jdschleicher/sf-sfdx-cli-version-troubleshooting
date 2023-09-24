/**
 * @description       : 
 * @author            : jonathon.schleicher@b3groupinc.com
 * @group             : 
 * @last modified on  : 07-15-2021
 * @last modified by  : jonathon.schleicher@b3groupinc.com
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   03-19-2021   jonathon.schleicher@b3groupinc.com   Initial Version
**/
@IsTest
private class SimpleTestControllerTest {

    @IsTest
    static void addDigits_givenTwoIntegers_ReturnsExpectedAddition() {
    
        Integer firstInteger = 1;
        Integer secondInteger = 3;
        
        Integer expectedInteger = 4;
        
        Test.startTest();
            SimpleTestController simpleController = new SimpleTestController();
            Integer actualResult = simpleController.addDigits(firstInteger, secondInteger);
        Test.stopTest();

        System.assertEquals(expectedInteger, actualResult, 'Integer values for expected and actual do not match ok');
        // UNCOMMENT BELOW TO FAIL UNIT TEST:
        // System.assertNotEquals(expectedInteger, actualResult, 'expected failure triggered in addDigits test');

    }

    @IsTest
    static void subtractDigits_givenTwoIntegers_ReturnsExpectedAddition() {
    
        Integer firstInteger = 3;
        Integer secondInteger = 2;
        
        Integer expectedInteger = 1;
        
        Test.startTest();
            SimpleTestController simpleController = new SimpleTestController();
            Integer actualResult = simpleController.subtractDigits(firstInteger, secondInteger);
        Test.stopTest();

        System.assertEquals(expectedInteger, actualResult, 'Integer values for expected and actual do not match');
        // UNCOMMENT BELOW TO FAIL UNIT TEST:
        // System.assertNotEquals(expectedInteger, actualResult, 'expected failure triggered in subtractDigits test');

    
    }
}