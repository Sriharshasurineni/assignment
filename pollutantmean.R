pollutantmean<-function(directory, pollutant, id = 1:332){
    
    filelist<-list.files("specdata",full.names=T)
    
    completedatalist<-vector(mode = "list", length = length(id))
    
    for(i in seq_along(id)){
        
        m<-id[i]
        completedatalist[[i]]<-read.csv(filelist[[m]])
    }
    
    singlecompletedata<-do.call(rbind,completedatalist)    
    
    
    mean(singlecompletedata[,pollutant],na.rm = T)
}