
## ---------------------------
##
## Script name: plotting.r
##
## Purpose of script: creating a version controlled plot code
##      
##
## ---------------------------


#function of exploratory plot

plot_function <- function(penguins.mass) {
  ggplot(penguins.mass, aes(x = species, y = body_mass_g,fill=species)) + # name the plot exploratory.data so it can be called without copying out the code
    geom_violin(alpha=0.65,show.legend = FALSE)+
    ylim(0, 6500) + # make the y axis begin from 0 so it is not truncated
    labs(title ="Violin plot to show the distribution of body masses in three penguin species", x="Penguin Species",y="Body Mass (g)")+ # give the plot a title and axis labels
    geom_jitter(width=0.3,random_seed=0,alpha=1,size=0.5,show.legend = FALSE)+ # overlay the datapoints onto the plot
    scale_fill_manual(values = c("Adelie"="darkorange","Chinstrap"="purple","Gentoo"="cyan4"))+ # colourcode the species
    theme(plot.title=element_text(size=9),
          axis.title.x=element_text(size=9),
          axis.title.y=element_text(size=9))+ # change the text size
    theme_bw()
}


#function for saving the plot as svg
save_function <- function(penguins.mass,
                        filename, size, scaling){
  size_inches = 10
  scaling = 1
  svglite("figures/save.plot.svg", 
          width = size_inches, height = size_inches, scaling = scaling)
  exploratory.plot<-plot_function(penguins.mass) 
  print(exploratory.plot)
  dev.off()
}



