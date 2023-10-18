import javax.swing.*;
import java.awt.*;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.Comparator;

public class ImageComparator extends JFrame {

    private static final String IMAGE_FOLDER_PATH = "E:/Study/XXQ/ultralytics/image";
    private static final String PREDICT_FOLDER_PATH = "C:/Users/19394/runs/detect/predict";
    private static final String LABELS_FOLDER_PATH = "C:/Users/19394/runs/detect/predict/labels";

    private File[] imageFiles;
    private File[] predictFiles;
    private File[] labelFiles;

    private JLabel imageLabel;
    private JLabel predictLabel;
    private JTextArea labelTextArea;
    private JButton previousBtn;
    private JButton nextBtn;
    private int currentIndex;

    public ImageComparator() {
        super("Image Comparator");

        // 获取文件列表
        File imageFolder = new File(IMAGE_FOLDER_PATH);
        imageFiles = imageFolder.listFiles((dir, name) -> name.endsWith(".jpg"));
        Arrays.sort(imageFiles, Comparator.comparing(File::getName));

        File predictFolder = new File(PREDICT_FOLDER_PATH);
        predictFiles = predictFolder.listFiles((dir, name) -> name.endsWith(".jpg"));
        Arrays.sort(predictFiles, Comparator.comparing(File::getName));

        File labelsFolder = new File(LABELS_FOLDER_PATH);
        labelFiles = labelsFolder.listFiles((dir, name) -> name.endsWith(".txt"));
        Arrays.sort(labelFiles, Comparator.comparing(File::getName));

        // 初始化 GUI 组件
        imageLabel = new JLabel();
        predictLabel = new JLabel();
        labelTextArea = new JTextArea();
        previousBtn = new JButton("Previous");
        nextBtn = new JButton("Next");

        // 设置布局
        setLayout(new BorderLayout());
        JPanel centerPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        gbc.fill = GridBagConstraints.BOTH;
        centerPanel.add(imageLabel, gbc);
        gbc.gridx = 1;
        centerPanel.add(predictLabel, gbc);
        add(centerPanel, BorderLayout.CENTER);
        add(new JScrollPane(labelTextArea), BorderLayout.SOUTH);

        // 初始化索引
        currentIndex = 0;

        // 显示第一组文件
        showFiles();

        // 绑定翻页按钮事件
        previousBtn.addActionListener(e -> {
            if (currentIndex > 0) {
                currentIndex--;
                showFiles();
            }
        });

        nextBtn.addActionListener(e -> {
            if (currentIndex < imageFiles.length - 1) {
                currentIndex++;
                showFiles();
            }
        });

        JPanel buttonPanel = new JPanel();
        buttonPanel.add(previousBtn);
        buttonPanel.add(nextBtn);
        add(buttonPanel, BorderLayout.NORTH);

        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(1800, 1000);
        setLocationRelativeTo(null);
        setVisible(true);
    }

    private void showFiles() {
        // 加载图片
        ImageIcon imageIcon = new ImageIcon(imageFiles[currentIndex].getAbsolutePath());
        int imageWidth = imageIcon.getIconWidth();
        int imageHeight = imageIcon.getIconHeight();
        imageLabel.setIcon(new ImageIcon(imageIcon.getImage().getScaledInstance(400, 400*imageHeight/imageWidth, Image.SCALE_SMOOTH)));

        ImageIcon predictIcon = new ImageIcon(predictFiles[currentIndex].getAbsolutePath());
        int predictWidth = predictIcon.getIconWidth();
        int predictHeight = predictIcon.getIconHeight();
        predictLabel.setIcon(new ImageIcon(predictIcon.getImage().getScaledInstance(400, 400*predictHeight/predictWidth, Image.SCALE_SMOOTH)));

    }



    public static void main(String[] args) {
        SwingUtilities.invokeLater(ImageComparator::new);
    }
}
