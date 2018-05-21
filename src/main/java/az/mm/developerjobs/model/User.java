package az.mm.developerjobs.model;

//import javax.validation.constraints.Email;
//import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author MM <mushfiqazeri@gmail.com>
 */
public class User {
    
    /* Message is put in messages.properties file */
    
    @NotNull  
    @Size(min=2, max=30)
    @Pattern(regexp = "[^0-9]*")
    private String name; 
    
    @NotEmpty
    @Email  
    private String email;
    
    @NotEmpty
    private String message;

    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
