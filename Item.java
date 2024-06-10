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

    public int getIndex() {
        return index;
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

    @Override
    public boolean equals(Object other) {
        // Make sure neither is null
        if (this == null || other == null) {
            return false;
        }

        // Make sure other is an Item
        if (!(other instanceof Item)) {
            return false;
        }

        // Call it an Item
        Item otherIt = (Item)other;

        return this.index == otherIt.getIndex();
    }
}
