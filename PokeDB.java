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
    }

    private void createAllTables() {
        createPokemonTable();
        createMoveTable();
        createGymTable();
    }

    private void insertTableData() {
        insertPokemonData();
        insertMoveData();
        insertGymData();
    }

    private void insertPokemonData() {
        try {
            File f = new File("SQL/insert_pokemon.sql");
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

    private void insertMoveData() {

    }

    private void insertGymData() {
        try {
            File f = new File("SQL/insert_gyms.sql");
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

    private void dropPokemonTable() {
        try {
            Connection con = DriverManager.getConnection(dbPath);
            Statement stmt = con.createStatement();
            stmt.executeUpdate("drop table pokemon");
        }
        catch (SQLException e) {
            System.err.println("ERROR: " + e.getMessage());
            System.err.println(e.getStackTrace()[0].getLineNumber());
            System.err.println(e.getStackTrace()[0].getFileName());
        }
    }

    private void dropMoveTable() {
        try {
            Connection con = DriverManager.getConnection(dbPath);
            Statement stmt = con.createStatement();
            stmt.executeUpdate("drop table moves");
        }
        catch (SQLException e) {
            System.err.println("ERROR: " + e.getMessage());
            System.err.println(e.getStackTrace()[0].getLineNumber());
            System.err.println(e.getStackTrace()[0].getFileName());
        }
    }

    private void dropGymTable() {
        try {
            Connection con = DriverManager.getConnection(dbPath);
            Statement stmt = con.createStatement();
            stmt.executeUpdate("drop table gyms");
        }
        catch (SQLException e) {
            System.err.println("ERROR: " + e.getMessage());
            System.err.println(e.getStackTrace()[0].getLineNumber());
            System.err.println(e.getStackTrace()[0].getFileName());
        }
    }

    private void createPokemonTable() {
        try {
            Connection con = DriverManager.getConnection(dbPath);
            Statement stmt = con.createStatement();
            stmt.executeUpdate("create table pokemon (dex int not null, species text not null, form text, primary key (dex, form))");
        }
        catch (SQLException e) {
            System.err.println("ERROR: " + e.getMessage());
            System.err.println(e.getStackTrace()[0].getLineNumber());
            System.err.println(e.getStackTrace()[0].getFileName());
        }
    }

    private void createMoveTable() {
        try {
            Connection con = DriverManager.getConnection(dbPath);
            Statement stmt = con.createStatement();
            stmt.executeUpdate("create table moves (move_number int primary key, move text not null)");
        }
        catch (SQLException e) {
            System.err.println("ERROR: " + e.getMessage());
            System.err.println(e.getStackTrace()[0].getLineNumber());
            System.err.println(e.getStackTrace()[0].getFileName());
        }
    }

    private void createGymTable() {
        try {
            Connection con = DriverManager.getConnection(dbPath);
            Statement stmt = con.createStatement();
            stmt.executeUpdate("create table gyms (region text not null, gym_number int not null, badge_name text not null, primary key (region, gym_number))");
        }
        catch (SQLException e) {
            System.err.println("ERROR: " + e.getMessage());
            System.err.println(e.getStackTrace()[0].getLineNumber());
            System.err.println(e.getStackTrace()[0].getFileName());
        }
    }

    public Vector<String> selectQuery(String query) {
        Vector<String> q = new Vector<String>();

        try {
            Connection con = DriverManager.getConnection(dbPath);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);

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
