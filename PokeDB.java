import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
import java.util.Vector;

public class PokeDB {
    private String dbPath = "jdbc:sqlite:database/pokemon.db";

    // Connect to the database
    public PokeDB() {
        try {
            Class.forName("org.sqlite.JDBC");
        }
        catch (ClassNotFoundException e) {
            System.err.println(e.getMessage());
            System.err.println(e.getStackTrace()[0].getLineNumber());
            System.err.println(e.getStackTrace()[0].getFileName());
        }
    }

    public void resetDatabase() {
        dropAllTables();
        createAllTables();
        insertTableData();
    }

    private void dropAllTables() {
        dropPokemonTable();
        dropMoveTable();
        dropGymTable();
        dropItemsTable();
    }

    private void createAllTables() {
        createPokemonTable();
        createMoveTable();
        createGymTable();
        createItemsTable();
    }

    private void insertTableData() {
        insertPokemonData();
        insertMoveData();
        insertGymData();
        insertItemsData();
    }

    private void insertData(String filePath) {
        try {
            File f = new File(filePath);
            Scanner fileReader = new Scanner(f);

            Connection con = DriverManager.getConnection(dbPath);
            Statement stmt = con.createStatement();

            while (fileReader.hasNextLine()) {
                stmt.executeUpdate(fileReader.nextLine());
            }

            fileReader.close();
        }
        catch (Exception e) {
            System.err.println("ERROR: " + e.getMessage());
            System.err.println(e.getStackTrace()[0].getLineNumber());
            System.err.println(e.getStackTrace()[0].getFileName());
        }
    }

    private void insertPokemonData() {
        insertData("SQL/insert_pokemon.sql");
    }

    private void insertMoveData() {
        insertData("SQL/insert_moves.sql");
    }

    private void insertGymData() {
        insertData("SQL/insert_gyms.sql");
    }

    private void insertItemsData() {
        insertData("SQL/insert_items.sql");
    }

    private void dropTable(String tableName) {
        try {
            Connection con = DriverManager.getConnection(dbPath);
            Statement stmt = con.createStatement();
            stmt.executeUpdate("drop table " + tableName);
        }
        catch (SQLException e) {
            System.err.println("ERROR: " + e.getMessage());
            System.err.println(e.getStackTrace()[0].getLineNumber());
            System.err.println(e.getStackTrace()[0].getFileName());
        }
    }

    private void dropPokemonTable() {
        dropTable("Pokemon");
    }

    private void dropMoveTable() {
        dropTable("Moves");
    }

    private void dropGymTable() {
        dropTable("Gyms");
    }

    private void dropItemsTable() {
        dropTable("Items");
    }

    private void createTable(String tableName, String... createParameters) {
        try {
            Connection con = DriverManager.getConnection(dbPath);
            Statement stmt = con.createStatement();
            String createStatement = "create table " + tableName + " (";

            for (int i = 0; i < createParameters.length; ++i) {
                if (i > 0) {
                    createStatement += ", ";
                }

                createStatement += createParameters[i];
            }
            createStatement += ")";
            stmt.executeUpdate(createStatement);
        }
        catch (SQLException e) {
            System.err.println("ERROR: " + e.getMessage());
            System.err.println(e.getStackTrace()[0].getLineNumber());
            System.err.println(e.getStackTrace()[0].getFileName());
        }
    }

    private void createPokemonTable() {
        createTable("Pokemon", "dex int not null", "species text not null", "form text", "primary key (dex, form)");
    }

    private void createMoveTable() {
        createTable("Moves", "move_number int primary key", "move text not null");
    }

    private void createGymTable() {
        createTable("Gyms","region text not null", "gym_number int not null", "badge_name text not null", "primary key (region, gym_number)");
    }

    private void createItemsTable() {
        createTable("Items", "item_number int primary key", "name text not null");
    }

    public Vector<String> select(String tableName, String columnName, String whereClause) {
        Vector<String> q = new Vector<String>();

        try {
            Connection con = DriverManager.getConnection(dbPath);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(String.format("select %s from %s where %s", columnName, tableName, whereClause));

            while (rs.next()) {
                q.add(rs.getString(1));
            }
        }
        catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
            System.err.println(e.getStackTrace()[0].getLineNumber());
            System.err.println(e.getStackTrace()[0].getFileName());
            return null;
        }

        return q;
    }
}
