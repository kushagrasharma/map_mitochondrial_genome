from Bio.SeqRecord import SeqRecord
from Bio import SeqIO
import numpy as np
import random

m_genome_file = 'chrM.fa'

fasta_sequences = SeqIO.parse(open(m_genome_file),'fasta')

m_genome = next(fasta_sequences).seq

read_forward = []

read_backward = []

while len(read_forward) < 10000000:
    if len(read_forward) % 10000 == 0:
    	print(len(read_forward))
    read_len = int(np.random.normal(200, 60))
    if read_len < 60:
        continue

    start_index = random.randint(0, len(m_genome) - read_len)
    read = m_genome[start_index:start_index+read_len]

    forward_read = SeqRecord(read[:60], id="Mito{}".format(len(read_forward)))
    backward_read = SeqRecord(read[-60:].reverse_complement(), id="Mito{}".format(len(read_forward)))

    read_forward.append(forward_read)
    read_backward.append(backward_read)


SeqIO.write(read_forward, "reads/forward_reads.fa", "fasta")
SeqIO.write(read_backward, "reads/backwards_reads.fa", "fasta")
