## Copyright (C) 2021 by Higher Expectations for Racine County

require(lubridate)

elapsed <- function (start_datetime,
                     end_datetime,
                     units="years") {

    as.numeric(lubridate::as.duration(lubridate::interval(start_datetime,
                                                          end_datetime)),
               units)
}
