#! /bin/bash

echo ${1}
~/thesis/MeShClust/bin/meshclust ../EST_data/Latrodectushesperus.fasta --id 0.${1} --kmer 5 --delta 5 --output Latrodectushesperus_clusters/Latrodectushesperus_0_${1}.clstr --iterations 20 --align --sample 3000 --pivot 40 --threads 1
~/thesis/MeShClust/bin/meshclust ../EST_data/Leucaugevenusta_2.fasta --id 0.${1} --kmer 5 --delta 5 --output Leucaugevenusta_2_clusters/Leucaugevenusta_2_0_${1}.clstr --iterations 20 --align --sample 3000 --pivot 40 --threads 1
~/thesis/MeShClust/bin/meshclust ../EST_data/Leucaugevenusta.fasta --id 0.${1} --kmer 5 --delta 5 --output Leucaugevenusta_clusters/Leucaugevenusta_0_${1}.clstr --iterations 20 --align --sample 3000 --pivot 40 --threads 1
~/thesis/MeShClust/bin/meshclust ../EST_data/Nephilaantipodiana.fasta --id 0.${1} --kmer 5 --delta 5 --output Nephilaantipodiana_clusters/Nephilaantipodiana_0_${1}.clstr --iterations 20 --align --sample 3000 --pivot 40 --threads 1
~/thesis/MeShClust/bin/meshclust ../EST_data/Parasteatodatepidariorum.fasta --id 0.${1} --kmer 5 --delta 5 --output Parasteatodatepidariorum_clusters/Parasteatodatepidariorum_0_${1}.clstr --iterations 20 --align --sample 3000 --pivot 40 --threads 1
~/thesis/MeShClust/bin/meshclust ../EST_data/Steatodagrossa.fasta --id 0.${1} --kmer 5 --delta 5 --output Steatodagrossa_clusters/Steatodagrossa_0_${1}.clstr --iterations 20 --align --sample 3000 --pivot 40 --threads 1


