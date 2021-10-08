---
title: notes on importing data
author: Ben Taft
copyright: (C) Higher Expectations for Racine County Youth
date: 21 September 2021
---

# Importing Data from the YWCA's "National Clearinghouse" Source

The observations are not students, they are individual school terms for a student!

## Dates

The table is not consistent in how it encodes dates.
Some of them are in 'MM/DD/YYYY' format.
Others are in 'YYYYMMDD' format.
There are also 'N/A's interspersed in some rows.
Tidyverse is not amused.

###  Use a spreadsheet to

1. replace 'N/A's with blank fields.
1. reformat dates to 'YYYY-MM-DD' format.

## Field Descriptions

### student unique id

This string field is actually **5** fields concatenated together.
The format is abcddddd_ee[e]

1. **Location**: the first character is either
   - 'M', for Milwaukee
   - 'R', for Racine.
1. **Status**: the second character is one of
   - 'A', for 'Active'
   - 'G', for 'Graduated'
   - 'R', for (maybe?) 'Transferred'
   - 'U', for 'Unsuccessful'
1. **Degree Type**: the third character is one of
   - 'A' for (maybe?) 'Active'
   - 'G' for 'GED'
   - 'H' for 'HSED'
   - 'I' for (maybe?) 'Incomplete'
1. **ID**: the next 5 characters are a 5-digit ID number
1. **initials**: the characters after the '_' are 2-3 initials from the students' names.

### grad date

Presumably, the date on which the student completed the high school equivalency program.

### Search Date

These seem biweekly, but are definitely not.
I have no idea what the sampling protocol was.
Look for duplicate rows that only differ by this field?

### College Code/Branch

This string field is actually **2** fields concatenated together.
The format is aaaaaa-bb

1. **College** is a six-digit unique identifier for a school.
1. **Branch** is a two-digit code for a specific satellite campus

### Public / Private

A string field that should be binary.
Instead, it has these two levels:

- Public
- Private

### Enrollment Begin

A date field that ranges from 19 January, 2016 to 16 February 2021.
It contains 8 missing values as of today.

### Enrollment End

A date field that ranges from 19 May, 2016 to 21 May 2021.
It contains 8 missing values as of today.

### Enrollment Status

There are **7** different categories that describes how a student was enrolled during a term.

1. **F**: Full time
1. **Q**: 3/4 time
1. **H**: 1/2 time
1. **L**: less than 1/2 time
1. **A**: leave of absence
1. **W**: withdrew
1. **D**: died :(

### Class Level

The data define **14** different kinds of class level.

1. Undergraduate levels
   1. **F**: Freshman
   1. **S**: Sophomore
   1. **J**: Junior
   1. **R**: Senior
   1. **C**: Certificate
   1. **N**: Unspecified
   1. **B**: Bachelor's
1. Graduate levels
   1. **M**: Master’s
   1. **D**: Doctoral
   1. **P**: Postdoctorate
   1. **L**: First Professional
1. Other levels
   1. **G**: Unspecified (Graduate/Professional)
   1. **A**: Associate's
   1. **T**: Post Baccalaureate Certificate

### Fields About Declared Major

There are several of these, to allow for multiple majors.
They are very sparse.
Each declared major has two fields: a text name and a (possibly more standardized) code.

### College Sequence

This identifies groups of school terms that correspond to one matriculation, e.g. at MATC.
It also came sparse because some of the schools only reported the sequence number for the first term of a matriculation.
I used Calc to fill in empty cells with what seemed to be the correct sequence number.
