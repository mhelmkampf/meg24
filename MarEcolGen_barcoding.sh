### =========================================================================###
### Exercises in Marine Ecological Genetics 2024                             ###
### 12. DNA barcoding                                                        ###
### ======================================================================== ###


### Preparations

# On Windows, install and launch BioEdit
# Zipped installation file provided in meg24/apps
# Or download from https://bioedit.software.informer.com/

# On Mac, launch 4Peaks
# Executable provided in meg24/apps

# Copy a pair of trace files of your choice to meg24/work
# seq_*F.ab1 and seq_*R.ab1


### ============================================================================
### Exercise 1: Extract COI barcodes from Sanger trace files

### Background – PCR / sequencing primer cocktail used for COI:

# VF2_t1    tgtaaaacgacggccagtCAACCAACCACAAAGACATTGGCAC
# FishF2_t1 tgtaaaacgacggccagtCGACTAATCATAAAGATATCGGCAC

# FishR2_t1 caggaaacagctatgacACTTCAGGGTGACCGAAGAATCAGAA
# FR1d_t1   caggaaacagctatgacACCTCAGGGTGTCCGAARAAYCARAA

# Amplifies approx. 650 bp fragment in 5' region of COI
# Primers are M13-tailed to allow DNA sequencing
# (Ivanova et al. 2007, Molecluar Ecology Notes, lower case = tail)


### View trace files

# Open your trace files in BioEdit (Windows) or 4Peaks (Mac)
# Note that each sample was sequenced in forward (F) and reverse (R) direction
# How many positions at the beginning (5') and end (3') look unreliable?


### Trim low quality 5' and 3' positions

# BioEdit: select range of positions to keep, copy selection (Ctrl + C) to plain text file
# 4Peaks: select range of positions to keep, crop (Cmd + K) and export as plain text file
# Save as seq_*F.tr, seq_*R.tr


### Reverse complement trimmed R sequence

# http://www.reverse-complement.com/
# Reverse complement seq_*R.tr file
# Save as seq_*R.rc


### Align sequences using MAFFT

# https://mafft.cbrc.jp/alignment/server/
# Paste seq_*F.tr and seq_*R.rc into input field and submit
# Go to "Fasta format" save downloaded file as seq_*.aln


### Create consensus sequence with Cons

# https://www.ebi.ac.uk/Tools/msa/emboss_cons/
# Select DNA and submit seq_*.aln alignment
# Save to file as seq_*.con
# Ideally, change sequence name in header to seq_*
# This is your barcode



### ============================================================================
### Exercise 2: Identify species based on COI barcode with BOLD

# Barcode of Life Data System (BOLD): http://www.boldsystems.org/index.php/
# Select Identification, Animal Identification (COI), Species Level Barcode Records
# Enter barcode sequence and submit

# How confident are you in the identification based on similarity score, 
# and the gap between within-BIN and NN distances (see BIN page)?

# Optinally, explore species and tree pages



### ============================================================================
### Alternative: identify barcode / species with BLAST and the NCBI nt database

# https://blast.ncbi.nlm.nih.gov/Blast.cgi
# Select Nucleotide BLAST, Nucleotide collection (nr/nt), megablast



### ============================================================================
### Solutions

### Species ID of samples

# 10: Oncorhynchus keta (Chum salmon / Keta-Lachs), 100%, large barcode gap
# 11: Gadus chalcogrammus (Alaska pollock / Paz. Pollack), 100%, small barcode gap
# 14: Platichthys flesus (European flounder / Flunder) or Pleuronectes sp., 100%, no barcode gap
# 15: Gadus chalcogrammus (Alaska pollock / Paz. Pollack), 100%, see above, small barcode gap
# 19: Gadus chalcogrammus (Alaska pollock / Paz. Pollack), 100%, see above, small barcode gap
# 20: Platichthys flesus (European flounder / Flunder) or Pleuronectes sp., 100%, small barcode gap
# 22: Gadus morhua (Atlantic cod / Kabeljau), 100%, small barcode gap
# 26: Gadus morhua (Atlantic cod / Kabeljau), 100%, small barcode gap
# 27:
# 28:
# 35: