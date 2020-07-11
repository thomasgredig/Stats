path.DATA = '../data/world-university-rankings'
path.FIGS = '../images'
getwd()

cwurData <- read.csv(file.path(path.DATA,"cwurData.csv"))
educationExpenditure <- read.csv(file.path(path.DATA,"education_expenditure_supplementary_data.csv"))
educationalAttainment <- read.csv(file.path(path.DATA,"educational_attainment_supplementary_data.csv"))
schoolCountry <- read.csv(file.path(path.DATA,"school_and_country_table.csv"))
shanghaiData <- read.csv(file.path(path.DATA,"shanghaiData.csv"))
timesData <- read.csv(file.path(path.DATA,"timesData.csv"),
                      stringsAsFactors = FALSE)

d = read.csv(file.path(path.DATA,'population-by-country-2015.csv'))

