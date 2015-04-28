corr<-function(directory, threshold = 0){
    filelist<-list.files("specdata",full.names=T)
    id<-1:length(filelist)
    completedatalist<-vector(mode = "list", length = length(id))
    
    for(i in seq_along(id)){
        
        a<-id[i]
        completedatalist[[i]]<-read.csv(filelist[[a]])
    }
    
    nobs<-vector("numeric",length(id))
    
    
    for(i in seq_along(id)){
        m<-completedatalist[[i]]
        l<-complete.cases(m)
        
        nobs[i]<-table(l)["TRUE"]
        
    }
    
    trial<-vector("numeric")
    j<-1
    for(i in seq_along(id)){
        
        h<-is.na(nobs[i])
        s<-nobs[i]
        b<-completedatalist[[i]]
        if(h==FALSE){
            if(s>threshold){
                trial[j]<-cor(b$sulfate,b$nitrate,use = "complete.obs")
                j<-j+1
            }
    }
    }
    trial
}