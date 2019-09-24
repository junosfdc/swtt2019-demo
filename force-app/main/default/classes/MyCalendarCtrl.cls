public with sharing class MyCalendarCtrl {
    
    public MyCalendarCtrl() {
    }

    @AuraEnabled(cacheable=true)
    public static Map<String, String> getWelcomeMessage() {
        DateTime dt = DateTime.now();

        MyCalendarCtrl ctrl = new MyCalendarCtrl();
        
        Map<String, String> m = new Map<String, String>();
        m.put('greetingMessage', ctrl.getGreetingMessage(dt));
        m.put('warekiDate', ctrl.getWarekiDate(dt));

        return m;
    }
    
    public String getGreetingMessage(DateTime dt) {
        String retVal = '';

        MyCalendarUtil util = new MyCalendarUtil(dt);
        if (util.getTimeClassification() == 'Morning') {
            retVal = 'おはようございます！';
        }
        else if (util.getTimeClassification() == 'Afternoon') {
            retVal = 'こんにちわ！';
        }
        else if (util.getTimeClassification() == 'Night') {
            retVal = 'こんばんわ！明日はSWTTです。';
        }
        return retVal;
    }

    public String getWarekiDate(DateTime dt) {
        String retVal = '';
        
        MyCalendarUtil util = new MyCalendarUtil(dt);
        retVal = '本日は、' + util.getWarekiDate() + 'です。';

        return retVal;
    }

}
