library('tidyverse')

glimpse(Russia_entries)
ggplot() +
  geom_area(data = Russia_entries, 
             aes(x = year, y = best), color = 'blue')


ggplot() +
  geom_area(data = USA_entries, 
            aes(x = year, y = best), color = 'red') +
              labs(title = "Casualties in the USA over the past 20 Years")


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
             aes(x = year, y = best), color = 'dark green', size = 3, alpha = 0.6) +
  labs(title = "Total Casualties in the USA every Year", x = "Year", 
       y= "Number of Casualties")

ggplot() +
  geom_point(data = Russia_total_per_year,
             aes(x = year, y = best), color = 'dark red', size = 3) +
  labs(title = "Total Casualties in Russia every Year", x = "Year", 
       y= "Number of Casualties")

# graphs showing types of violence most common in USA and Russia.

# for RUS
ggplot() +
  geom_bar(data = Russia_entries, 
           aes(x = type_of_violence), color = 'dark red', fill = 'dark red') +
  labs(title = "Types of Conflicts in Russia", 
       x = "Type of Conflict", y = "Occurrences")

# note only type 1 violence in USA!
ggplot() +
  geom_bar(data = USA_entries, 
           aes(x = type_of_violence), color = 'red', fill = 'red') +
  labs(title = "Types of Conflicts in the USA", 
       x = "Type of Conflict", y = "Occurrences")

# create subset of Russian total casualties data between 2001 and 2012 to be more comparable to USA.

Russia20012015 <- Russia_total_per_year %>% select('year', 'best') %>% filter(year > 2000)
Russia20012012 <- Russia20012015 %>% select('year', 'best') %>% filter(year < 2013)

# comparable Russian violence occurrences over 2002-2012 (good for comparison to USA data over same timeframe)
ggplot() +
  geom_point(data = Russia20012012,
             aes(x = year, y = best), color = 'dark turquoise', size = 3) +
  labs(title = "Total Casualties in Russia every Year", x = "Year", 
       y= "Number of Casualties")

# overlaid graph Russia and USA 2001 to 2012.
ggplot() +
  geom_line(data = Russia20012012,
             aes(x = year, y = best), color = 'dark red', size = 1.5)  +
  geom_line(data = USA_total_per_year,
             aes(x = year, y = best), color = 'dark green', size = 1.5, alpha = 0.5) +
  labs(title = "Total Casualties in the USA and Russia every Year", x = "Year", 
       y= "Number of Casualties")


