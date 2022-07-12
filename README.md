# Discovery of antimicrobial peptides of spider silk glands using Expressed Sequence Tags data
This repository contains all data, methods and scripts used for the thesis Discovery of antimicrobial peptides of spider silk glands using Expressed Sequence Tags data.

## ISCB Student Council Symposium 2022 - Poster 
Next poster was presented in the SCS 2022. 
![](/sanyumale_Sanchez_Alex_Discovery_of_antimicrobial.pdf)
## Pipeline 
Next grahp describes the desing and used pipeline
![](/pipeline.png)

## 1. Expressed Sequence Tag (EST) data
EST data used in this thesis were collect from NCBI database. We focus on nucleotide sequences of spiders species that were obtained from at least one spider silk gland. We use next key words: spider, silk gland, mRNA, cDNA in EST-NCBI database. Reads were download in fasta format. All sequences are available in [EST_data](/EST_data) directory. There is also a [feature file](/EST_data/feature_info) that contains biosample ID, vectors used and tissues for each data set. 
We found entries for next species:
* *Latrodectus hesperus*
* *Leucauge venusta*
* *Nephila antipodiana*
* *Parasteatoda tepidariorum*
* *Steatoga grossa*

## 2. Vector clipping 
In order to avoid to cluster non related or paralogous sequences we check out if reads have cloning vectors residues on. For this we use [Figaro](http://amos.sourceforge.net/wiki/index.php?title=Figaro) and [cross_match](http://www.phrap.org/phredphrapconsed.html) programs. Figaro use a statistical model and return a file with 5' trim point and cross_match compare reads with the vector and replace vector residue by X in the sequences. 
Figaro was used with next example command line:
~~~
figaro -F EST_data.fasta -P trim_points_EST 
~~~ 
cross_match was use with next example line:
~~~
./cross_match EST_data.fasta vector.fasta
~~~
No vector residues were found in each data set
## 3. Cluster 
We cluster EST data using [MeShClust](https://github.com/BioinformaticsToolsmith/MeShClust) software. Identity percentage id% is the most important parameter while clustering. In order to determinate an optimal id%, we permutate this value from 0.60 to 0.90 and analyze the number and mean of clusters for each data set. All cluster are available in [clusters_files](/clusters_files) directory. Plots of number and mean are avaialable [here](/clusters_files/permutaciones.pdf). Based on that analysis, we choose id%= 0.75.
Next code example was use to cluster data:
~~~
/MeShClust/bin/meshclust ../EST_data/SEQUENCES.fasta --id 0.75 --kmer 5 --delta 5 --output SEQUENCES_0.75.clstr --iterations 20 --align --sample 3000 --pivot 40 --threads 1
~~~
After that, all clusters with more than one sequence where align using Muscle to obtain consensus sequences.
## 4. 'N' treatment
Step 7 use a program that do not support sequences with 'N' in reads. For that, we first separated sequences that do not contain a 'N'.
## 5. 'N' treatment - sequences with N
We determinate 'N' percentage for each read. Sequences with a N% greater than 10 % were remove.
## 6. 'N' treatment - trim sequences
Sequences with N% less than 10% were analyze to determinate optimal treatment. For that we calculate number and frequency of N in each position for each data set. Next plots are a example of those results: [N_count](/no_clstrd_seqs/with_N_seqs/Leucauge_venusta_Ncount.pdf), [N_frequency](/no_clstrd_seqs/with_N_seqs/Leucauge_venusta_Nfreq.pdf). Based on that analysis of reach data set, we decide to trim sequences in N sites and keep reads with more than 100 bp. 

## 7. Open Reading Frame (ORF) determination.
In order to avoid to analyze all possible ORFs, we determinate the chance of ORFs to be coding using [MiPepid](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-019-3033-9) program. MiPepid use machine learning to determinate if smalls ORF of a fasta file are coding or not and the chance of that. MiPepid does not support N-char. This program returns a CSV table with each ORF, coding information and chance. 
Next example command line was use with both no N and N-treated sequences:
~~~
python3 ./src/mipepid.py SEQUENCES.fasta ORF_SEQUENCES.csv
~~~
All csv files are available [here](/mipepdi_results). 
## 8 and 9. Translate
We translate ORF that were coding and has a chance greater than 0.90. ORF were translated to aminoacid sequences using SeqIO module of biopython using standard genetic code table. 
## 10. Remove duplicated sequences
We use next [jupyter-notebook](/translated_seqs/merge_prot_sequences.ipynb) to remove duplicated aminoacids sequences.
## 11. LAMP database
In order to compare translated sequences with an antimicrobial database, we download LAMP2 database. [LAMP](http://biotechlab.fudan.edu.cn/database/lamp/browse.php) is a database of antimicrobial peptides with 23253 AMP sequences. LAMP data base was download in fasta format and a blast database were created with next command line:
~~~
./makeblastdb -in LAMP2.FASTA -parse_seqids -blastdb_version 5 -title "LAMP" -dbtype prot
~~~
## 12. Blast
We use blastp to compare translated sequences against LAMP database. In order to determinate optimal e-value paramete, we permutate this value from 1E-1 to 1E-4 and analiyze number of hit and no hit sequences foe each one. We choose e-value 1E-4. Next example command line was use:
~~~
blastp -db LAMP2.FASTA -query TRANSLATED_SEQUENCES.fasta -evalue 0.0001 -otfmt "10" -out TRANSLATED_SEQUENCES.blst
~~~
All blast are available in [blast_results](/blast_results) directory
## 13. HMM
No hit sequences were analyzed with HMM of AMPs. [CAMPSign](http://www.campsign.bicnirrh.res.in/) is an online tool that allow to compare amino acids sequences against 45 HMM profiles of AMP families that are in [CAMPR3](http://www.camp.bicnirrh.res.in/) database.
