import java.util.Vector;

public class Move {
    private int moveNo;
    private String move;
    private int pp;
    private int maxPP;

    public Move(int number, int pp, int maxPP) {
        this.moveNo = number;
        this.pp = pp;
        this.maxPP = maxPP;

        // Query database for move name
        this.move = getMoveName();
    }

    public String getMoveName() {
        if (move == null) {
            // Query database for move name
            PokeDB db = new PokeDB();

            Vector<String> moves = db.selectQuery(String.format("select move from moves where move_number = %d", moveNo));
            
            if (moves.isEmpty()) {
                return null;
            }
            else {
                return moves.get(0);
            }
        }
        else {
            return move;
        }
    }

    // Determine if 2 moves are equal
    @Override
    public boolean equals(Object other) {
        // Make sure neither is null
        if (this == null || other == null) {
            return false;
        }

        // Make sure other is a Move
        if (!(other instanceof Move)) {
            return false;
        }

        // Call other a move
        Move otherMV = (Move)other;

        // Make sure move names are not null
        boolean moveNameEQ;
        if (this.move == null && otherMV.getMoveName() == null) {
            moveNameEQ = true;
        }
        else if (this.move == null || otherMV.getMoveName() == null) {
            moveNameEQ = false;
        }
        else {
            moveNameEQ = this.move.equals(otherMV.getMoveName());
        }

        boolean moveEQ = this.moveNo == otherMV.getMoveID();
        boolean movePPEQ = this.pp == otherMV.getMovePP();
        boolean maxPPEQ = this.maxPP == otherMV.getMoveMaxPP();

        return moveNameEQ && moveEQ && movePPEQ && maxPPEQ;
    }

    public int getMovePP() {
        return pp;
    }

    public int getMoveMaxPP() {
        return maxPP;
    }

    public int getMoveID() {
        return moveNo;
    }
}
