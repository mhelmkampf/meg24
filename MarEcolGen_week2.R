### =========================================================================###
### Marine Ecological Genetics 2024                                          ###
### 02. Hardy-Weinberg equilibrium | computer practical                      ###
### ======================================================================== ###


### Preparations and notes

# Set working directory to the location of this script
# e.g. by using the "Files" tab in the bottom right panel.
# You can check your working directory in the console with getwd()

# Solutions and hints can be found at the bottom of the page



### ============================================================================
### Exercise 1: Manual calculation (see 02_hwe.pdf)

### What are the frequencies of the yellow and blue alleles?

n <- 10                        # number of individuals
y <- ((6 * 2) + 1) / (n * 2)   # frequency of yellow allele
# b <- ...


### What are the expected genotype frequencies?

# yy_exp <- ...
# ...


### Is the population in Hardy-Weinberg equilibrium?

# This can be tested using Pearson's Chi-squared test
help(chisq.test)

# First, we need to enter our data into a matrix
genotypes <- data.frame(row.names = c("yy", "yb", "bb"),
                        "N_observed" = c(6, 1, 3),
                        "freq_expected" = c(yy_exp, yb_exp, bb_exp)
)

# Then we can run the test
# chisq.test(...)


### What is the fixation index and what does it tell us?
# F_is <- ...



### ============================================================================
### Exercise 2: Genepop format

### Install and load required R packages
install.packages("adegenet")
install.packages("pegas")
library(adegenet)
library(pegas)


### Read in data from Genepop format file
help(read.genepop)
yellowblue <- read.genepop("data/popgen/yellow_blue.gen", ncode = 1)


### Access data in the new genind object
yellowblue
yellowblue@tab
yellowblue@loc.n.all
yellowblue@all.names


### Test for HWE
hw.test(yellowblue)



### ============================================================================
### Exercise 3: Microsatellite data of Caribbean reef fish populations

### Read in data from Genepop format file
barbados <- read.genepop("data/popgen/puella_barbados.gen", ncode = 3)
barbados


### What is the most / least diverse locus in terms of number of alleles?


### Is this population in HWE? What does this tell us?


### Alternative test for HWE, with result over all alleles (change file ending from .gen to .txt first)
install.packages("genepop")
library(genepop)

test_HW("data/popgen/puella_barbados.txt", outputFile = "HW_barbados.txt")


### Load and test all Caribbean populations (file data/popgen/puella_caribbean.gen)


### What patterns can you identify regarding loci and populations?



### ============================================================================
### Exercise 1 solution

### Genotype-phenotype relationship: yy = yellow, yb = green, bb = blue phenotype


### Allele frequencies
n <- 10                        # number of individuals
y <- ((6 * 2) + 1) / (n * 2)   # yellow allele frequency
b <- ((3 * 2) + 1) / (n * 2)   # blue allele frequency


### Expected genotype frequencies
yy_exp <- y ^ 2
yb_exp <- 2 * y * b
bb_exp <- b ^ 2


### Enter data into data frame for test
genotypes <- data.frame(row.names = c("yy", "yb", "bb"),
                        "N_observed" = c(6, 1, 3),
                        "freq_expected" = c(yy_exp, yb_exp, bb_exp)
                        )


### Perform Pearson's chi-squared test of goodness of fit
test <- chisq.test(genotypes$N_observed, p = genotypes$freq_expected)
test
pchisq(test$statistic, df = 1, lower.tail = FALSE)   # recalculate p with 1 degree of freedom

# Note: The Chi-square test is not actually recommended for such low sample sizes, 
# we use in this example because it is appropriate for most real world data


### Heterozygosity
H_obs <- 1 / n
H_exp <- 2 * y * b


### Fixation index
F_is <- (H_exp - H_obs) / H_exp



### ============================================================================
### Exercise 3 solution

## What is the most / least diverse locus in terms of number of alleles?
barbados@loc.n.all   # Number of loci and alleles
barbados@all.names   # Names of alleles for each locus


### Is this population in HWE?
hw.test(barbados)


### Load and test all Caribbean populations
caribbean <- read.genepop("data/popgen/puella_caribbean.gen", ncode = 3)
test_HW("data/popgen/puella_caribbean.txt", outputFile = "HW_caribbean.txt")
hw.test(caribbean)
