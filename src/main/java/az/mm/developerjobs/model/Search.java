package az.mm.developerjobs.model;

import javax.validation.constraints.Size;

/**
 *
 * @author MM <mushfiqazeri@gmail.com>
 */
public class Search {
    
    @Size(min=3, max = 30, message = "Query size must be between 3 and 30")
    private String searchText;

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }
}
