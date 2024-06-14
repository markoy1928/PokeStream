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

public class TrainerPanel extends JPanel {
    private static int DIM_WIDTH;
    private static int DIM_HEIGHT;
    private JFrame frame;
    private Color backgroundColor;
    private JPanel moneyPanel;
    private JPanel seenPanel;
    private JPanel ownPanel;
    private JLabel moneyLabel;
    private JLabel seenLabel;
    private JLabel ownLabel;

    public void createTrainerGUI(int money, int seen, int own, Color bgColor, String fontFamily, Color fontColor, int scale) {
        frame = new JFrame("Trainer");
        DIM_WIDTH = 50 * scale;
        DIM_HEIGHT = 50 * scale;
        ImageIcon frameIcon = new ImageIcon("Pokemon/Dragapult.png");
        frame.setIconImage(frameIcon.getImage());
        this.backgroundColor = bgColor;
        this.setLayout(new FlowLayout());

        // Money
        moneyLabel = new JLabel("Money: $" + money, SwingConstants.LEFT);
        moneyLabel.setFont(new Font(fontFamily, Font.PLAIN, 6 * scale));
        moneyLabel.setForeground(fontColor);
        moneyPanel = new JPanel(new BorderLayout());
        moneyPanel.setBackground(bgColor);
        moneyPanel.add(moneyLabel, BorderLayout.WEST);
        moneyPanel.setPreferredSize(new Dimension(DIM_WIDTH - (4 * scale), 10 * scale));

        // Pokemon Seen
        seenLabel = new JLabel("Seen: " + seen, SwingConstants.LEFT);
        seenLabel.setFont(new Font(fontFamily, Font.PLAIN, 6 * scale));
        seenLabel.setForeground(fontColor);
        seenPanel = new JPanel(new BorderLayout());
        seenPanel.setBackground(bgColor);
        seenPanel.add(seenLabel, BorderLayout.WEST);
        seenPanel.setPreferredSize(new Dimension(DIM_WIDTH - (4 * scale), 10 * scale));

        // Pokemon Owned
        ownLabel = new JLabel("Caught: " + own, SwingConstants.LEFT);
        ownLabel.setFont(new Font(fontFamily, Font.PLAIN, 6 * scale));
        ownLabel.setForeground(fontColor);
        ownPanel = new JPanel(new BorderLayout());
        ownPanel.setBackground(bgColor);
        ownPanel.add(ownLabel, BorderLayout.WEST);
        ownPanel.setPreferredSize(new Dimension(DIM_WIDTH - (4 * scale), 10 * scale));

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

        moneyLabel.setText("Money: $" + money);
        seenLabel.setText("Seen: " + seen);
        ownLabel.setText("Caught: " + own);

        moneyPanel.removeAll();
        seenPanel.removeAll();
        ownPanel.removeAll();
        moneyPanel.add(moneyLabel);
        seenPanel.add(seenLabel);
        ownPanel.add(ownLabel);
        
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
}
