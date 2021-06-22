#$ -cwd
#$ -N mito_nuclear
#$ -R y

#$ -l h_vmem=30G
#$ -pe smp 4
#$ -binding linear:4

#$ -l h_rt=48:00:00
#$ -l s_rt=48:00:00

echo "START" > /home/unix/kushagra/map_mitochondrial_genome/align_mito_reads_to_nuclear.log
source /broad/software/scripts/useuse;
use Anaconda3;
eval "$(conda shell.bash hook)";
source activate /broad/hptmp/kushagra/map_mitochondrial_genome/;
cd /home/unix/kushagra/map_mitochondrial_genome;
bowtie2 -f -1 ~/map_mitochondrial_genome/reads/forward_reads.fa -2 ~/map_mitochondrial_genome/reads/backwards_reads.fa -x nuclear -S nuclear_alignments.SAM -p 4 && echo "DONE" >> /home/unix/kushagra/map_mitochondrial_genome/index_Hg38.log;
