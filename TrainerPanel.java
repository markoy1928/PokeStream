import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;

import java.awt.Font;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Graphics;
import java.awt.Graphics2D;

public class TrainerPanel extends JPanel {
    private static int DIM_WIDTH;
    private static int DIM_HEIGHT;
    private JFrame frame;
    private Color backgroundColor;
    private TextPanel moneyPanel;
    private TextPanel seenPanel;
    private TextPanel ownPanel;
    private float scale;

    public void createTrainerGUI(int money, int seen, int own, Color bgColor, String fontFamily, Color fontColor, float scale) {
        frame = new JFrame("Trainer");
        DIM_WIDTH = Math.round(250 * scale);
        DIM_HEIGHT = Math.round(250 * scale);
        ImageIcon frameIcon = new ImageIcon("Pokemon/Dragapult.png");
        frame.setIconImage(frameIcon.getImage());
        this.backgroundColor = bgColor;
        this.setLayout(new FlowLayout());
        this.scale = scale;

        moneyPanel = new TextPanel("Money: $" + money, bgColor, fontFamily, fontColor);
        seenPanel = new TextPanel("Seen: " + seen, bgColor, fontFamily, fontColor);
        ownPanel = new TextPanel("Caught: " + own, bgColor, fontFamily, fontColor);

        this.add(moneyPanel);
        this.add(seenPanel);
        this.add(ownPanel);

        frame.add(this);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
        frame.setResizable(false);
    }

    public void refreshPanel(int money, int seen, int own) {
        frame.getContentPane().removeAll();

        moneyPanel.refreshPanel("Money: $" + money);
        seenPanel.refreshPanel("Seen: " + seen);
        ownPanel.refreshPanel("Caught: " + own);
        
        this.add(moneyPanel);
        this.add(seenPanel);
        this.add(ownPanel);

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

    private class TextPanel extends JPanel {
        private JLabel textLabel;

        public TextPanel(String text, Color bgColor, String fontFamily, Color fontColor) {
            textLabel = new JLabel(text, SwingConstants.LEFT);
            textLabel.setFont(new Font(fontFamily, Font.BOLD, 30));
            textLabel.setForeground(fontColor);
            this.setLayout(new BorderLayout());
            this.setBackground(bgColor);
            this.add(textLabel, BorderLayout.WEST);
            this.setPreferredSize(new Dimension(DIM_WIDTH - Math.round(20 * scale), Math.round(70 * scale)));
        }

        public void refreshPanel(String text) {
            textLabel.setText(text);

            this.removeAll();
            this.add(textLabel, BorderLayout.WEST);

            this.revalidate();
            this.repaint();
        }

        @Override
        protected void paintComponent(Graphics g) {
            setBackground(backgroundColor);

            // Scale to correct size
            Graphics2D g2 = (Graphics2D)g;
            g2.scale(scale, scale);

            super.paintComponent(g2);
        }
    }
}