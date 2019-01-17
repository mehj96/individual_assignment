library('tidyverse')

glimpse(Russia_entries)
ggplot() +
  geom_area(data = Russia_entries, 
             aes(x = year, y = best), color = 'blue')


ggplot() +
  geom_area(data = USA_entries, 
            aes(x = year, y = best), color = 'red') +
              labs(title = "Casualties in the USA over the past 20 Years")


ggplot() +
  geom_bar(data = Russia_entries, 
            aes(x = type_of_violence), color = 'red', fill = 'red') +
              labs(title = "Types of Violence in Russia", 
                   x = "Type of Violence", y = "Occurrences")

# group total casualties (best) by year.

# did NOT WORK
ggplot() +
  geom_bar(data = Russia_entries,
             aes(x %>% 
                   group_by(year) %>% summarise(best = sum(best))))

# DID WORK! created new dataset of summarized data
Russia_total_per_year <- Russia_entries %>% group_by(year) %>% 
  summarise(best = sum(best))

ggplot() +
  geom_line(data = Russia_total_per_year, 
            aes(x = year, y = best))
ggplot() +
  geom_point(data = Russia_total_per_year,
            aes(x = year, y = best, size = best))

# created like with RUS summary of data for USA
USA_total_per_year <- USA_entries %>% group_by(year) %>% 
  summarise(best = sum(best))


# Next two commands: Final version showing total casualties per year in USA and RUS

ggplot() +
  geom_point(data = USA_total_per_year,
             aes(x = year, y = best), color = 'dark turquoise', size = 3) +
  labs(title = "Total Casualties in the USA every Year", x = "Year", 
       y= "Number of Casualties")

ggplot() +
  geom_point(data = Russia_total_per_year,
             aes(x = year, y = best), color = 'dark turquoise', size = 3) +
  labs(title = "Total Casualties in Russia every Year", x = "Year", 
       y= "Number of Casualties")

# graphs showing types of violence most common in USA and Russia.

# for RUS
ggplot() +
  geom_bar(data = Russia_entries, 
           aes(x = type_of_violence), color = 'red', fill = 'red') +
  labs(title = "Types of Violence in Russia", 
       x = "Type of Violence", y = "Occurrences")

ggplot() +
  geom_bar(data = USA_entries, 
           aes(x = type_of_violence), color = 'red', fill = 'red') +
  labs(title = "Types of Violence in the USA", 
       x = "Type of Violence", y = "Occurrences")



