# AS_Thesis_AMPSpiderSilk
## EST Data
To slect data, we focus on samples than contain at least one silk gland in tissue sample. All EST data are in EST-data directory. Five spider species data were collected from NCBI-EST database in FASTA format. feature_info file contain information about biosample id, spider species, used vector, insertion region, primers and tissue type. 
## EST Data pre-traetment
Before all analysis, fasta files where modified using regular expressions to get adequate format for TCGIL cluster tool software. Regular expression used for modified reads was:
~~~
>([\w+\d+\.]*)\s*([\w+\d+\_\-]*)\s*[\w+\d+\s*\'\-\,\:]* \w+$

~~~
And mathches was replaced to:
~~~
>et|\1_\2
~~~
Diffent problems in TGICL package instalation did not allow us to use it. However, EST data keep change name
### Vector clipping
In order to minimize the chance to cluster unreleated sequences, we check if sequences were already taken away vector sequences using Figaro and cross_match packages. Figaro use a statistics model to search kmer in 5' sequences, while cross_match use vector sequences to look for adapters sequences in EST data and replace them by "X". 
Figaro and cross_match were use and no adapters sequencse were found in EST sequences. 

## EST Data cluster 

In order to specify an optimal identty porcentage to run clustering process we use MeshClust with diifferent identity porcentages (id %). We run differetn clustering process changing id % from 0.65 to 0.90 with an increase of 0.05. Shell scripts used for this are in clusters_files directory ( [cluster_data.sh](https://github.com/alexsanyum/AS_Thesis_AMPSpiderSilk/blob/master/clusters_files/cluster_data.sh) and run_all_clusters.sh). Using a python script we estimate the number and mean size of each clusters. Result plot is in this repository as permutaciones.pdf. Used script is avaible in clusters_files directory.

~~~
bin/meshclust ../EST_data/*.fasta --id 0.60 --kmer 5 --delta 5 --output *.clstr --iterations 20 --align --sample 3000 --pivot 40 --threads 1
~~~
Clusters files are avaible in clusters_files directory
## AMP database
A databse of antimicrobial peptides was obtain from CAMP database. In this, peptides was searching looking for target organisms that spider silk was reported to inhibit. We recuperate four data sets for *Escherichia coli*, *Candida albicans*, *Staphylococcus aureus* and *Acinetobacter baumannii*. We looked for antimicrobial peptides that inhibit all these microorganisms. For this, we use the next command line tool.
~~~
$ cut -d ";" -f1,8 CAMP_C_albicans.txt > CAMP_C_albicans_sequences.txt
$ cut -d ";" -f1,8 CAMP_E_coli.txt > CAMP_E_coli_sequences.txt
$ cut -d ";" -f1,8 CAMP_S_aureus.txt > CAMP_S_aureus_sequences.txt
$ cut -d ";" -f1,8 CAMP_A_baumannii.txt > CAMP_A_baumannii_sequences.txt
$ cat CAMP_E_coli_sequences.txt CAMP_S_aureus_sequences.txt CAMP_A_baumini_sequences.txt CAMP_C_albicans_sequences.txt > CAMP_sequences.txt 
$ sort -u  CAMP_sequences.txt > CAMP_uniq_peptides.txt

~~~
