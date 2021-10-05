#!/usr/bin/env bash

echo ${1}
cd ~/AS_Thesis_AMPSpiderSilk/clusters
mkdir cluster_${1}

~/thesis/MeShClust/bin/meshclust ~/AS_Thesis_AMPSpiderSilk/EST_data/Latrodectushesperus.fasta --id 0.${1} --kmer 5 --delta 5 --output ~/AS_Thesis_AMPSpiderSilk/clusters/cluster_${1}/Latrodectushesperus_clst_id_${1}.clstr --iterations 20 --align --sample 3000 --pivot 40 --threads 1  
~/thesis/MeShClust/bin/meshclust ~/AS_Thesis_AMPSpiderSilk/EST_data/Leucaugevenusta_2.fasta --id 0.${1} --kmer 5 --delta 5 --output ~/AS_Thesis_AMPSpiderSilk/clusters/cluster_${1}/Leucaugevenusta_2_clst_id_${1}.clstr --iterations 20 --align --sample 3000 --pivot 40 --threads 1  
~/thesis/MeShClust/bin/meshclust ~/AS_Thesis_AMPSpiderSilk/EST_data/Leucaugevenusta.fasta --id 0.${1} --kmer 5 --delta 5 --output ~/AS_Thesis_AMPSpiderSilk/clusters/cluster_${1}/Leucaugevenusta_clst_id_${1}.clstr --iterations 20 --align --sample 3000 --pivot 40 --threads 1  
~/thesis/MeShClust/bin/meshclust ~/AS_Thesis_AMPSpiderSilk/EST_data/Nephilaantipodiana.fasta --id 0.${1} --kmer 5 --delta 5 --output ~/AS_Thesis_AMPSpiderSilk/clusters/cluster_${1}/Nephilaantipodiana_clst_id_${1}.clstr --iterations 20 --align --sample 3000 --pivot 40 --threads 1  
~/thesis/MeShClust/bin/meshclust ~/AS_Thesis_AMPSpiderSilk/EST_data/Parasteatodatepidariorum.fasta --id 0.${1} --kmer 5 --delta 5 --output ~/AS_Thesis_AMPSpiderSilk/clusters/cluster_${1}/Parasteatodatepidariorum_clst_id_${1}.clstr --iterations 20 --align --sample 3000 --pivot 40 --threads 1  
~/thesis/MeShClust/bin/meshclust ~/AS_Thesis_AMPSpiderSilk/EST_data/Steatodagrossa.fasta --id 0.${1} --kmer 5 --delta 5 --output ~/AS_Thesis_AMPSpiderSilk/clusters/cluster_${1}/Steatodagrossa_clst_id_${1}.clstr --iterations 20 --align --sample 3000 --pivot 40 --threads 1  

