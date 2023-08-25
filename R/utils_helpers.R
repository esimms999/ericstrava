#' helpers
#'
#' @description Create df from activities.csv data, keeping columns of interest.
#'
#' @return Data frame: activities
#' @importFrom dplyr filter mutate rename select
#' @importFrom lubridate mdy
#' @importFrom readr read_csv
#' @noRd
create_activities <- function() {
  activities <- readr::read_csv("inst/extdata/activities.csv") %>%
    dplyr::rename(ID = `Activity ID`, Type = `Activity Type`, Distance_m = `Distance...18`,
                  Time = `Moving Time`) %>%
    dplyr::filter(Type == "Ride") %>%
    dplyr::mutate(Date = lubridate::mdy(stringr::str_sub(`Activity Date`, 1, 12)),
                  Distance_km = Distance_m/1000,
                  Distance_mi = Distance_km * 5/8,
                  Time_hr = Time/3600,
                  Avg_V_kph = Distance_km / Time_hr,
                  Avg_V_mph = Distance_mi / Time_hr) %>%
    dplyr::select(ID, Type, Date, Distance_km, Distance_mi, Time_hr, Avg_V_kph, Avg_V_mph)
}


