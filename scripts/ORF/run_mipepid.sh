#! /bin/bash
cd ~/AMP_thesis_scripts/packages/MiPepid/

python3 ./src/mipepid.py ~/AS_Thesis_AMPSpiderSilk/ORF/inputsequences/withreverse_Latrodectushesperus.fasta ~/AS_Thesis_AMPSpiderSilk/ORF/orf_results/Latrodectushesperus.csv
python3 ./src/mipepid.py ~/AS_Thesis_AMPSpiderSilk/ORF/inputsequences/withreverse_Leucaugevenusta_2.fasta ~/AS_Thesis_AMPSpiderSilk/ORF/orf_results/Leucaugevenusta_2.csv
python3 ./src/mipepid.py ~/AS_Thesis_AMPSpiderSilk/ORF/inputsequences/withreverse_Leucaugevenusta.fasta ~/AS_Thesis_AMPSpiderSilk/ORF/orf_results/Leucaugevenusta.csv
python3 ./src/mipepid.py ~/AS_Thesis_AMPSpiderSilk/ORF/inputsequences/withreverse_Nephilaantipodiana.fasta ~/AS_Thesis_AMPSpiderSilk/ORF/orf_results/Nephilaantipodiana.csv
python3 ./src/mipepid.py ~/AS_Thesis_AMPSpiderSilk/ORF/inputsequences/withreverse_Parasteatodatepidariorum.fasta ~/AS_Thesis_AMPSpiderSilk/ORF/orf_results/Parasteatodatepidariorum.csv
python3 ./src/mipepid.py ~/AS_Thesis_AMPSpiderSilk/ORF/inputsequences/withreverse_Steatodagrossa.fasta ~/AS_Thesis_AMPSpiderSilk/ORF/orf_results/Steatodagrossa.csv
