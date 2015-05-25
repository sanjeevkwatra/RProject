
#  Please read the comment after PS at the bottom of this page for the latest status...
# The comments are all self explanatory in the accmpanying R file
# Go the top-level directory in the uzipped data set that contains test and train sundirectories.
# Source "run_analysis.R"
# This will create X_subset.txt which contains the data as required
 # The last part was not finished. I was able to clean up the data, group by activity and subject, but do not know exactly to create a tidy set from here -- and there is no   time left. I hope the evaluator  will run my run_analysis.R

i have uploaded X.txt (the cleaned data set) to the git repository also. I  "attached" it when submitting the assigment on Coursera but it took >5 minutes to upload the file and the deadline expired during that time!!!! -- so am not sure if the file got attached. In case it is not, the same file can be got from github.
Thanks.


PS:  

I realized that the problem was with "summarize_each" function. It doesn't work as expected -- but summarise_each (British spelling) works. I found this the hard way -- after struggling for hours -- eventually found this info on stack overflow. I have now modified run_analysis.R to produce "part5.txt" -- which contains the tidy data as required in part 5 of the assignment. I an also putting prt5.txt in the git repository. Thanks for your patience.