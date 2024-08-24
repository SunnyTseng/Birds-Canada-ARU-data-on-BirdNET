
# library -----------------------------------------------------------------

library(tidyverse)
library(here)


# combine data ------------------------------------------------------------

site_data <- list.files(here("data", "cleaned", "all"),
                        pattern = ".csv",
                        full.names = TRUE,
                        recursive = TRUE) %>%
  map_df(~ read_csv(file = .))


write_csv(site_data, here("data", "cleaned", "all_species_single_file.csv"))
