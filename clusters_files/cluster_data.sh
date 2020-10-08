#! /bin/bash

~/thesis/MeShClust/bin/meshclust ../EST_data/Latrodectushesperus.fasta --id 0.60 --kmer 5 --delta 5 --output Latrodectushesperus.fasta.clstr --iterations 20 --align --sample 3000 --pivot 40 --threads 1
~/thesis/MeShClust/bin/meshclust ../EST_data/Leucaugevenusta_2.fasta --id 0.60 --kmer 5 --delta 5 --output Leucaugevenusta_2.fasta.clstr --iterations 20 --align --sample 3000 --pivot 40 --threads 1
~/thesis/MeShClust/bin/meshclust ../EST_data/Leucaugevenusta.fasta --id 0.60 --kmer 5 --delta 5 --output Leucaugevenusta.fasta.clstr --iterations 20 --align --sample 3000 --pivot 40 --threads 1
~/thesis/MeShClust/bin/meshclust ../EST_data/Nephilaantipodiana.fasta --id 0.60 --kmer 5 --delta 5 --output Nephilaantipodiana.fasta.clstr --iterations 20 --align --sample 3000 --pivot 40 --threads 1
~/thesis/MeShClust/bin/meshclust ../EST_data/Parasteatodatepidariorum.fasta --id 0.60 --kmer 5 --delta 5 --output Parasteatodatepidariorum.fasta.clstr --iterations 20 --align --sample 3000 --pivot 40 --threads 1
~/thesis/MeShClust/bin/meshclust ../EST_data/Steatodagrossa.fasta --id 0.60 --kmer 5 --delta 5 --output Steatodagrossa.fasta.clstr --iterations 20 --align --sample 3000 --pivot 40 --threads 1
