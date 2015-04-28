complete<-function(directory, id = 1:332){
    filelist<-list.files("specdata",full.names=T)
    
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
    ans<-data.frame(id,nobs)
    
   
}