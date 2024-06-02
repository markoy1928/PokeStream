public class Trainer {
    private String name;
    private int money;
    private int seen;
    private int own;
    private boolean[] badges;
    private Pokemon[] party;

    public Trainer(String name, int money, int seen, int own, boolean[] badges, Pokemon[] party) {
        this.name = name;
        this.money = money;
        this.seen = seen;
        this.own = own;
        this.badges = badges;
        this.party = party;
    }

    public String getName() {
        return name;
    }

    public int getMoney() {
        return money;
    }

    public int getSeen() {
        return seen;
    }

    public int getOwn() {
        return own;
    }

    public boolean[] getBadges() {
        return badges;
    }

    public Pokemon[] getParty() {
        return party;
    }
}
