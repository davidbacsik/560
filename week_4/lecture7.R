# Scripting in R
# Stat560

############################################################
## Scripts 

## Why bother with scripts?
# We have been using RStudio, which provides an interactive R session to play with.  This is nice, but it's actually not what you want to do when organizing a computational project (see http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424).

# There are two key points to keep in mind when organizing a computational project.  The first is that, at any point, someone unfamiliar with the project should be able to come in and repeat everything you've done.  This is equivalent to the wetlab notebook requirement, and we often explain its importance by supposing that the analyst/experimenter was hit by a bus or something.  
# However, the most likely person to try and figure out what you did six months ago IS YOU!!!  Staying organized ultimately helps you!  Second, analyses need to be repeated as more data comes in and tweaked as you make decisions about what constraints to impose, what tests to use and how the figures should look.
# Scripts are ideal for projects because they are durable, modifiable and re-runnable records of analyses you do.  They therefore satisfy these two big goals: leaving a clear record and facile repeatability. R Markdown documents accomplish these goals, too.  But, in many cases you won't want HTML or PDF output (e.g. when using a cluster, etc).

## What is a script and how do you run it?
# A script is just a plain text file with R commands in it. Each command is executed in sequence when the script is run.  You can prepare a script in any text editor (e.g vim, TextWrangler, or Coda). You can also prepare a script in a word processor, like Word, Writer, TextEdit, or WordPad, PROVIDED you save the script in plain text (.txt) format.
# You can run scripts in R in two ways.  In an interactive R environment you can use the source() function, which will just run the script in the interactive environment.  Try it with this script!  You will have to provide source() with the path to the script.

library(ggplot2)

x = rnorm(100)
y = rnorm(100)

mean_x = mean(x)
mean_y = mean(y)

print(mean_x)
print(mean_y)

data.xy = data.frame("xvals" = x, "yvals" = y)

pdf("~/pairwise.pdf") # Note: this plot will end up in your user/home directory

ggplot(data.xy, aes(xvals, yvals)) + geom_point()

dev.off()

# Note that the script runs but you don't see output in RStudio except what we told R to print()
# You can also run the script from the command line by changing directories to the location of the script and typing "Rscript lecture7.R"
# Try it!

## Taking input from the command line

# Running scripts from the command line, as we just did, allows you to automate analyses (e.g. on a cluster or as part of a larger set of scripts)
# Often, it is desirable to write a script that can take input at runtime from the command line.  This is a good thing because it allows you to avoid hard-coding (e.g. writing into your script) parameters you might want to change.  An example of a parameter you might want to change would be the rejection level of a test or the location of an input file.

# To get command line arguments into your script use commandArgs()
# The line "args = CommandArgs(TRUE)" will create a vector called args of all the whitespace-separated arguments you called the script with. 
# For example, "Rscript myscript_R arg1 arg2 arg3" will result in args = ["arg1", "arg2", "arg3"]
# Note that the arguments are initially characters

## Try it for yourself.  Write a script generates a random sample from a normal distribution where the sample size, mean and standard deviation for the rnorm() call are specified as parameters at runtime (e.g. parameters that come from the command line).  Your script should calculate the mean of the distribution and plot a histogram that has a line marking the location of the mean.  Challenge 1: the plot should also contain the value of the mean printed on the plot.  Challenge 2: figure out how to position the printed mean value next to the line marking the location and (on a separate plot) in the upper right-hand corner.
