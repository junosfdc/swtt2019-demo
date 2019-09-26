@isTest
public class MyCalendarCtrl_Test {
    
    @isTest
    static void testMethod01() {
        Test.startTest();

        MyCalendarCtrl ctrl = new MyCalendarCtrl();
        
        DateTime dt = DateTime.newInstance(2019, 9, 24, 9, 0, 0);

        System.assertEquals('おはようございます！', ctrl.getGreetingMessage(dt));
        //System.assertEquals('おはようございます！SWTTにようこそ！', ctrl.getGreetingMessage(dt));

        Test.stopTest();
    }

    @isTest
    static void testMethod02() {
        Test.startTest();

        MyCalendarCtrl ctrl = new MyCalendarCtrl();
        
        DateTime dt = DateTime.newInstance(2019, 9, 24, 12, 0, 0);

        System.assertEquals('こんにちわ！', ctrl.getGreetingMessage(dt));
        //System.assertEquals('こんにちわ！SWTTにようこそ！', ctrl.getGreetingMessage(dt));

        Test.stopTest();
    }

    @isTest
    static void testMethod03() {
        Test.startTest();

        MyCalendarCtrl ctrl = new MyCalendarCtrl();
        
        DateTime dt = DateTime.newInstance(2019, 9, 24, 19, 0, 0);

        System.assertEquals('こんばんわ！', ctrl.getGreetingMessage(dt));

        Test.stopTest();
    }

}
