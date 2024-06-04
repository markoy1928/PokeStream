import java.awt.Color;
import java.io.FileReader;
import java.util.Iterator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class PokeStream {
    private static Trainer player;
    private static Color backgroundColor;
    private static Game game;
    private final static boolean resetDB = false;

    public static void main(String[] args) {
        if (resetDB) {
            resetDatabase();
            System.out.println("Database Reset!");
        }
        else {
            readConfig();
            readData();

            PartyPanel partyPanel = new PartyPanel();
            BadgesPanel badgePanel = new BadgesPanel();

            new Thread(new Runnable() {
                public void run() {
                    partyPanel.createPartyGUI(player.getParty(), backgroundColor);
                    badgePanel.createBadgeGUI(game, player.getBadges(), backgroundColor);

                    while (true) {
                        try {
                            Thread.sleep(1000);
                        } catch (InterruptedException e) {
                            System.err.println(e.getMessage());
                            System.err.println(e.getStackTrace()[0].getLineNumber());
                            System.err.println(e.getStackTrace()[0].getFileName());
                        }

                        readData();
                        partyPanel.refreshPanel(player.getParty());
                        badgePanel.refreshPanel(player.getBadges());
                    }
                }
            }).start();
        }
    }

    public static void readConfig() {
        try {
            FileReader configReader = new FileReader("config.json");
            JSONParser parser = new JSONParser();
            JSONObject jsonObject = (JSONObject)parser.parse(configReader);

            backgroundColor = Color.decode((String)jsonObject.get("Background Color"));
        }
        catch (Exception e) {
            System.err.println("ERROR: " + e.getMessage());
            System.err.println(e.getStackTrace()[0].getLineNumber());
            System.err.println(e.getStackTrace()[0].getFileName());
        }
    }

    public static void resetDatabase() {
        PokeDB db = new PokeDB();
        db.resetDatabase();
    }

    public static void readData() {
        try {
            FileReader gameData = new FileReader("game_data.json");
            JSONParser parser = new JSONParser();
            JSONObject jsonObject = (JSONObject)parser.parse(gameData);

            String name = null;
            int money = ((Long)jsonObject.get("money")).intValue();
            int seen = ((Long)jsonObject.get("seen")).intValue();
            int own = ((Long)jsonObject.get("own")).intValue();
            game = Game.getGame((String)jsonObject.get("game"));

            // Read the badge data
            boolean[] badges = readBadges(jsonObject);

            // Read the Pokemon data
            Pokemon[] party = readParty(jsonObject);

            player = new Trainer(name, money, seen, own, badges, party);
        }
        catch (Exception e) {
            System.err.println("ERROR: " + e.getMessage());
            System.err.println(e.getStackTrace()[0].getLineNumber());
            System.err.println(e.getStackTrace()[0].getFileName());
        }
    }

    // Read the badge data
    @SuppressWarnings("rawtypes")
    private static boolean[] readBadges(JSONObject jsonObject) {
        boolean[] badges = new boolean[16];

        JSONArray b = (JSONArray)jsonObject.get("badges");
        Iterator it = b.iterator();
        int i = 0;

        while (it.hasNext()) {
            badges[i] = (boolean)it.next();
            ++i;
        }

        return badges;
    }

    // Read the Pokemon data
    @SuppressWarnings("rawtypes")
    private static Pokemon[] readParty(JSONObject jsonObject) {
        Pokemon[] party = new Pokemon[6];

        JSONArray p = (JSONArray)jsonObject.get("party");
        Iterator it = p.iterator();
        int i = 0;

        while (it.hasNext()) {
            JSONObject pkObject = (JSONObject)it.next();
            party[i] = readPokemon(pkObject);
            ++i;
        }

        return party;
    }

    private static Pokemon readPokemon(JSONObject pkObject) {
        int pid = ((Long)pkObject.get("pid")).intValue();
        int dex = ((Long)pkObject.get("dex")).intValue();
        String nickname = (String)pkObject.get("nickname");
        int gender = ((Long)pkObject.get("gender")).intValue();
        int form = ((Long)pkObject.get("form")).intValue();
        int hp = ((Long)pkObject.get("hp")).intValue();
        int maxHP = ((Long)pkObject.get("maxHP")).intValue();
        int level = ((Long)pkObject.get("level")).intValue();
        int status = ((Long)pkObject.get("status")).intValue();
        int item = ((Long)pkObject.get("item")).intValue();
        boolean egg = (boolean)pkObject.get("egg");
        Move[] moves = readMoves(pkObject);

        Pokemon pk = new Pokemon(pid, dex, nickname, gender, form, hp, maxHP, level, status, item, egg, moves);

        return pk;
    }

    @SuppressWarnings("rawtypes")
    private static Move[] readMoves(JSONObject pkObject) {
        Move[] moves = new Move[4];

        JSONArray m = (JSONArray)pkObject.get("moves");
        Iterator it = m.iterator();
        int i = 0;

        while (it.hasNext()) {
            JSONObject mvObject = (JSONObject)it.next();
            moves[i] = readMove(mvObject);
            ++i;
        }

        return moves;
    }

    private static Move readMove(JSONObject mvObject) {
        int moveNo = ((Long)mvObject.get("move")).intValue();
        int pp = ((Long)mvObject.get("pp")).intValue();
        int maxPP = ((Long)mvObject.get("maxPP")).intValue();

        Move move = new Move(moveNo, pp, maxPP);

        return move;
    }
}
