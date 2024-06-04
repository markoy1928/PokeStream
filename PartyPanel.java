import javax.swing.JPanel;
import javax.swing.OverlayLayout;
import javax.swing.SwingConstants;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JLayeredPane;
import javax.swing.Icon;
import javax.swing.ImageIcon;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;

public class PartyPanel extends JPanel {
    private static final int DIM_WIDTH = 1000;
    private static final int DIM_HEIGHT = 325;
    private JFrame frame;
    private PokePanel[] pokePanels;
    private Color backgroundColor;

    public void createPartyGUI(Pokemon[] party, Color bgColor) {
        frame = new JFrame("Pokemon Party");
        ImageIcon frameIcon = new ImageIcon("Pokemon/Dragapult.png");
        frame.setIconImage(frameIcon.getImage());
        pokePanels = new PokePanel[6];
        this.backgroundColor = bgColor;
        
        // Add each party pokemon to the panel
        for (int i = 0; i < 6; ++i) {
            pokePanels[i] = new PokePanel(party[i], backgroundColor);
            this.add(pokePanels[i], i);
        }

        frame.add(this);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }

    public void refreshPanel(Pokemon[] party) {
        frame.getContentPane().removeAll();

        for (int i = 0; i < 6; ++i) {
            if (!party[i].equals(pokePanels[i].getPokemon())) {
                this.remove(i);
                pokePanels[i] = new PokePanel(party[i], backgroundColor);
                this.add(pokePanels[i], i);
            }
        }

        frame.add(this);
        this.revalidate();
        this.repaint();
    }

    public Dimension getPreferredSize() {
        return new Dimension(DIM_WIDTH, DIM_HEIGHT);
    }

    @Override
    protected void paintComponent(Graphics g) {
        setBackground(backgroundColor);
        super.paintComponent(g);
    }

    private class PokePanel extends JLayeredPane {
        private static final int DIM_WIDTH = 150;
        private static final int DIM_HEIGHT = 350;
        private Pokemon pokemon;
        private JPanel pokemonGif;
        private JPanel pokemonName;
        private JPanel pokemonItem;
        private JPanel statusBar;
        private JPanel pokemonHealth;
        private Color backgroundColor;

        public PokePanel(Pokemon pk, Color bgColor) {
            pokemon = pk;
            this.setLayout(new OverlayLayout(this));
            this.backgroundColor = bgColor;
            
            try {
                // Get gif for pokemon
                File f = new File(pokemon.getFilePath());
                URL imgUrl = f.toURI().toURL();
                Icon icon = new ImageIcon(imgUrl);

                // Change the size of the gif
                int x = (icon.getIconWidth() * 3) / 2;
                int y = (icon.getIconHeight() * 3) / 2;
                ((ImageIcon) icon).setImage(((ImageIcon) icon).getImage().getScaledInstance(x, y, Image.SCALE_FAST));

                // Set item stuff
                pokemonItem = new JPanel();
                pokemonItem.setOpaque(false);

                // Check if the pokemon has an item
                if (pokemon.hasItem()) {
                    // Get image for item
                    File f2 = new File(pokemon.getItem().getFilePath());
                    URL imgUrl2 = f2.toURI().toURL();
                    Icon itemIcon = new ImageIcon(imgUrl2);

                    // Change the size of the item
                    ((ImageIcon) itemIcon).setImage(((ImageIcon) itemIcon).getImage().getScaledInstance(40, 40, Image.SCALE_FAST));

                    // Add images for pokemon items
                    pokemonItem.setPreferredSize(new Dimension(40, 40));
                    JLabel pkItem = new JLabel(itemIcon);
                    pkItem.setSize(new Dimension(40, 40));
                    pokemonItem.add(pkItem);
                }

                // Set position
                pokemonItem.setAlignmentX(0.0f);
                pokemonItem.setAlignmentY(0.0008f);

                // Add gif for pokemon
                pokemonGif = new JPanel(new BorderLayout());
                pokemonGif.setBackground(bgColor);
                pokemonGif.setPreferredSize(new Dimension(150, 150));
                JLabel pkGif = new JLabel(icon);
                pkGif.setSize(new Dimension(150, 200));
                pokemonGif.add(pkGif, BorderLayout.SOUTH);

                // Add name and level of pokemon
                pokemonName = new JPanel(new BorderLayout());
                pokemonName.setBackground(bgColor);
                JLabel pkLevel = new JLabel("Level " + pokemon.getLevel(), SwingConstants.CENTER);
                JLabel pkName = new JLabel(pokemon.getNickname(), SwingConstants.CENTER);
                pkLevel.setFont(new Font("Arial", Font.PLAIN, 14));
                pkLevel.setForeground(Color.WHITE);
                pkName.setFont(new Font("Arial", Font.BOLD, 20));
                pkName.setForeground(Color.WHITE);
                pokemonName.add(pkName, BorderLayout.NORTH);
                pokemonName.add(pkLevel, BorderLayout.SOUTH);
                
                // Add status and health of pokemon
                createStatusEffect();
                createHealthBar();
            }
            catch (MalformedURLException e) {
                System.err.println("ERROR: " + e.getMessage());
                System.err.println(e.getStackTrace()[0].getLineNumber());
                System.err.println(e.getStackTrace()[0].getFileName());
            }

            JPanel upper = new JPanel();
            JPanel middle = new JPanel(new BorderLayout());
            JPanel main = new JPanel(new BorderLayout());
            upper.setBackground(bgColor);
            upper.setPreferredSize(new Dimension(150, 250));
            middle.setBackground(bgColor);
            middle.add(pokemonName, BorderLayout.NORTH);
            middle.add(pokemonGif, BorderLayout.SOUTH);
            upper.add(middle, BorderLayout.NORTH);
            upper.add(pokemonHealth, BorderLayout.SOUTH);
            
            main.add(upper, BorderLayout.NORTH);
            main.add(statusBar, BorderLayout.SOUTH);

            this.add(main, JLayeredPane.DEFAULT_LAYER, 0);
            this.add(pokemonItem, JLayeredPane.PALETTE_LAYER, 1);
        }

        public Dimension getPreferredSize() {
            return new Dimension(DIM_WIDTH, DIM_HEIGHT);
        }

        public Pokemon getPokemon() {
            return pokemon;
        }

        private void createStatusEffect() {
            statusBar = new JPanel();
            File f;
            URL imgURL;
            Icon icon = null;

            try {
                // Fainted
                if (pokemon.getHP() == 0 && pokemon.getMaxHP() > 0) {
                    f = new File("Status/Fainted.png");
                    imgURL = f.toURI().toURL();
                    icon = new ImageIcon(imgURL);
                }
                else {
                    switch (pokemon.getStatus()) {
                        case SLEEPING:
                            f = new File("Status/Asleep.png");
                            imgURL = f.toURI().toURL();
                            icon = new ImageIcon(imgURL);
                            break;    

                        case BURNED:
                            f = new File("Status/Burned.png");
                            imgURL = f.toURI().toURL();
                            icon = new ImageIcon(imgURL);
                            break; 

                        case FROZEN:
                            f = new File("Status/Frozen.png");
                            imgURL = f.toURI().toURL();
                            icon = new ImageIcon(imgURL);
                            break; 

                        case PARALYZED:
                            f = new File("Status/Paralysis.png");
                            imgURL = f.toURI().toURL();
                            icon = new ImageIcon(imgURL);
                            break; 
        
                        case POISONED:
                            f = new File("Status/Poisoned.png");
                            imgURL = f.toURI().toURL();
                            icon = new ImageIcon(imgURL);
                            break; 
        
                        case BADLY_POISONED:
                            f = new File("Status/Badly_Poisoned.png");
                            imgURL = f.toURI().toURL();
                            icon = new ImageIcon(imgURL);
                            break; 
                    
                        // Healthy
                        default:
                            break;
                    }
                }

            statusBar.setBackground(backgroundColor);
            statusBar.setPreferredSize(new Dimension(150, 100));
            JLabel statusLabel = new JLabel();

            if (icon != null) {
                ((ImageIcon) icon).setImage(((ImageIcon) icon).getImage().getScaledInstance(150, 38, Image.SCALE_FAST));
                statusLabel.setIcon(icon);
            }
            
            statusBar.add(statusLabel);
            }
            catch (Exception e) {
                System.err.println("ERROR: " + e.getMessage());
                System.err.println(e.getStackTrace()[0].getLineNumber());
                System.err.println(e.getStackTrace()[0].getFileName());
            }
        }

        private void createHealthBar() {
            pokemonHealth = new JPanel();
            pokemonHealth.setBackground(backgroundColor);
            pokemonHealth.setPreferredSize(new Dimension(150, 150));

            if (pokemon.getMaxHP() > 0) {
                FlowLayout fl = new FlowLayout(FlowLayout.LEFT);
                fl.setHgap(3);
                fl.setVgap(3);

                // Calculate the percent of health bar remaining
                float percentDamage = (float)pokemon.getHP() / (float)pokemon.getMaxHP();
                int healthBarLength = Math.round(percentDamage * 140);

                // Determine Color - Source: https://gaming.stackexchange.com/questions/331464/how-is-the-color-of-the-hit-point-bar-calculated
                Color barColor;
                if (percentDamage > 0.50f) {
                    barColor = Color.GREEN;
                }
                else if (percentDamage > 0.20f) {
                    barColor = Color.ORANGE;
                }
                else {
                    barColor = Color.RED;
                }

                // Create the outer bar
                JPanel outerBar = new JPanel(fl);
                outerBar.setPreferredSize(new Dimension(146, 16));

                // Create the inner bar
                JPanel innerBar = new JPanel();
                innerBar.setBackground(barColor);
                innerBar.setPreferredSize(new Dimension(healthBarLength, 10));
                outerBar.add(innerBar);

                // Create Health Label
                JLabel hpLabel = new JLabel(String.format("%d / %d", pokemon.getHP(), pokemon.getMaxHP()));
                hpLabel.setFont(new Font("Arial", Font.BOLD, 16));
                hpLabel.setForeground(Color.WHITE);
                
                pokemonHealth.add(outerBar, BorderLayout.NORTH);
                pokemonHealth.add(hpLabel, BorderLayout.SOUTH);
            }           
        }

        @Override
        protected void paintComponent(Graphics g) {
            setBackground(backgroundColor);
            super.paintComponent(g);
        }
    }
}