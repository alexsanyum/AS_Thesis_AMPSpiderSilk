# AS_Thesis_AMPSpiderSilk
## EST Data
All EST data are in EST-data directory. Five spider species data were collected from NCBI-EST database in FASTA format. feature_info file contain information about biosamplre id, spider species, used vector, insertion region, primers and tissue type. 
## EST Data pre-traetment
Before all analysis, fasta files where modified using regular expressions to get adequate format for TCGIL cluster tool software. Regular expression used for modified reads was:
~~~
>([\w+\d+\.]*)\s*([\w+\d+\_\-]*)\s*[\w+\d+\s*\'\-\,\:]* \w+$

~~~
And mathches was replaced to:
~~~
>et|\1_\2
~~~
### Vector clipping
In order to minimize the chance to culster unreleated sequences, we cut vector sequences in ESTs. For this, we develop an python scripts using jupyter notebook that align fasta sequences with insertion region of plasmids used in clonation. 
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
