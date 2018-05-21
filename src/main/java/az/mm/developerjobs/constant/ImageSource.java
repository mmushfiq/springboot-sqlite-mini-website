package az.mm.developerjobs.constant;

/**
 *
 * @author MM <mushfiqazeri@gmail.com>
 */
public enum ImageSource {
    BOSS_AZ("bossaz.png"),
    JOBSEARCH_AZ("jobsearchaz.jpg"),
    RABOTA_AZ("rabotaz.png"),
    BANCO_AZ("bancoaz.png"),
    
    JAVA("java.png"),
    NET("net.png"),
    ANDROID("android.png"),
    SQL("sql.png"),
    PYTHON("python.png"),
    PHP("php.png"),
    DEVELOPER("developer.png");
    
    private final String imgSource;
    private ImageSource(String imgSource){
        this.imgSource = imgSource;
    }

    @Override
    public String toString() {
        return imgSource;
    }
}
