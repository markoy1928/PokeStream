public enum Game {
    RBY,
    GSC,
    RSE,
    FRLG,
    DPPT,
    HGSS,
    BW,
    B2W2,
    XY,
    ORAS,
    SM,
    USUM,
    SWSH,
    BDSP,
    SV;

    public static Game getGame(String gameName) {
        switch (gameName) {
            case "RBY":
                return RBY;

            case "GSC":
                return GSC;

            case "RSE":
                return RSE;

            case "FRLG":
                return FRLG;

            case "DPPT":
                return DPPT;

            case "HGSS":
                return HGSS;

            case "BW":
                return BW;

            case "B2W2":
                return B2W2;
        
            case "XY":
                return XY;

            case "ORAS":
                return ORAS;

            case "SM":
                return SM;

            case "USUM":
                return USUM;

            case "SWSH":
                return SWSH;

            case "BDSP":
                return BDSP;

            case "SV":
                return SV;
            
            default:
                return null;
        }
    }

    public String getRegion() {
        switch (this) {
            case RBY:
                return "Kanto";
                
            case GSC:
                return "Johto";

            case RSE:
                return "Hoenn";

            case FRLG:
                return "Kanto";

            case DPPT:
                return "Sinnoh";

            case HGSS:
                return "Johto";

            case BW:
                return "Unova";

            case B2W2:
                return "Unova-2";

            case XY:
                return "Kalos";

            case ORAS:
                return "Hoenn";

            case SM:
                return "Alola";

            case USUM:
                return "Alola";

            case SWSH:
                return "Galar";

            case BDSP:
                return "Sinnoh";

            case SV:
                return "Paldea";
        
            default:
                return null;
        }
    }
}
