@isTest
private class MyCalendarUtil_Test {
    
    @isTest
    static void myTest_getTimeClassification() {
        Test.startTest();

        //0:00 - 5:59
        System.assertEquals('Night', (new MyCalendarUtil(DateTime.newInstance(2019, 1, 1, 0, 0, 0))).getTimeClassification());
        System.assertEquals('Night', (new MyCalendarUtil(DateTime.newInstance(2019, 1, 1, 5, 59, 0))).getTimeClassification());
        //6:00 - 9:59
        System.assertEquals('Morning', (new MyCalendarUtil(DateTime.newInstance(2019, 1, 1, 6, 0, 0))).getTimeClassification());
        System.assertEquals('Morning', (new MyCalendarUtil(DateTime.newInstance(2019, 1, 1, 9, 59, 0))).getTimeClassification());
        //10:00 - 17:59
        System.assertEquals('Afternoon', (new MyCalendarUtil(DateTime.newInstance(2019, 1, 1, 10, 0, 0))).getTimeClassification());
        System.assertEquals('Afternoon', (new MyCalendarUtil(DateTime.newInstance(2019, 1, 1, 17, 59, 0))).getTimeClassification());
        //18:00 - 23:59
        System.assertEquals('Night', (new MyCalendarUtil(DateTime.newInstance(2019, 1, 1, 18, 0, 0))).getTimeClassification());
        System.assertEquals('Night', (new MyCalendarUtil(DateTime.newInstance(2019, 1, 1, 23, 59, 0))).getTimeClassification());

        Test.stopTest();
    }

    @isTest
    static void myTest_getWarekiDate() {
        Test.startTest();

        //2019.4.30
        System.assertEquals('平成31年 4月30日 (火)', (new MyCalendarUtil(DateTime.newInstance(2019, 4, 30, 0, 0, 0))).getWarekiDate());
        //2019.5.1
        System.assertEquals('令和元年 5月1日 (水)', (new MyCalendarUtil(DateTime.newInstance(2019, 5, 1, 0, 0, 0))).getWarekiDate());
        //2020.5.1
        System.assertEquals('令和2年 5月1日 (金)', (new MyCalendarUtil(DateTime.newInstance(2020, 5, 1, 0, 0, 0))).getWarekiDate());
        
        Test.stopTest();
    }
}
