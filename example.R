
# Munge original data -----------------------------------------------------

origData = munge_orig_dat(example = T)

# Visualize original data -------------------------------------------------

plot_orig_data(data = origData,
               example = F,
               print = T)
plot_timeDiff(data = origData,
              example = F,
              print = T)
plot_richness(data = origData,
              example = F,
              print = T)

# Calculate distance travelled and derviatves of this ---------------------

distances = calculate_distanceTravelled(origData, derivs = T)


# Calculate FI, VI, and early warning signals --------------------------------------------------------

# Uses a moving window analysis to calculate FI and Vi within each window
results <-
    rdm_window_analysis(
        origData,
        winMove = 0.25,
        overrideSiteErr = F,
        min.window.dat = 2,
        fi.equation = "7.12",
        to.calc = 'VI'
    )

results$FI_VI %>%
    gather(key = index_type, value = index_value, FI, VI) %>%
    ggplot(mapping = aes(x = winStop, y = index_value)) +
    facet_wrap(~index_type) +
    geom_line()
# END RUN --------------------------------------------------------
