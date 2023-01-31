component{
    this.name = "BLOG-COMPONENTS";
    this.loginStorage = "session";
    this.sessionManagement = true;
    this.setClientCookies = true;
    this.setDomainCookies = false;
    this.sessionTimeOut = createTimeSpan(0,1,30,0);
    this.applicationTimeOut = createTimeSpan(180,0,0,0);
    
}