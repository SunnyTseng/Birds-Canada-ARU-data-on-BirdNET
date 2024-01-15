

# library -----------------------------------------------------------------
library(tidyverse)
library(here)

# import data  ------------------------------------------------------------
site <- "AxeLake"
location <- 2
aru_id <- 7859
type <- "Mini"
site_folder <- paste(site, location, aru_id, type, sep = "_")

site_data <- list.files(path = here("data", "raw", site_folder), 
                        pattern = ".csv",
                        full.names = TRUE,
                        recursive = TRUE) %>%
  .[!grepl("random", .)] %>%
  lapply(FUN = read_csv,
         col_types = cols(.default = "d", 
                          filepath = "c",
                          scientific_name = "c",
                          common_name = "c",
                          species_list = "c",
                          model = "c")) %>%
  bind_rows()



# data wrangling ----------------------------------------------------------

if(type == "BARLT"){
  ### for BARLT
  site_data_clean <- site_data %>%
    mutate(site = site,
           location = location,
           aru_id = aru_id,
           type = type,
           date = str_extract(filepath, pattern = "\\d{8}(?=T)"), 
           hour = str_extract(filepath, pattern = "(?<=T)\\d{2}")) %>%
    select(site, location, aru_id, type, date, hour, start, end, scientific_name, common_name, confidence, filepath)
  
}else{
  ### for Mini
  site_data_clean <- site_data %>%
    mutate(site = site,
           location = location,
           aru_id = aru_id,
           type = type,
           date = filepath %>% str_split_i("SMA", i = 2) %>% str_split_i("_", i = 2),
           hour = filepath %>% str_split_i("SMA", i = 2) %>% str_split_i("_", i = 3) %>% str_sub(start = 1, end = 2)) %>%
    select(site, location, aru_id, type, date, hour, start, end, scientific_name, common_name, confidence, filepath)
}


# saving the final file ---------------------------------------------------
write_csv(site_data_clean, here("data", "cleaned", paste0(site_folder, ".csv")))




