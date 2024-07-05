library(data.table)
df=fread("c:/code/python/output/modadot.csv", header=TRUE, sep=",")
df=fread("c:/code/python/output/Schools_full.csv", header=TRUE, sep=",")
keywords=c("תיכון")
df[,SHEM_MOSAD]
df[keywords %in% SHEM_MOSAD]
# Define the string you are looking for
search_string <- "תיכון"

# Use grepl to find rows where SHEM_MOSAD contains the search_string
rows_with_string <- grepl(search_string, df$SHEM_MOSAD, ignore.case = TRUE) # ignore.case = TRUE makes the search case-insensitive

# Subset df to get only those rows
df_with_string <- df[rows_with_string, ]
keywords=c(
    'חבד',
    'חב"ד',
    'חב""ד',
    'חב"""ד',
    'חב""""ד',
    'אור מנחם',
    'בית חנה',
    'בית חיה',
    'בית רבקה',
    'צבאות מנחם',
    'תומכי תמימים',
    'אור תמימים')
df[,SHEM_RASHUT_YY]
df[]
colnames(df)
pattern=paste(keywords, collapse="|")
sub=df[grep(pattern, SHEM_MOSAD),.(SEMEL_MOSAD,SHEM_MOSAD,SHEM_MUTAV_MSI,MAAMAD_MISHPATI,KTOVET_MOSAD,MEGISH_LE_BAGRUT,SHEM_MUTAV_MSI)]

df[SEMEL_MOSAD=="140749"]
nrow(sub)
fwrite(sub,"c:/code/python/output/Schools_full_filtered.csv")
df <- fread("c:/code/python/output/schools2022.csv", header=TRUE, sep=",")
sub=df[SHANA_LOAZITH==2022][grep(pattern, SHEM_MOSAD),.(SEMEL_MOSAD,SHEM_MOSAD,MAAMAD_MISHPATI,KTOVET_MOSAD,PIKOH_YY,MEGISH_LE_BAGRUT,SHEM_MUTAV_MSI)]
df <- df[,.(SEMEL_MOSAD,SHEM_MOSAD,PIKOH_YY,SHEM_MUTAV_MSI,MAAMAD_MISHPATI,KTOVET_MOSAD)]
df[,.N,PIKOH_YY]
df[,Haredi:=as.numeric(PIKOH_YY=="חרדי")]
df[,Haredi_without_yeshivot:=as.numeric((PIKOH_YY=="חרדי"))&yeshiva!=1]
df[,Mamad_without_yeshivot:=as.numeric((PIKOH_YY=="ממלכתי דתי"))&yeshiva!=1]
df[,Mamad:=as.numeric(PIKOH_YY=="ממלכתי דתי")]
df[,Mamad:=as.numeric(PIKOH_YY=="ממלכתי דתי")]
df[grep("ישיבה",SHEM_MOSAD),yeshiva:=1]
df[grep("תמימים",SHEM_MOSAD),yeshiva:=1]
df[is.na(yeshiva),yeshiva:=0]
fwrite(df,"c:/code/python/output/schools2022_short.csv")
