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

ggplot() +
  geom_bar(data = Russia_entries,
             aes(x %>% 
                   group_by(year) %>% summarise(best = sum(best))))

Russia_total_per_year <- Russia_entries %>% group_by(year) %>% 
  summarise(best = sum(best))

ggplot() +
  geom_line(data = Russia_total_per_year, 
            aes(x = year, y = best))
ggplot() +
  geom_point(data = Russia_total_per_year,
            aes(x = year, y = best))

USA_total_per_year <- USA_entries %>% group_by(year) %>% 
  summarise(best = sum(best))






