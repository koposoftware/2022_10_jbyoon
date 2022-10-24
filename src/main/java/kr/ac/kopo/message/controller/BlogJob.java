package kr.ac.kopo.message.controller;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import kr.ac.kopo.message.service.BlogService;

public class BlogJob extends QuartzJobBean{

	private BlogService blogService;

    public void setBlogService(BlogService blogService) {
        this.blogService = blogService;
    }

    @Override
    protected void executeInternal(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        try {
            blogService.updateAlert();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    

}
