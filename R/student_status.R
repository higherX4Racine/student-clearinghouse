## Copyright (C) 2021 by Higher Expectations for Racine County

student_status <- function(graduation, activity) {
    if (any(graduation, na.rm = TRUE)) {
        return("Graduated")
    }
    if (any(activity, na.rm = TRUE)) {
        return("Within Graduation Window")
    }
    return("Past Graduation Window")
}
