package store;

public class MysqlHandlerException extends Exception {

    public MysqlHandlerException(String s) {
        super(s);
    }

    public MysqlHandlerException(String s, Exception e) {
        super(s, e);
    }
}
