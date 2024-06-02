public class Item {
    private int index;
    private String name;

    public Item() {}

    public Item(int index) {
        this.index = index;
        setName();
    }

    public void setIndex(int index) {
        this.index = index;
        setName();
    }

    private void setName() {
        PokeDB db = new PokeDB();
        db.select("Items", "name", "item_number = " + index);
    }

    public String getName() {
        return name;
    }

    public String getFilePath() {
        String path = "Items/" + getName();

        path.replaceAll(" ", "_");
        path += ".png";

        return path;
    }
}
