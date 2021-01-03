# Discovery of antimicrobial peptides of spider silk glands using Expressed Sequence Tags data
This repository contains all data, methods and scripts used for the thesis Discovery of antimicrobial peptides of spider silk glands using Expressed Sequence Tags data

## Pipeline 
Next grahp describes the desing and used pipeline
![](/pipeline.png)

## 1. Expressed Sequence Tag (EST) data
EST data used in this thesis were collect from NCBI database. We focus on nucleotic sequences of spiders species that were obtained from at least one spider silk gland. We use next key words: spider, silk gland, mRNA, cDNA in EST-NCBI database. We found entries for next species:
* *Latrodectus hesperus*
* *Leucauge venusta*
* *Nephila antipodiana*
* *Parasteatoda tepidariorum*
* *Steatoga grossa*
Reads were download in fasta format. All sequences are avialable in [EST_data](/EST_data) directory. There is also a [feature file](/EST_data/feature_info) that contains biosample ID, vectors used and tissues for each data set. 
## 2. Vector clipping 
In order to avoid to cluster non related or paralogous sequences we check out if reads have clonation vectors residues on. For this we use [Figaro](http://amos.sourceforge.net/wiki/index.php?title=Figaro) and [cross_match](http://www.phrap.org/phredphrapconsed.html) programs. Figaro use a statistical model and return a file with 5' trim point and cross_match compare reads with the vector and replace vector residue by X in the sequences. 
Figaro were used with next example command line:
~~~
figaro -F EST_data.fasta -P trim_points_EST 
~~~ 
cross_match were use with next example line:
~~~
./cross_match EST_data.fasta vector.fasta
~~~
No vector residues were found in each data set
## 3. Cluster 
We cluster EST data using [MeShClust](https://github.com/BioinformaticsToolsmith/MeShClust) software. Identity porcentage id% is the most important parameter while clustering. In order to determinate an optimal id%, we permutate this value from 0.60 to 0.90 and analyze the number and mean of clusters for each data set. All cluster are avialable in [clusters_files](/clusters_files) directory. Plots of number and mean are avaialable [here](/clusters_files/permutaciones.pdf). Based on that analysis, we choose id%= 0.75.
Next code example were use to cluster data:
~~~
/MeShClust/bin/meshclust ../EST_data/SEQUENCES.fasta --id 0.75 --kmer 5 --delta 5 --output SEQUENCES_0.75.clstr --iterations 20 --align --sample 3000 --pivot 40 --threads 1
~~~
After that, all clusters with more than one sequences where alignent using Muscle to obtain consensus sequences.
## 4. 'N' treatment
Step 7 use a program that do not support sequences with 'N' in reads. For that, we first separated sequences that do not contain a 'N'.
## 5. 'N' treatment - sequences with N
We determinate 'N' porcentage for each reads. Sequences with a N% greater than were remove.
## 6. 'N' treatment - trim sequences
Sequences with N% less tahn 10% were analyze to determinate optimal treatmnet. For that we calculate number and frequency of N in each position for each data set. Next plots are a example of those results: [N_count](/no_clstrd_seqs/with_N_seqs/Leucauge_venusta_Ncount.pdf), [N_frequency](/no_clstrd_seqs/with_N_seqs/Leucauge_venusta_Nfreq.pdf). Based on that analysis of reach data set, we decide to trim sequencs in N sites and keep reads with more than 100 bp. 
