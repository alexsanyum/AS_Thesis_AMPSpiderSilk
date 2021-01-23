#!/usr/bin/env bash

cd ~/thesis/ncbi-blast-2.11.0+/bin/

blastp -db LAMP2.FASTA -query ~/AS_Thesis_AMPSpiderSilk/translated/nd_aaseqs/nd_Latrodectushesperus.fasta -evalue 0.0001 -outfmt "10" -out ~/AS_Thesis_AMPSpiderSilk/blast/nd_Latrodectushesperus.csv
blastp -db LAMP2.FASTA -query ~/AS_Thesis_AMPSpiderSilk/translated/nd_aaseqs/nd_Leucaugevenusta_2.fasta -evalue 0.0001 -outfmt "10" -out ~/AS_Thesis_AMPSpiderSilk/blast/nd_Leucaugevenusta_2.csv
blastp -db LAMP2.FASTA -query ~/AS_Thesis_AMPSpiderSilk/translated/nd_aaseqs/nd_Leucaugevenusta.fasta -evalue 0.0001 -outfmt "10" -out ~/AS_Thesis_AMPSpiderSilk/blast/nd_Leucaugevenusta.csv
blastp -db LAMP2.FASTA -query ~/AS_Thesis_AMPSpiderSilk/translated/nd_aaseqs/nd_Nephilaantipodiana.fasta -evalue 0.0001 -outfmt "10" -out ~/AS_Thesis_AMPSpiderSilk/blast/nd_Nephilaantipodiana.csv
blastp -db LAMP2.FASTA -query ~/AS_Thesis_AMPSpiderSilk/translated/nd_aaseqs/nd_Parasteatodatepidariorum.fasta -evalue 0.0001 -outfmt "10" -out ~/AS_Thesis_AMPSpiderSilk/blast/nd_Parasteatodatepidariorum.csv
blastp -db LAMP2.FASTA -query ~/AS_Thesis_AMPSpiderSilk/translated/nd_aaseqs/nd_Steatodagrossa.fasta -evalue 0.0001 -outfmt "10" -out ~/AS_Thesis_AMPSpiderSilk/blast/nd_Steatodagrossa.csv

