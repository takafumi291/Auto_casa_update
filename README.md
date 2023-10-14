# auto_casa_update
Run this code to update external geodetic data before calibrating / imaging ALMA data.  

I assumed to work on the directory containing casa-*  
e.g.,   
(base) [takafumi@xxx code]$ ls  
casa-6.1.1-15-pipeline-2020.1.0.40  casa-release-4.3.1-pipe-el6  casa-release-5.4.0-68.el7  casa_update.sh  
casa-6.2.1-7-pipeline-2021.2.0.128  casa-release-4.7.0-el7       casa-release-5.4.0-70.el7  

To update external geodetic data, just run casa_update.sh  
(base) [takafumi@xxx code]$ chmod 775 casa_auto_update.sh  
(base) [takafumi@xxx code]$ bash casa_auto_update.sh  

Your casa-* in the directory all get updated!  
