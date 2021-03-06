# LOADING SOURCE FILES FOR GLY PHENO HARMONIZATION
# NOTE : you need to organize all of these files into a single directory. The input is then the absolutely path (ex: /User/username/Documents/.../gly_phenotype_files/) to that folder
get_pheno_data <- function(f.dir){
	library(openxlsx)
	# define file paths
	linker.file <- paste(f.dir, "freeze5b_sample_annot_2018-07-13.txt", sep="/")
	fhs.file <- paste(f.dir, "FHS_glycemicTraits_20170214_CS.ped", sep="/")
	fhs.pedigree <- paste(f.dir, "share_ped_010117.csv", sep="/")
	jhs.file <- paste(f.dir, "JHS_glycemictraits_29Mar2017.ped", sep="/")
	sas.file <- paste(f.dir, "SAS_LIULIN_20170212_glycemic_traits.ped", sep="/")
	cfs.file <- paste(f.dir, "CFS_12May17_glycemic_traits_Freeze4.ped", sep="/")
	amish.file <- paste(f.dir, "Amish_HuichunXu_May15th2017_glycemic_traits.ped", sep="/")
	gensalt.file <- paste(f.dir, "GenSalt_EA_XuenanMi_20170614_glycemic_traits.ped", sep="/")
	aric.EU.file <- paste(f.dir, "ARIC_EU_NDAYA_20161220_glycemic_traits_ped.csv", sep="/")
	aric.AF.file <- paste(f.dir, "ARIC_AA_NDAYA_20161220_glycemic_traits_ped.csv", sep="/")
	whi.HS.file <- paste(f.dir, "WHI_HA_MP_20170726_glycemic_traits.ped", sep="/")
	whi.EU.file <- paste(f.dir, "WHI_EU_MP_20170726_glycemic_traits.ped", sep="/")
	whi.AS.file <- paste(f.dir, "WHI_AS_MP_20170726_glycemic_traits.ped", sep="/")
	whi.AF.file <- paste(f.dir, "WHI_AA_MP_20170726_glycemic_traits.ped", sep="/")
	genestar.AF.file <- paste(f.dir, "GeneSTAR_AA_YANEK_20170720_glycemic_traits.ped", sep="/")
	genestar.EU.file <- paste(f.dir, "GeneSTAR_EU_YANEK_20170720_glycemic_traits.ped", sep="/")
	chs.file <- paste(f.dir, "CHS_FLOYD_201708018_glycemic_traits.PED", sep="/")
	mesa.HS.file <- paste(f.dir, "MESA_HA_ABIGAILBALDRIDGE_04JAN17_glycemic_traits_sidno.csv", sep="/")
	mesa.EU.file <- paste(f.dir, "MESA_EU_ABIGAILBALDRIDGE_04JAN17_glycemic_traits_sidno.csv", sep="/")
	mesa.AS.file <- paste(f.dir, "MESA_SA_ABIGAILBALDRIDGE_04JAN17_glycemic_traits_sidno.csv", sep="/")
	mesa.AF.file <- paste(f.dir, "MESA_AA_ABIGAILBALDRIDGE_04JAN17_glycemic_traits_sidno.csv", sep="/")
	genoa.file <- paste(f.dir, "GENOA_AA_BIELAK_20171124_glycemic_traits.ped", sep="/")
	#Add SAFS file
  #	safs.file <- paste(f.dir,'SAFSCVD_HA_MAHANEY_20170721_glycemic_traits.ped.csv',sep="/")
  #	safs.ids.file <- paste(f.dir,"SAFSCVD_PERALTA_09262017_nwd_mappingtable.csv",sep="/")
	goldn.file<- paste(f.dir,"GOLDN_Glycemic_20180312_SA.xlsx",sep="/")
	hg.file<- paste(f.dir,"HyperGEN_Topmed_Phenotype_Harmonization_Glycemic_Traits.csv",sep="/")
	safs.file<-paste(f.dir,"SAFSCVD_HA_MAHANEY_20170519_glycemic_traits.csv",sep="/")

	# load all the data
	linker <- read.table(linker.file, header=T)

	fhs <- read.table(fhs.file,header=T)
	share<-read.csv(fhs.pedigree,header=T)
	jhs <- read.table(jhs.file,na.strings="x",header=T)
	sas<-read.table(sas.file,header=T)
	cfs<-read.table(cfs.file,header=T)
	amish<-read.table(amish.file,header=T,na.strings=" ",sep="\t")
	gensalt<-read.table(gensalt.file,head=T)
	aric_ea<-read.table(aric.EU.file,header=T,sep=',')
	aric_aa<-read.csv(aric.AF.file,header=T,sep=',')
	whi_ha<-read.table(whi.HS.file,header=F,fill=T,na.strings=" ",sep="\t")
	whi_ea<-read.table(whi.EU.file,header=F,fill=T,na.strings=" ",sep="\t")
	whi_as<-read.table(whi.AS.file,header=F,fill=T,na.strings=" ",sep="\t")
	whi_aa<-read.table(whi.AF.file,header=F,fill=T,na.strings=" ",sep="\t")
	gs_aa<-read.table(genestar.AF.file,header=T)
	gs_ea<-read.table(genestar.EU.file,header=T)
	chs<-read.table(chs.file,header=T,fill=T,sep='\t')
	mesa_ha<-read.csv(mesa.HS.file,header=T)
	mesa_ea<-read.csv(mesa.EU.file,header=T)
	mesa_sa<-read.csv(mesa.AS.file,header=T)
	mesa_aa<-read.csv(mesa.AF.file,header=T)
	genoa<-read.table(genoa.file,header=T,fill=T,sep='\t',na.strings=" ")
#	safs = read.csv(safs.file, header=T,sep=',',as.is=TRUE) #n=2457 (n=2 Sequenced=0)
#  	safs.ids <- read.csv(safs.ids.file, header=T,sep=',',as.is=TRUE)
	goldn<-read.xlsx(goldn.file,1)	
	hg<-read.csv(hg.file,skip=1,header=T)
	colnames(hg) <- scan(hg.file,what="character",nlines=1,sep=",")
	safs<-read.csv(safs.file,header=T,as.is=T)
	sapply(ls(),function(x)get(x),simplify=F,USE.NAMES=T)
}