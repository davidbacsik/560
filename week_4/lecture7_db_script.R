## Try it for yourself.  Write a script generates a random sample from a normal distribution where the sample size, mean and standard deviation for the rnorm() call are specified as parameters at runtime (e.g. parameters that come from the command line).  Your script should calculate the mean of the distribution and plot a histogram that has a line marking the location of the mean.  Challenge 1: the plot should also contain the value of the mean printed on the plot.  Challenge 2: figure out how to position the printed mean value next to the line marking the location and (on a separate plot) in the upper right-hand corner.

library(ggplot2)

args = commandArgs(TRUE)

args.n = as.double(args[1])
args.mean = as.double(args[2])
args.sd = as.double(args[3])

x = rnorm(args.n, args.mean, args.sd)

x.mean = mean(x)

data.x = data.frame("xvals" = x)

pdf("db_histo.pdf") # Note: this plot will end up in the working directory

qplot(data.x, geom="histogram")
geom_vline(xintercept=x.mean)

dev.off()