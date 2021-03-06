\encoding{UTF-8}
\name{uncertainty}
\alias{uncertainty}
\alias{uc}
\alias{plot.uncertainty}
\title{Uncertainty assessment}
\description{Calculates probability of exceedance based of AEP data and given uncertainties of applied methods.}
\usage{
uncertainty(aep, uc.values, uc.names, prob=seq(5,95,5), 
  digits=c(0,0), print=TRUE)
uc(aep, uc.values, uc.names, prob=seq(5,95,5), 
  digits=c(0,0), print=TRUE)

\method{plot}{uncertainty}(x, type=c("prob", "uncert"), p.values=c(50,75,90), ...)
}
\arguments{
  \item{aep}{AEP object created by \code{\link{aep}}.}
  \item{uc.values}{Uncertainty values (in percent) for applied methods as numeric vector.}
  \item{uc.names}{Names of the uncertainty components. Normally a string vector of the same length as \code{uc.values}. If \code{uc.names} is a string vector with the length of \code{uc.values} + 1, the calculated total uncertainty is named after the additional name (default is "total"). If \code{uc.names} is \code{NULL}, the methods are numbered consecutively.}
  \item{prob}{Probability values used for the probability of exceedance analysis. Default is \code{seq(5,95,5)}.}
  \item{digits}{Number of decimal places to be used for results as numeric vector. The first value is used for uncertainties of applied methods, the second for probability of exceedance results. Default is \code{c(0,0)}.}
  \item{print}{If \code{TRUE}, results are printed directly.}
  
  \item{x}{Uncertainty object created by \code{uncertainty}.}
  \item{type}{Type of plot as string. One of \code{"prob"} (probability of exceedance plot) or \code{"uncert"} (uncertainties overview plot).}
  \item{p.values}{The P-values highlighted in the plot as numeric vector -- default is P50, P75 and P90.}
  \item{\dots}{Arguments to be passed to methods. For optional graphical parameters see below.}
}
\details{
A wind resource assessment, like every statistical analysis, is only complete with an accompanying uncertainty assessment. \code{uncertainty} provides a simple tool to arrange uncertainties of the methods applied and analyse their approximate effects to the energy output of a turbine. The total uncertainty arises from many uncertainty components of different type and impact. Common components are wind measurement (sensor quality/calibration, mast influences, etc.), data analysis (missing data, data selection, simplifications/assumptions etc.), long term data (reference data, length of measuring period, etc.), flow modelling (horizontal and vertical extrapolations, etc.) or power curve (measurement quality, assumptions, etc.).

Assuming all uncertainty components to be independent from each other, the combined standard uncertainty is calculated as follows:
\deqn{U = \sqrt{u_1 + u_2 + ... + u_n}}{U = sqrt(u_1 + u_2 + ... + u_n)}
where \eqn{U} is the total uncertainty and \eqn{u_1} untill \eqn{u_n} are the uncertainty components.
}
\section{Optional graphical parameters}{
  \emph{The following graphical parameters can optionally be added to customize the probability of exceedance plot (\code{type="prob"}):}
  \itemize{
	\item \code{bty}: Type of box to be drawn around the plot region. Allowed values are \code{"o"} (the default), \code{"l"}, \code{"7"}, \code{"c"}, \code{"u"}, or \code{"]"}. The resulting box resembles the corresponding upper case letter. A value of \code{"n"} suppresses the box.
	\item \code{bty.leg}: Type of box to be drawn around the legend. Allowed values are \code{"n"} (no box, the default) and \code{"o"}.
    \item \code{cex}: Amount by which text on the plot should be scaled relative to the default (which is \code{1}), as numeric. To be used for scaling of all texts at once.
    \item \code{cex.axis}: Amount by which axis annotations should be scaled, as numeric value.
    \item \code{cex.lab}: Amount by which axis labels should be scaled, as numeric value.
    \item \code{cex.leg}: Amount by which legend text should be scaled, as numeric value.
    \item \code{col}: Vector of n colours -- [1] for the probability curve, [2:n] for the highlighted P-values (\code{p.values}).
	\item \code{col.axis}: Colour to be used for axis annotations -- default is \code{"black"}.
	\item \code{col.box}: Colour to be used for the box around the plot region (\code{bty}) -- default is \code{"black"}.
    \item \code{col.lab}: Colour to be used for axis labels -- default is \code{"black"}.
    \item \code{col.leg}: Colour to be used for legend text -- default is \code{"black"}.
    \item \code{col.ticks}: Colours for the axis line and the tick marks respectively -- default is \code{"black"}.
    \item \code{las}: Style of axis labels. One of \code{0} (always parallel to the axis, default), \code{1} (always horizontal), \code{2} (always perpendicular to the axis), \code{3} (always vertical).
    \item \code{legend}: If \code{TRUE} (the default) a legend is drawn.
    \item \code{leg.text}: Vector of strings used as alternative legend text.
    \item \code{lty}: Vector of line types -- usage like \code{col}. See \code{\link{par}} for available line types.
    \item \code{lwd}: Vector of line widths -- usage like \code{col}. See \code{\link{par}} for usage.
    \item \code{mar}: A numerical vector of the form c(bottom, left, top, right) which gives the number of lines of margin to be specified on the four sides of the plot -- default is \code{c(4.5, 4.5, 1, 1)}.
    \item \code{mgp}: A numerical vector of the form c(label, annotation, line), which gives the margin line for the axis label, axis annotation and axis line. The default is \code{c(2.7, 0.7, 0)}.
    \item \code{pos.leg}: Position of legend -- one of \code{"bottomright"}, \code{"bottom"}, \code{"bottomleft"}, \code{"left"}, \code{"topleft"}, \code{"top"}, \code{"topright"}, \code{"right"} or \code{"center"}.
   	\item \code{xlab}: Alternative label for the x axis.
	\item \code{ylab}: Alternative label for the y axis.
	\item \code{xlim}: Limits of the x axis, as vector of two values.
	\item \code{ylim}: Limits of the y axis, as vector of two values.
	\item \code{x.intersp}: Horizontal interspacing factor for legend text, as numeric -- default is \code{0.4}.
    \item \code{y.intersp}: Vertical line distance for legend text, as numeric -- default is \code{0.8}.
  }
  \emph{Optional graphical parameters for the uncertainty overview plot (\code{type="uncert"}):}
  \itemize{
    \item \code{border}: Colour to be used for the border of the bars -- usage like \code{col}, as default no border is drawn.
	\item \code{cex}: Amount by which text on the plot should be scaled relative to the default (which is \code{1}), as numeric. To be used for scaling of all texts at once.
    \item \code{cex.axis}: Amount by which the names of the uncertainty components should be scaled, as numeric value.
    \item \code{cex.text}: Amount by which the uncertainty values inside the bars should be scaled, as numeric value.
	\item \code{col}: One or a vector of colours. If one colour is specified, this colour is used for all bars. If two colours are specified, the first colour is used for uncertainty component bars and the second for the total uncertainty bar. Separate colours for each bar can also be specified.
	\item \code{col.axis}: Colour to be used for the names of the uncertainty components -- default is \code{"black"}.
	\item \code{col.text}: Colour to be used for the uncertainty values inside the bars -- default is \code{"white"}.
	\item \code{mar}: A numerical vector of the form c(bottom, left, top, right) which gives the number of lines of margin to be specified on the four sides of the plot.
    \item \code{mgp}: A numerical vector of the form c(label, annotation, line), which gives the margin line for the axis label, axis annotation and axis line. The default is \code{c(3, 1, 0)}.
    \item \code{space}: Numeric value between 0 and 1, giving the space left before each bar. Default space is \code{0.2}.
  }
}
\value{
  Returns a list containing:
  \item{uncertainty.meth}{Table of uncertainty components and their uncertainty value.}
  \item{prob.exceedance}{Table of probability values and the related annual energy production.}
}
\references{
Measnet (2009) MEASNET Procedure: Evaluation of Site Specific Wind Conditions, Version 1
}
\author{Christian Graul}
\seealso{\code{\link{aep}}}
\examples{
\dontrun{
## load and prepare data
data(winddata)
set1 <- set(height=40, v.avg=winddata[,2], v.std=winddata[,5],
  dir.avg=winddata[,14])
set2 <- set(height=30, v.avg=winddata[,6], v.std=winddata[,9],
  dir.avg=winddata[,16])
ts <- timestamp(timestamp=winddata[,1])
neubuerg <- mast(timestamp=ts, set1, set2)
neubuerg <- clean(mast=neubuerg)


## calculate uncertainty
# calculate AEP
nb.wp <- profile(mast=neubuerg, v.set=c(1,2), dir.set=1, 
  print=FALSE)
pw.56 <- pc("PowerWind_56_900kW.wtg")
nb.aep <- aep(profile=nb.wp, pc=pw.56, hub.h=71, print=FALSE)

# calculate uncertainty
uncertainty(nb.aep, uc.values=c(5,10,5,5), 
  uc.names=c("Wind Measurement Mast", "Long Term Correlation", 
  "Flow Model", "Power Curve"))

# unnamed uncertainty components
uncertainty(nb.aep, uc.values=c(5,10,5,5), 
  uc.names=NULL)

# new name for combined uncertainty
uncertainty(nb.aep, uc.values=c(5,10,5,5), 
  uc.names=c("Wind Measurement Mast", "Long Term Correlation", 
  "Flow Model", "Power Curve", "Total Uncertainty"))

# changed probability values
uncertainty(nb.aep, uc.values=c(5,10,5,5), 
  uc.names=c("Wind Measurement Mast", "Long Term Correlation", 
  "Flow Model", "Power Curve"), prob=seq(50,90,10))

# change number of digits and hide results
neubuerg.uc <- uncertainty(nb.aep, uc.values=c(5,10,5,5), 
  uc.names=c("Wind Measurement Mast", "Long Term Correlation", 
  "Flow Model", "Power Curve"), digits=c(1,2), print=FALSE)
neubuerg.uc


## plot uncertainty objects - probability of exceedance plot 
plot(neubuerg.uc)  # default
plot(neubuerg.uc, p.values=c(50, 95))  # change highlighted P-values

# change colours, line types, line width and text size
plot(neubuerg.uc, col="blue", lty=c(1, 2, 3, 4), lwd=2, cex=1.2)

# freaky
plot(neubuerg.uc, bty="l", bty.leg="o", cex.axis=2, 
  cex.lab=0.5, cex.leg=0.8, col=c(5, 10, 15, 20), col.axis="sienna", 
  col.box="purple", col.lab="plum", col.leg="orchid", col.ticks="gold", 
  las=0, lty=c(8, 7, 6, 5), lwd=c(5, 3, 1, 0.5), mar=c(6, 5, 4, 3), 
  mgp=c(4, 2, 1), pos.leg="bottomleft", xlim=c(0.1, 0.9), ylim=c(1000, 2000), 
  x.intersp=2, y.intersp=1.5)


## plot uncertainty objects - uncertainty overview plot
plot(neubuerg.uc, type="uncert")  # default

# change colours and border
plot(neubuerg.uc, type="uncert", col="red", border="red4")
plot(neubuerg.uc, type="uncert", col=c(gray(0.7), gray(0.5)), 
  border=c(gray(0.6), gray(0.4)))
plot(neubuerg.uc, type="uncert", col=c(5:1), border=c(1:5))

# change text size, space and margin
plot(neubuerg.uc, type="uncert", cex=1.5, space=0.1, mar=c(1, 13, 1, 1))

# freaky
plot(neubuerg.uc, type="uncert", border=c(11, 22, 33, 44, 55), cex.axis=0.7, 
  cex.text=2, col=c("maroon", "navy", "thistle", "rosybrown", "papayawhip"), 
  col.axis="pink3", col.text="seagreen", mar=c(3, 8, 2, 1), mgp=c(0, 1, 2), space=1)
}
}
\keyword{methods}
