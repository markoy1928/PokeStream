import java.util.Vector;

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
        Vector<String> items = db.select("Items", "name", "item_number = " + index);

        if (!items.isEmpty()) {
            name = items.get(0);
        }
        else {
            name = null;
        }
    }

    public String getName() {
        return name;
    }

    public String getFilePath() {
        String path = null;
        
        if (exists()) {
            path = "Items/" + getName().toLowerCase();

            path = path.replace(" ", "_");
            path += ".png";
        }

        return path;
    }

    public boolean exists() {
        if (index == 0) {
            return false;
        }
        else {
            return true;
        }
    }
}
