public class Item {
    private int index;
    private String name;

    public Item() {}

    public Item(int index) {
        this.index = index;
        setName(index);
    }

    public void setIndex(int index) {
        this.index = index;
        setName(index);
    }

    private void setName(int index) {
        
    }

    public String getName() {
        return name;
    }
}
