package az.mm.developerjobs.controller;

import az.mm.developerjobs.constant.JspPages;
import az.mm.developerjobs.entity.JobInfo;
import az.mm.developerjobs.model.*;
import az.mm.developerjobs.service.JobService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author MM <mushfiqazeri@gmail.com>
 */
@Controller
public class IndexController {
    
    private final Logger logger = LoggerFactory.getLogger(IndexController.class);
    
    @Autowired
    private JobService jobService;

    @RequestMapping("/")
    public ModelAndView homePage() {
        ModelAndView model = new ModelAndView("main");
        List<JobInfo> jobList = jobService.getJobsWithPageRequest("031", 0); // default country - Azerbaijan
        Pagination pagination = jobService.createPagination("031", 1);
        
        model.addObject("jobList", jobList);
        model.addObject("includePage", JspPages.JOBS);
        model.addObject("countryCode", "031");
        model.addObject("pagination", pagination);

        return model;
    }

    
    @RequestMapping(value = "/country", method = RequestMethod.GET)
    public ModelAndView jobsForCountry(@RequestParam(value = "id", defaultValue = "031") String countryCode, @RequestParam(value = "page", defaultValue = "1") String page) {
        ModelAndView model = new ModelAndView("main");
        
        /**
         * Pagination with two ways:
         * 
         * 1st - using PagingAndSortingRepository:
         *   List<JobInfo> listVacancy = jobService.getJobsWithPageRequest(countryCode, Integer.parseInt(page)-1);
         * 
         * 2nd - using native query:
         *   int begin = Integer.parseInt(page + "0") - 10;
         *   List<JobInfo> listVacancy = jobService.getJobsWithLimit(countryCode, begin);
         */
        
        List<JobInfo> jobList = jobService.getJobsWithPageRequest(countryCode, Integer.parseInt(page)-1); //zero-base index
        Pagination pagination = jobService.createPagination(countryCode, Integer.parseInt(page));

        model.addObject("jobList", jobList);
        model.addObject("includePage", JspPages.JOBS);
        model.addObject("countryCode", countryCode);
        model.addObject("pagination", pagination);
        
        return model;
    }


    @RequestMapping("/contact")
    public ModelAndView contactPage() {
        ModelAndView model = new ModelAndView("main");
        model.addObject("includePage", JspPages.CONTACT);

        return model;
    }


    @RequestMapping("/about")
    public ModelAndView aboutPage() {
        ModelAndView model = new ModelAndView("main");
        model.addObject("includePage", JspPages.ABOUT);

        return model;
    }

    
    @RequestMapping(value = "/search.htm", method = RequestMethod.POST)
    public ModelAndView search(@Valid @ModelAttribute("search") Search search, BindingResult result) {
        ModelAndView model = new ModelAndView("main");
        
        if(result.hasErrors()){
            logger.error("Error occurs while searching: {}", result.getAllErrors());
            model.addObject("includePage", JspPages.SEARCH);
            return model;
        }

        List<JobInfo> searchResult = jobService.caseSensitiveSearchResult(search.getSearchText().trim());     // case sensitive
//        List<JobInfo> searchList = jobService.caseInsensitiveSearchResult(search.getSearchText().trim());   // case insensitive
        
        model.addObject("searchResult", searchResult);
        model.addObject("searchText", search.getSearchText());
        model.addObject("includePage", JspPages.SEARCH);
        
        return model;
    }


    @RequestMapping(value = "/sendMail", method = RequestMethod.POST)
    public ModelAndView sendMail(@Valid @ModelAttribute("user") User user, BindingResult result, HttpServletRequest request) {
        ModelAndView model = new ModelAndView("main");
        model.addObject("includePage", JspPages.CONTACT);

        if (result.hasErrors()) return model;
        
        String ipAddress = request.getHeader("X-FORWARDED-FOR");
        if (ipAddress == null) 
            ipAddress = request.getRemoteAddr();

        String from = user.getEmail();
        String subject = "Developer Jobs Contact Message";
        StringBuilder message = new StringBuilder();
        message.append("\n User Name:  ").append(user.getName());
        message.append("\n Ip address: ").append(ipAddress);
        message.append("\n Message:    ").append(user.getMessage());
        
        logger.info("Contact message info: {}", message);
        
        String notif;
        try {
            jobService.sendMail(from, subject, message.toString());
            notif = "Your message send successfully.";
        } catch(Exception ex){
            notif = "Something went wrong. Please try again later";
            logger.error("Exception occurs when sending email", ex);
        }

        model.addObject("notif", notif);
        
        return model;
    }
    

    @RequestMapping("/ppolicy")
    public ModelAndView getPrivacyPolicy() {
        ModelAndView model = new ModelAndView("main");
        model.addObject("includePage", JspPages.PRIVACY_POLICY);

        return model;
    }


    @RequestMapping("/job/{id}/{title}")
    public ModelAndView getJobDetail(@PathVariable("id") int id, @PathVariable("title") String title, @RequestParam(value = "searchText", defaultValue = "") String searchText) {
        ModelAndView model = new ModelAndView("main");
        JobInfo job = jobService.getJob(id, title);
        
        if(job == null){
            logger.info("Job (id[{}], title[{}]) is not found", id, title);
            model.addObject("includePage", JspPages.NOT_FOUND);
            return model;
        } 
        
        if(!searchText.equals("")){
//            job.setContent(job.getContent().replaceAll("(?i)"+searchText, "<b style=\"color:blue;\">"+searchText+"</b>"));  // (?i) - for ignore case 
            job.setContent(job.getContent().replaceAll(searchText, "<b style=\"color:blue;\">"+searchText+"</b>"));  // It needs modify..
        }

        model.addObject("job", job);
        model.addObject("includePage", JspPages.JOB);

        return model;
    }

    
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(value = Exception.class)
    public String handlerException(Exception e) {
        logger.error("Exception occurs", e);
        return "exception";
    }


    @ModelAttribute
    public void addingCommonObjects(Model model) {
        model.addAttribute("user", new User());      //It needs for springForm:form tag
        model.addAttribute("search", new Search());  //It needs for springForm:form tag
    }

}
