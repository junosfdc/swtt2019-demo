public with sharing class MyCalendarUtil {
    
    private DateTime dt;
    
    public MyCalendarUtil(DateTime dt) {
        this.dt = dt;
    }

    public String getTimeClassification() {
        String retVal = '';
        //夜
        if (dt.hour() < 6) {
            retVal = 'Night';
        }
        //朝
        else if (dt.hour() < 10) {
            retVal = 'Morning';
        }
        //昼
        else if (dt.hour() < 18) {
            retVal = 'Afternoon';
        }
        //夜
        else if (dt.hour() < 24) {
            retVal = 'Night';
        }
        return retVal;
    }

    public String getWarekiDate() {
        String retVal = '';

        if (dt.year() < 2019) {
            retVal += '平成' + (dt.year()-1988);
        }
        else {
            if (dt.year() == 2019 && dt.month() < 5) {
                retVal += '平成31年';
            }
            else {
                retVal += '令和';
                if (dt.year() == 2019) {
                    retVal += '元年';
                }
                else {
                    retVal += dt.year()-2018 + '年';
                }
            }
        }

        retVal += ' ' + dt.month() + '月' + dt.day() + '日';

        String week = dt.format('EEE');

        if (week == 'Sun') {
            retVal += ' (日)';
        }
        else if (week == 'Mon') {
            retVal += ' (月)';
        }
        else if (week == 'Tue') {
            retVal += ' (火)';
        }
        else if (week == 'Wed') {
            retVal += ' (水)';
        }
        else if (week == 'Thu') {
            retVal += ' (木)';
        }
        else if (week == 'Fri') {
            retVal += ' (金)';
        }
        else if (week == 'Sat') {
            retVal += ' (土)';
        }
        
        return retVal;
    }

}
