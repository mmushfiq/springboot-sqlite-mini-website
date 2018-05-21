
package az.mm.developerjobs.model;

/**
 *
 * @author MM <mushfiqazeri@gmail.com>
 */
public class Pagination {
    private int count;
    private int begin;
    private int end;
    private int prev;
    private int next;

    public Pagination() {
    }

    public Pagination(int count, int begin, int end, int prev, int next) {
        this.count = count;
        this.begin = begin;
        this.end = end;
        this.prev = prev;
        this.next = next;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getBegin() {
        return begin;
    }

    public void setBegin(int begin) {
        this.begin = begin;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public int getPrev() {
        return prev;
    }

    public void setPrev(int prev) {
        this.prev = prev;
    }

    public int getNext() {
        return next;
    }

    public void setNext(int next) {
        this.next = next;
    }
    
}
