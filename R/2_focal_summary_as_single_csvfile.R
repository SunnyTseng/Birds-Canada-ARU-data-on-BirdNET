
# library -----------------------------------------------------------------

library(tidyverse)
library(here)
library(utils)


# main code here ----------------------------------------------------------

site_data <- list.files(path = here("data", "cleaned", "focal"), 
                        pattern = ".csv",
                        full.names = TRUE,
                        recursive = TRUE) %>%
  .[!grepl("random", .)] %>%
  lapply(FUN = read_csv) %>%
  bind_rows()

write_csv(site_data, here("data", "cleaned", "focal_summary_all.csv"))
